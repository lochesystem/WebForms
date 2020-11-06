<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Import Namespace="Models" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>ASP.NET CRUD</h1>
    </div>

    <div class="row">
        <div class="col-md-12">
            <h2 class="col-md-12">Inserção de dados</h2><br/><hr/><br/>
            <h3 style="margin-left: 10px;">
                Cadastrar pessoa:
            </h3><hr/>
            <span style="margin-left: 10px;">Nome: </span> <asp:TextBox ID="TbNome" runat="server"></asp:TextBox>
            <span style="margin-left: 10px;">Cpf:  </span>  <asp:TextBox ID="TbCpf" runat="server"></asp:TextBox><hr/>
            <h3 style="margin-left: 10px;">
                Endereço:
            </h3><hr/>
            <span style="margin-left: 10px;">Logradouro:  </span>  <asp:TextBox ID="TbLogradouro" runat="server"></asp:TextBox> 
            <span style="margin-left: 10px;">Numero:  </span>  <asp:TextBox ID="TbNumero" runat="server"></asp:TextBox>
            <span style="margin-left: 10px;">Cep:  </span>  <asp:TextBox ID="TbCep" runat="server"></asp:TextBox>
            <span style="margin-left: 10px;">Bairro:  </span>  <asp:TextBox ID="TbBairro" runat="server"></asp:TextBox>
            <span style="margin-left: 10px;">Cidade:  </span>  <asp:TextBox ID="TbCidade" runat="server"></asp:TextBox>
            <span style="margin-left: 10px;">Estado:  </span>  <asp:TextBox ID="TbEstado" runat="server"></asp:TextBox><hr style="margin-top: 10px;"/>

            <hr/>
            <h3 style="margin-left: 10px;">
                Telefones:
            </h3><hr/>
            <span style="margin-left: 10px;">DDD:  </span>  <asp:TextBox ID="TbDDD" runat="server"></asp:TextBox> 
            <span style="margin-left: 10px;">Numero:  </span>  <asp:TextBox ID="TbNumeroTelefone" runat="server"></asp:TextBox> 
            <asp:Button ID="Button1" runat="server" OnClick="Bt_Adicionar_Telefone" Text="Adicionar" /><br/>
            
            <%
                var list = ((List<Telefone>)this.Application["TELEFONES"]);
                if (list == null) list = new List<Telefone>();
                foreach (var x in list) { %>
                (<%= x.Ddd %>) <%= x.Numero %> <br/>
            <% };%>
          
            <asp:Button ID="Button5" runat="server" OnClick="Bt_Limpar_Telefones" Text="Limpar" />
            <br/><hr/>
            <asp:Button ID="Button4" runat="server" OnClick="Button1_Click" Text="Salvar" /><br/>
            <br/>
            <asp:Label runat="server" ID="LblCadastro"></asp:Label>

        </div>

        <div class="col-md-12">
            <h2>Alteração de dados</h2>
            <p>Alterar pessoa:</p><br/>
            <span style="">Cpf:  </span>  <asp:TextBox ID="TbBuscarCpf" runat="server"></asp:TextBox> 
            <asp:Button ID="Button2" runat="server" OnClick="Bt_Buscar_Click" Text="Buscar" /><br/>
            
            <%
                var pessoa = ((Pessoa) this.Application["PESSOA_ALTERAR"]);

                if (pessoa != null && !string.IsNullOrEmpty(pessoa.Nome)) { %>
                <h4 style="margin-left: 10px;">
                Dados Pessoais Atuais:
                </h4><br/>
                <asp:Label runat="server" ID="LblNomePre"> Nome:</asp:Label><asp:Label runat="server" ID="LblNome"></asp:Label><br/>
                <asp:Label runat="server" ID="LblCpfPre"> Cpf:</asp:Label><asp:Label runat="server" ID="LblCpf"></asp:Label><br/>
                <asp:Label runat="server" ID="LblRuaPre"> Logradouro:</asp:Label><asp:Label runat="server" ID="LblRua"></asp:Label><br/>
                <asp:Label runat="server" ID="LblNumeropre"> Numero:</asp:Label><asp:Label runat="server" ID="LblNumero"></asp:Label><br/>
                <asp:Label runat="server" ID="LblBairroPre"> Bairro:</asp:Label><asp:Label runat="server" ID="LblBairro"></asp:Label><br/>
                <asp:Label runat="server" ID="LblCidadePre"> Cidade:</asp:Label><asp:Label runat="server" ID="LblCidade"></asp:Label><br/>
                <asp:Label runat="server" ID="LblEstadoPre"> Estado:</asp:Label><asp:Label runat="server" ID="LblEstado"></asp:Label><br/>
                <asp:Label runat="server" ID="LblCepPre"> Cep:</asp:Label><asp:Label runat="server" ID="LblCep"></asp:Label><br/>
                
                <%
                    var listAtuais = pessoa.Telefones;
                    if (listAtuais == null) listAtuais = new List<Telefone>();
                    foreach (var x in listAtuais) { %>
                    Telefone: (<%= x.Ddd %>) <%= x.Numero %> <br/>
                <% };%>

                <hr/>
                <h4 style="margin-left: 10px;">
                    Dados Pessoais Para Alterar:
                </h4><br/>
                <span style="margin-left: 10px; margin-bottom: 10px;">Nome: </span> <asp:TextBox ID="TbAlterarNome" runat="server"></asp:TextBox><br/>
                <hr/><h4 style="margin-left: 10px; margin-top: 10px;">
                    Endereço:
                </h4>
                <span style="margin-left: 10px;">Logradouro:  </span>  <asp:TextBox ID="TbAlterarLogradouro" runat="server"></asp:TextBox> 
                <span style="margin-left: 10px;">Numero:  </span>  <asp:TextBox ID="TbAlterarNumero" runat="server"></asp:TextBox>
                <span style="margin-left: 10px;">Cep:  </span>  <asp:TextBox ID="TbAlterarCep" runat="server"></asp:TextBox>
                <span style="margin-left: 10px;">Bairro:  </span>  <asp:TextBox ID="TbAlterarBairro" runat="server"></asp:TextBox>
                <span style="margin-left: 10px;">Cidade:  </span>  <asp:TextBox ID="TbAlterarCidade" runat="server"></asp:TextBox>
                <span style="margin-left: 10px;">Estado:  </span>  <asp:TextBox ID="TbAlterarEstado" runat="server"></asp:TextBox><hr style="margin-top: 10px;"/>
                <hr/>
                <h4 style="margin-left: 10px;">
                    Telefones:
                </h4><hr/>
                <span style="margin-left: 10px;">DDD:  </span>  <asp:TextBox ID="TbAlterarDdd" runat="server"></asp:TextBox> 
                <span style="margin-left: 10px;">Numero:  </span>  <asp:TextBox ID="TbAlterarTelefone" runat="server"></asp:TextBox> 
                <asp:Button ID="Button6" runat="server" OnClick="Bt_Alterar_Adicionar_Telefone" Text="Adicionar" />
                <asp:Button ID="Button7" runat="server" OnClick="Bt_Alterar_Remover_Telefone" Text="Remover" /><br/><br/>
                <asp:Button ID="Button8" runat="server" OnClick="Bt_Salvar_Alteracao" Text="Salvar" />
            <% } %>

        </div>

        <div class="col-md-12">
            <h2>Exclusão de dados</h2>
            <p>Deletar pessoa:</p><br/>
            
            <span style="">Cpf:  </span>  <asp:TextBox ID="TbDeletarCpf" runat="server"></asp:TextBox> 
            <asp:Button ID="Button3" runat="server" OnClick="Bt_Deletar_Click" Text="Deletar" />
            <asp:Label runat="server" ID="LblDeletarInfo"></asp:Label>
            <br/> 
        </div>

        <p>&nbsp;</p>
    </div>
</asp:Content>
