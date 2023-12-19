<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Encuesta.aspx.cs" Inherits="Examen3__CesarSalas.Encuesta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div  >
        <br />
        <br />
    <asp:GridView runat="server" ID="datagrid" PageSize="10" HorizontalAlign="Center"
            CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header"
            RowStyle-CssClass="rows" AllowPaging="True" />

        <br />
        <br />
        <br />

    </div>

    <div class="container text-center" style="color: #FFFFFF">
        Nombre:<asp:TextBox ID="tnombre" Class="form-control" runat="server" ></asp:TextBox>
        Email:<asp:TextBox ID="temail" class="form-control" runat="server"  ></asp:TextBox>
        Edad:<asp:TextBox ID="tedad" class="form-control" runat="server"  ></asp:TextBox>
        Partido_Politico:<asp:TextBox ID="tpolitico" class="form-control" runat="server"  ></asp:TextBox>
        <br />

    </div>
    <div class="container text-center">

       

        <asp:Button ID="Button1" class="btn btn-outline-primary" runat="server" Text="Agregar" OnClick="Button1_Click" />

 </div>

</asp:Content>
