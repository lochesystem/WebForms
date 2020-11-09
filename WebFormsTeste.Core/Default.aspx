<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Import Namespace="Models" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>ASP.NET CRUD Pessoa</h1>
    </div>

    <form class="form-inline">
        <div class="row">
            <div class="col-md-12">
                <h3>Inserção de dados</h3>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">Cadastrar pessoa</div>
                    <div class="panel-body">

                        <div class="form-group">
                            <label for="TbNome">Nome</label>
                            <asp:TextBox type="text" CssClass="form-control" ID="TbNome" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="TbCpf">Cpf</label>
                            <asp:TextBox type="text" CssClass="form-control" ID="TbCpf" runat="server"></asp:TextBox>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">Endereço</div>
                    <div class="panel-body">

                        <div class="form-group col-sm-10">
                            <label for="TbLogradouro">Logradouro</label>
                            <asp:TextBox type="text" CssClass="form-control" ID="TbLogradouro" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group col-sm-2">
                            <label for="TbNumero">Numero</label>
                            <asp:TextBox type="text" CssClass="form-control" ID="TbNumero" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group col-sm-2">
                            <label for="TbCep">Cep</label>
                            <asp:TextBox type="text" CssClass="form-control" ID="TbCep" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group col-sm-10">
                            <label for="TbBairro">Bairro</label>
                            <asp:TextBox type="text" CssClass="form-control" ID="TbBairro" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="TbCidade">Cidade</label>
                            <asp:TextBox type="text" CssClass="form-control" ID="TbCidade" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="TbEstado">Estado</label>
                            <asp:TextBox type="text" CssClass="form-control" ID="TbEstado" runat="server"></asp:TextBox>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">Telefones</div>
                    <div class="panel-body">
                        <div class="form-group col-sm-6">
                            <label for="TbDDD">DDD</label>
                            <asp:TextBox CssClass="form-control" ID="TbDDD" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group col-sm-6">
                            <label for="TbNumeroTelefone">Numero</label>
                            <asp:TextBox CssClass="form-control" ID="TbNumeroTelefone" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group col-sm-12">
                            <asp:Button CssClass="form-control btn btn-primary" ID="Button1" runat="server" OnClick="Bt_Adicionar_Telefone" Text="ADICIONAR" />
                        </div>
                        <br />
                        <div>
                            <%
                                var list = ((List<Telefone>)this.Application["TELEFONES"]) ?? new List<Telefone>();
                                foreach (var x in list)
                                { %>
                            <p>(<%= x.Ddd %>) <%= x.Numero %></p>
                            <% };%>
                        </div>

                        <% if (list.Any())
                            { %>
                        <br />
                        <div class="form-group col-sm-12">
                            <asp:Button CssClass="form-control btn btn-default" ID="Button5" runat="server" OnClick="Bt_Limpar_Telefones" Text="LIMPAR" />
                        </div>
                        <% } %>
                        <div class="form-group col-sm-12">
                            <asp:Button CssClass="form-control btn btn-success" ID="Button4" runat="server" OnClick="Button1_Click" Text="SALVAR" />
                        </div>
                        <br />
                        <asp:Label runat="server" ID="LblCadastro"></asp:Label>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <h3>Exclusão de dados</h3>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">Exclusão por CPF</div>
                    <div class="panel-body">
                        <div class="row" style="margin: 10px;">
                            <div class="form-group col-md-9">
                                <label for="TbDeletarCpf">Cpf</label>
                                <asp:TextBox CssClass="form-control" ID="TbDeletarCpf" runat="server"></asp:TextBox>
                            </div>

                            <div class="form-group col-md-3">
                                <label style="color: #fff;">.</label>
                                <asp:Button CssClass="form-control btn btn-danger" ID="Button9" runat="server" OnClick="Bt_Deletar_Click" Text="Deletar" Style="height: 34px;" />
                            </div>
                            <div class="form-group col-sm-12">
                                <asp:Label runat="server" ID="LblDeletarInfo"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <h3>Alteração de dados</h3>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">Alterar pessoa</div>
                    <div class="panel-body">
                        <div class="row" style="margin: 10px;">
                            <div class="col-md-9">
                                <div class="form-group">
                                    <label for="TbBuscarCpf">Cpf</label>
                                    <asp:TextBox CssClass="form-control" ID="TbBuscarCpf" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label style="color: #fff;">.</label>
                                    <asp:Button CssClass="form-control btn btn-primary" ID="Button2" runat="server" OnClick="Bt_Buscar_Click" Text="Buscar" Style="height: 34px;" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <%
                        var pessoa = ((Pessoa)this.Application["PESSOA_ALTERAR"]);

                        if (pessoa != null && !string.IsNullOrEmpty(pessoa.Nome))
                        { %>

                    <div style="margin: 10px;" class="row">
                        <div class="col-md-12">
                            <h4>Dados Pessoais Atuais</h4>
                            <hr />
                        </div>
                    </div>

                    <div class="row" style="margin: 10px;">
                        <div class="col-md-1">
                            <strong>Nome:</strong>
                        </div>
                        <div class="col-md-8">
                            <asp:Label runat="server" ID="LblNome"></asp:Label>
                        </div>
                        <div class="col-md-1">
                            <strong>Cpf:</strong>
                        </div>
                        <div class="col-md-2">
                            <asp:Label runat="server" ID="LblCpf"></asp:Label>
                        </div>
                    </div>

                    <div style="margin: 10px;" class="row">
                        <div class="col-md-12">
                            <strong>Endereço:</strong>
                        </div>
                    </div>

                    <div style="margin: 10px;" class="row">
                        <div class="col-md-12">
                            <table class="table table-striped">
                                <tr>
                                    <th class="default">Logradouro
                                    </th>
                                    <th class="default">Numero
                                    </th>
                                    <th class="default">Bairro
                                    </th>
                                    <th class="default">Cidade
                                    </th>
                                    <th class="default">Estado
                                    </th>
                                    <th class="default">Cep
                                    </th>
                                </tr>
                                <tr>
                                    <td class="default">
                                        <asp:Label runat="server" ID="LblRua"></asp:Label>
                                    </td>
                                    <td class="default">
                                        <asp:Label runat="server" ID="LblNumero"></asp:Label>
                                    </td>
                                    <td class="default">
                                        <asp:Label runat="server" ID="LblBairro"></asp:Label>
                                    </td>
                                    <td class="default">
                                        <asp:Label runat="server" ID="LblCidade"></asp:Label>
                                    </td>
                                    <td class="default">
                                        <asp:Label runat="server" ID="LblEstado"></asp:Label>
                                    </td>
                                    <td class="default">
                                        <asp:Label runat="server" ID="LblCep"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <div style="margin: 10px;" class="row">
                        <div class="col-md-12">
                            <strong>Telefones:</strong>
                        </div>
                    </div>

                    <div style="margin: 10px;" class="row">
                        <div class="col-md-12">
                            <table class="table table-striped">

                                <%
                                    var listAtuais = pessoa.Telefones;
                                    if (listAtuais == null) listAtuais = new List<Telefone>();
                                    foreach (var x in listAtuais)
                                    { %>
                                <tr>
                                    <td class="default">(<%= x.Ddd %>)
                                    </td>
                                    <td class="default">
                                        <%= x.Numero %>
                                    </td>
                                </tr>
                                <% };%>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">Dados Pessoais Para Alterar</div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label for="TbAlterarNome">Nome</label>
                            <asp:TextBox CssClass="form-control" ID="TbAlterarNome" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">Endereço Para Alterar</div>
                    <div class="panel-body">
                        <div class="form-group col-sm-10">
                            <label for="TbAlterarLogradouro">Logradouro</label>
                            <asp:TextBox CssClass="form-control" ID="TbAlterarLogradouro" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group col-sm-2">
                            <label for="TbAlterarNumero">Numero</label>
                            <asp:TextBox CssClass="form-control" ID="TbAlterarNumero" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group col-sm-2">
                            <label for="TbAlterarCep">Cep</label>
                            <asp:TextBox CssClass="form-control" ID="TbAlterarCep" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group col-sm-10">
                            <label for="TbAlterarBairro">Bairro</label>
                            <asp:TextBox CssClass="form-control" ID="TbAlterarBairro" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group col-sm-6">
                            <label for="TbAlterarCidade">Cidade</label>
                            <asp:TextBox CssClass="form-control" ID="TbAlterarCidade" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group col-sm-6">
                            <label for="TbAlterarEstado">Estado</label>
                            <asp:TextBox CssClass="form-control" ID="TbAlterarEstado" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">Telefones</div>
                    <div class="panel-body">

                        <div class="form-group col-sm-6">
                            <label for="TbAlterarDdd">DDD</label>
                            <asp:TextBox CssClass="form-control" ID="TbAlterarDdd" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group col-sm-6">
                            <label for="TbAlterarTelefone">Numero</label>
                            <asp:TextBox CssClass="form-control" ID="TbAlterarTelefone" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group col-sm-6">
                            <asp:Button CssClass="form-control btn btn-primary" type="button" ID="Button6" runat="server" OnClick="Bt_Alterar_Adicionar_Telefone" Text="Adicionar" />
                        </div>

                        <div class="form-group col-sm-6">
                            <asp:Button CssClass="form-control btn btn-danger" ID="Button7" runat="server" OnClick="Bt_Alterar_Remover_Telefone" Text="Remover" />
                        </div>

                        <div class="form-group col-sm-12">
                            <asp:Button CssClass="form-control btn btn-success" ID="Button8" runat="server" OnClick="Bt_Salvar_Alteracao" Text="Salvar" />
                        </div>

                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </form>

</asp:Content>
