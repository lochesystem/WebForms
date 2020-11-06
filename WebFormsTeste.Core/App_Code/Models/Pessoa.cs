using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Models
{
    /// <summary>
    /// Summary description for Pessoa
    /// </summary>
    public class Pessoa
    {
        [ScaffoldColumn(false)]
        public int Id { get; set; }

        [Required, StringLength(100), Display(Name = "Nome")]
        public string Nome { get; set; }

        [Required, StringLength(100), Display(Name = "Cpf")]
        public long Cpf { get; set; }

        public int EnderecoId { get; set; }
        public Endereco Endereco { get; set; }

        public List<Telefone> Telefones { get; set; }

        public Pessoa()
        {
            Telefones = new List<Telefone>();

            Endereco = new Endereco();
        }
    }
}