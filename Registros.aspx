<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Registros.aspx.cs" Inherits="Examen3__CesarSalas.Registros" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <asp:GridView runat="server" ID="datagrid" PageSize="10" HorizontalAlign="Center"
                CssClass="table table-bordered table-striped" PagerStyle-CssClass="pager"
                HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True"
                AutoGenerateColumns="True" />
</asp:Content>
