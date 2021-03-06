<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListadoTomos.aspx.cs" Inherits="Proyecto3Capas.Catalogos.Tomos.ListadoTomos" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit"%>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1" style="scroll-margin-left: 40px; top: 0px; left: 0px;">
                <h3>LISTADO DE TOMOS</h3>
                <asp:GridView ID="GVTomos" CssClass="table tabble-table-bordered table-stripoed table-condensed" runat="server" AutoGenerateColumns="false" OnRowDeleting="GVTomos_RowDeleting" DataKeyNames="IdTomo" OnRowEditing="GVTomos_RowEditing" OnRowCancelingEdit="GVTomos_RowCancelingEdit" OnRowUpdating="GVTomos_RowUpdating" OnRowCommand="GVTomos_RowCommand">
                    <Columns>
                        <asp:ButtonField Text="Seleccionar" CommandName="select" ButtonType="Button" ControlStyle-CssClass="btn btn-success btn-xs" />
                        <asp:CommandField ShowDeleteButton="true" ButtonType="Button" ControlStyle-CssClass="btn btn-danger btn-xs" />
                        <asp:CommandField ShowEditButton="true" ButtonType="Button" ControlStyle-CssClass="btn btn-primary btn-xs" />

                        <asp:BoundField HeaderText="idTomo" ItemStyle-Width="50px" ReadOnly="true" DataField="idTomo" />

                        <asp:BoundField HeaderText="Titulo" ItemStyle-Width="150px" DataField="Titulo" />
                        

                        <asp:BoundField HeaderText="Precio" ItemStyle-Width="150px" DataField="Precio" readonly="true"/>
                        <asp:BoundField HeaderText="Stock" ItemStyle-Width="150px" DataField="Stock" readonly="true"/>
                        <asp:TemplateField HeaderText="Tipo manga">
                            <ControlStyle Width="200px"/>
                            <ItemTemplate>
                                <asp:Label ID="lblTipoManga" Text='<%#Eval("Genero") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="DDLTipoManga" CssClass="form-control" runat="server"></asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:ImageField HeaderText="Foto" ReadOnly="true" ItemStyle-Width="120px" ControlStyle-Width="120px" ControlStyle-Height="90px" DataImageUrlField="UrlFoto"></asp:ImageField>
                        
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
