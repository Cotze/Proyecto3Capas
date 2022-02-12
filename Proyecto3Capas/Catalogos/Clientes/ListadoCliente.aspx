<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListadoCliente.aspx.cs" Inherits="Proyecto3Capas.Catalogos.Clientes.ListadoCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1" style="scroll-margin-left: 40px; top: 0px; left: 0px;">
                <h3>LISTADO DE CLIENTES</h3>
                <asp:GridView ID="GVClientes" CssClass="table tabble-table-bordered table-stripoed table-condensed" runat="server" AutoGenerateColumns="false" OnRowCommand="GVClientes_RowCommand" DataKeyNames="IdCliente" OnRowDeleting="GVClientes_RowDeleting" OnRowEditing="GVClientes_RowEditing" OnRowUpdating="GVClientes_RowUpdating" ONRowCancelingEdit="GVClientes_RowCancelingEdit">
                    <Columns>
                        <asp:ButtonField Text="Seleccionar" CommandName="select" ButtonType="Button" ControlStyle-CssClass="btn btn-success btn-xs" />
                        <asp:CommandField ShowDeleteButton="true" ButtonType="Button" ControlStyle-CssClass="btn btn-danger btn-xs" />
                        <asp:CommandField ShowEditButton="true" ButtonType="Button" ControlStyle-CssClass="btn btn-primary btn-xs" />

                        <asp:BoundField HeaderText="Cliente" ItemStyle-Width="50px" ReadOnly="true" DataField="idCliente" />
                        <asp:BoundField HeaderText="Nombre" ItemStyle-Width="150px" DataField="Nombre" />
                        <asp:BoundField HeaderText="ApPaterno" ItemStyle-Width="150px" DataField="ApPaterno" />
                        <asp:BoundField HeaderText="ApMaterno" ItemStyle-Width="150px" DataField="ApMaterno" />
                        <asp:BoundField HeaderText="RFC" ItemStyle-Width="80px" DataField="RFC" ReadOnly="true" />
                        <asp:BoundField HeaderText="Telefono" ItemStyle-Width="80px" DataField="Telefono" ReadOnly="true"/>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        
    </div>
</asp:Content>
