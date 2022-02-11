<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListadoTomos.aspx.cs" Inherits="Proyecto3Capas.Catalogos.Tomos.ListadoTomos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1" style="scroll-margin-left: 40px; top: 0px; left: 0px;">
                <h3>LISTADO DE TOMOS</h3>
                <asp:GridView ID="GVTomos" CssClass="table tabble-table-bordered table-stripoed table-condensed" runat="server" AutoGenerateColumns="false" OnRowDeleting="GVTomos_RowDeleting" DataKeyNames="IdTomo">
                    <Columns>
                        <asp:ButtonField Text="Seleccionar" CommandName="select" ButtonType="Button" ControlStyle-CssClass="btn btn-success btn-xs" />
                        <asp:CommandField ShowDeleteButton="true" ButtonType="Button" ControlStyle-CssClass="btn btn-danger btn-xs" />
                        <asp:CommandField ShowEditButton="true" ButtonType="Button" ControlStyle-CssClass="btn btn-primary btn-xs" />
                        <asp:ImageField HeaderText="Foto" ReadOnly="true" ItemStyle-Width="120px" ControlStyle-Width="120px" ControlStyle-Height="90px" DataImageUrlField="UrlFoto"></asp:ImageField>

                        <asp:BoundField HeaderText="Chofer" ItemStyle-Width="50px" ReadOnly="true" DataField="idTomo" />
                        <asp:BoundField HeaderText="Titulo" ItemStyle-Width="150px" DataField="Titulo" />
                        <asp:BoundField HeaderText="Precio" ItemStyle-Width="150px" DataField="Precio" />
                        <asp:BoundField HeaderText="Stock" ItemStyle-Width="150px" DataField="Stock" />
                        <asp:BoundField HeaderText="Genero" ItemStyle-Width="80px" DataField="Genero" ReadOnly="true" />

                        <asp:TemplateField HeaderText="Disponible" ItemStyle-Width="50px">
                            <ItemTemplate>
                                <div style="width: 100%">
                                    <div style="width: 25%; margin: 0 auto;">
                                        <asp:CheckBox ID="chkDisponible" runat="server" Checked='<%#Eval("Disponibilidad")%>' Enabled="false" />
                                    </div>
                                </div>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div style="width: 100%">
                                    <div style="width: 25%; margin: 0 auto;">
                                        <asp:CheckBox ID="chkEditDisponible" runat="server" Checked='<%#Eval("Disponibilidad")%>'/>
                                    </div>
                                </div>
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
