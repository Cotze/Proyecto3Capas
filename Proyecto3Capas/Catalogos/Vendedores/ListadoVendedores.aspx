<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListadoVendedores.aspx.cs" Inherits="Proyecto3Capas.Catalogos.Vendedores.ListadoVendedores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1" style="scroll-margin-left: 40px;">
                <h3>LISTADO DE VENDEDORES</h3>
                <asp:GridView ID="GVVendedores" CssClass="table tabble-table-bordered table-stripoed table-condensed" runat="server" AutoGenerateColumns="false" OnRowDeleting="GVVendedores_RowDeleting" DataKeyNames="IdVendedor">
                    <Columns>
                        <asp:ButtonField Text="Seleccionar" CommandName="select" ButtonType="Button" ControlStyle-CssClass="btn btn-success btn-xs" />
                        <asp:CommandField ShowDeleteButton="true" ButtonType="Button" ControlStyle-CssClass="btn btn-danger btn-xs" />
                        <asp:CommandField ShowEditButton="true" ButtonType="Button" ControlStyle-CssClass="btn btn-primary btn-xs" />
                        <asp:ImageField HeaderText="Foto" ReadOnly="true" ItemStyle-Width="120px" ControlStyle-Width="120px" ControlStyle-Height="90px" DataImageUrlField="UrlFoto"></asp:ImageField>

                        <asp:BoundField HeaderText="Vendedor" ItemStyle-Width="50px" ReadOnly="true" DataField="idVendedor" />
                        <asp:BoundField HeaderText="Nombre" ItemStyle-Width="150px" DataField="Nombre" />
                        <asp:BoundField HeaderText="ApPaterno" ItemStyle-Width="150px" DataField="ApPaterno" />
                        <asp:BoundField HeaderText="ApMaterno" ItemStyle-Width="150px" DataField="ApMaterno" />
                        <asp:BoundField HeaderText="Puesto" ItemStyle-Width="80px" DataField="Puesto" ReadOnly="true" />


                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
