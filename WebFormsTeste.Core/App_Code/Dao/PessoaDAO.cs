using System;
using System.Collections.Generic;
using Dapper;
using Models;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

/// <summary>
/// Summary description for PessoaDAO
/// </summary>
public class PessoaDAO
{
    public PessoaDAO()
    {
        
    }

    public bool InserirPessoa(Pessoa pessoa)
    {
        using (IDbConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            var resultado = 0;

            if (db.State == ConnectionState.Closed)
            {
                db.Open();
            }
            var p = new DynamicParameters();

            p.AddDynamicParams(new
            {
                pessoa.Nome, pessoa.Cpf,
                pessoa.Endereco.Logradouro, pessoa.Endereco.Numero, pessoa.Endereco.Bairro, pessoa.Endereco.Cep,
                pessoa.Endereco.Cidade, pessoa.Endereco.Estado
            });

            var idPessoa = db.QueryFirstOrDefault<int>("sp_Pessoa_Inserir", p, commandType: CommandType.StoredProcedure);
            
            if (idPessoa > 0)
            {
                foreach (var telefone in pessoa.Telefones)
                {
                    var p2 = new DynamicParameters();

                    p2.AddDynamicParams(new
                    {
                        PessoaId = idPessoa,
                        telefone.Ddd,
                        telefone.Numero
                    });

                    resultado = db.Execute("sp_Pessoa_Telefone_Inserir", p2, commandType: CommandType.StoredProcedure);
                }
            }

            return resultado > 0;
        }
    }

    public bool AtualizarPessoa(Pessoa pessoa)
    {
        using (IDbConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            if (db.State == ConnectionState.Closed)
            {
                db.Open();
            }
            var p = new DynamicParameters();

            p.AddDynamicParams(new
            {
                pessoa.Id,
                pessoa.Nome,
                pessoa.Endereco.Logradouro,
                pessoa.Endereco.Numero,
                pessoa.Endereco.Bairro,
                pessoa.Endereco.Cep,
                pessoa.Endereco.Cidade,
                pessoa.Endereco.Estado
            });

            var resultado = db.Execute("sp_Pessoa_Atualizar", p, commandType: CommandType.StoredProcedure);

            foreach (var telefone in pessoa.Telefones)
            {
                var p2 = new DynamicParameters();

                p2.AddDynamicParams(new
                {
                    PessoaId = pessoa.Id,
                    telefone.Ddd,
                    telefone.Numero
                });

                resultado = db.Execute("sp_Pessoa_Telefone_Inserir", p2, commandType: CommandType.StoredProcedure);
            }
            

            return resultado > 0;
        }
    }

    public Pessoa GetPessoaPorCpf(long cpf)
    {
        using (IDbConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            if (db.State == ConnectionState.Closed)
            {
                db.Open();
            }
            var p = new DynamicParameters();

            p.AddDynamicParams(new
            {
                Cpf = cpf
            });
            var resultado = new Pessoa();

            using (var multi = db.QueryMultiple("sp_Get_Pessoa_Por_Cpf", p, commandType: CommandType.StoredProcedure))
            {
                try
                {
                    resultado = multi.ReadFirst<Pessoa>();
                    var endereco = multi.ReadFirst<Endereco>();
                    var telefones = multi.Read<Telefone>().ToList();
                    resultado.Endereco = endereco;
                    resultado.Telefones = telefones;
                }
                catch (Exception ex)
                {
                    resultado = new Pessoa();
                }
            }

            return resultado;
        }
    }

    public bool DeletarPessoa(long cpf)
    {
        using (IDbConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            if (db.State == ConnectionState.Closed)
            {
                db.Open();
            }
            var p = new DynamicParameters();

            p.AddDynamicParams(new
            {
                Cpf = cpf
            });

            var resultado = db.Execute("sp_Pessoa_Deletar", p, commandType: CommandType.StoredProcedure);

            return resultado != 0;
        }
    }
}