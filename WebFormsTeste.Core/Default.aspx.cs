using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Application["PESSOA_ALTERAR"] = null;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        var pessoa = new PessoaDAO();
        var telefones = ((List<Telefone>) this.Application["TELEFONES"]);

        if(telefones == null) telefones = new List<Telefone>();
        var resultado = pessoa.InserirPessoa(new Pessoa
        {
            Cpf = Convert.ToInt64(TbCpf.Text),
            Nome = TbNome.Text,
            Endereco = new Endereco
            {
                Logradouro = TbLogradouro.Text,
                Numero = Convert.ToInt32(TbNumero.Text),
                Bairro = TbBairro.Text,
                Cep = Convert.ToInt32(TbCep.Text),
                Cidade = TbCidade.Text,
                Estado = TbEstado.Text
            },
            Telefones = telefones

        });

        if (resultado)
        {
            this.Application["TELEFONES"] = new List<Telefone>();
            this.LblCadastro.Text = "Pessoa Cadastrada";
        }
        else
        {
            this.Application["TELEFONES"] = new List<Telefone>();
            this.LblCadastro.Text = "Ocorreu um problema no cadastro";
        }
    }

    protected void Bt_Buscar_Click(object sender, EventArgs e)
    {
        var cpf = Convert.ToInt64(TbBuscarCpf.Text);

        var pessoaDAO = new PessoaDAO();

        var pessoa = pessoaDAO.GetPessoaPorCpf(cpf);

        this.Application["PESSOA_ALTERAR"] = pessoa;
        this.Session["PESSOA_ALTERAR"] = pessoa;

        LblNome.Text       = pessoa.Nome;
        LblCpf.Text        = pessoa.Cpf.ToString();
        LblRua.Text        = pessoa.Endereco.Logradouro;
        LblNumero.Text     = pessoa.Endereco.Numero.ToString();
        LblBairro.Text     = pessoa.Endereco.Bairro;
        LblCidade.Text     = pessoa.Endereco.Cidade;
        LblEstado.Text     = pessoa.Endereco.Estado;
        LblCep.Text        = pessoa.Endereco.Cep.ToString();

        TbAlterarNome.Text = pessoa.Nome;
        TbAlterarLogradouro.Text = pessoa.Endereco.Logradouro;
        TbAlterarNumero.Text = pessoa.Endereco.Numero.ToString();
        TbAlterarBairro.Text = pessoa.Endereco.Bairro;
        TbAlterarCidade.Text = pessoa.Endereco.Cidade;
        TbAlterarEstado.Text = pessoa.Endereco.Estado;
        TbAlterarCep.Text = pessoa.Endereco.Cep.ToString();

    }

    protected void Bt_Deletar_Click(object sender, EventArgs e)
    {
        var cpf = Convert.ToInt64(TbDeletarCpf.Text);

        var pessoaDAO = new PessoaDAO();

        var pessoa = pessoaDAO.DeletarPessoa(cpf);

        LblDeletarInfo.Text = pessoa ? "Pessoa Deletada" : "Pessoa não deletada";
    }

    protected void Bt_Adicionar_Telefone(object sender, EventArgs e)
    {
        var lista = ((List<Telefone>)this.Application["TELEFONES"]);

        var listaTelefone = new List<Telefone>()
        {
            new Telefone
            {
                Ddd = Convert.ToInt32(TbDDD.Text),
                Numero = Convert.ToInt32(TbNumeroTelefone.Text)
            }
        };

        if (lista != null)
        {
            lista.AddRange(listaTelefone);
            this.Application["TELEFONES"] = lista;
        }
        else
        {
            this.Application["TELEFONES"] = listaTelefone;
        }

        TbDDD.Text = "";
        TbNumeroTelefone.Text = "";
    }

    protected void Bt_Limpar_Telefones(object sender, EventArgs e)
    {
        this.Application["TELEFONES"] = new List<Telefone>();
    }

    protected void Bt_Alterar_Adicionar_Telefone(object sender, EventArgs e)
    {
        var pessoa = ((Pessoa) this.Session["PESSOA_ALTERAR"]);

        var telefone = new Telefone
        {
            Ddd = Convert.ToInt32(TbAlterarDdd.Text),
            Numero = Convert.ToInt32(TbAlterarTelefone.Text)
        };

        pessoa.Telefones.Add(telefone);

        this.Application["PESSOA_ALTERAR"] = pessoa;
        this.Session["PESSOA_ALTERAR"] = pessoa;
    }

    protected void Bt_Alterar_Remover_Telefone(object sender, EventArgs e)
    {
        var numero = Convert.ToInt32(TbAlterarTelefone.Text);

        var pessoa = ((Pessoa)this.Session["PESSOA_ALTERAR"]);

        if (pessoa.Telefones.Any(x => x.Numero == numero))
        {
            var telefone = pessoa.Telefones.FirstOrDefault(x => x.Numero == numero);

            pessoa.Telefones.Remove(telefone);
        }

        this.Application["PESSOA_ALTERAR"] = pessoa;
        this.Session["PESSOA_ALTERAR"] = pessoa;
    }

    protected void Bt_Salvar_Alteracao(object sender, EventArgs e)
    {
        var pessoa = ((Pessoa)this.Session["PESSOA_ALTERAR"]);
        var pessoaDAO = new PessoaDAO();

        pessoa.Nome = TbAlterarNome.Text;
        pessoa.Endereco.Logradouro = TbAlterarLogradouro.Text;
        pessoa.Endereco.Numero = Convert.ToInt32(TbAlterarNumero.Text);
        pessoa.Endereco.Bairro = TbAlterarBairro.Text;
        pessoa.Endereco.Cidade = TbAlterarCidade.Text;
        pessoa.Endereco.Estado = TbAlterarEstado.Text;
        pessoa.Endereco.Cep = Convert.ToInt32(TbAlterarCep.Text);

        pessoaDAO.AtualizarPessoa(pessoa);
    }
}