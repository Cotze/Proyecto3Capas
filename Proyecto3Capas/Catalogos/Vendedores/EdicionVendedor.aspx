<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EdicionVendedor.aspx.cs" Inherits="Proyecto3Capas.Catalogos.Vendedores.EdicionVendedor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-col-md-12">
                <h3>EDICIÓN FOTO DEL EMPLEADO</h3>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-btn-group">
                        <label for="<%=txtNombre.ClientID %>">Nombre</label>
                        <asp:TextBox ID="txtNombre" placeholder="Nombre completo" CssClass="form-control" runat="server" MaxLength="150" ReadOnly="true"></asp:TextBox>
                        
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-btn-group">
                        <label for="<%=txtApPaterno.ClientID %>">Apellido paterno</label>
                        <asp:TextBox ID="txtApPaterno" placeholder="Apellido paterno" CssClass="form-control" runat="server" MaxLength="150" ReadOnly="true"></asp:TextBox>
                        
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-btn-group">
                        <label for="<%=txtApMaterno.ClientID %>">Apellido materno</label>
                        <asp:TextBox ID="txtApMaterno" placeholder="Apellido materno" CssClass="form-control" runat="server" MaxLength="150" ReadOnly="true"></asp:TextBox>
                        
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-btn-group">
                        <label for="<%=txtPuesto.ClientID %>">Puesto del empleado</label>
                        <asp:TextBox ID="txtPuesto" placeholder="Puesto del empleado" CssClass="form-control" runat="server" MaxLength="150" ReadOnly="true"></asp:TextBox>
                        
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="<%=SubeImagen.ClientID%>">Seleccionar</label>
                        <div class="row">
                            <div class="col-md-3">
                                <input type="file" id="SubeImagen" class="btn btn-file" runat="server" />
                            </div>
                            <div class="col-md-9">
                                <asp:Button ID="btnSubeImagen" CssClass="btn btn-primary" runat="server" Text="Subir" OnClick="btnSubeImagen_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-group">
                        <label>Foto</label>
                        <asp:Image ID="imgFotoChofer" Width="150" Height="100" runat="server" />
                        <label id="urlFoto" runat="server"></label>
                    </div>
                </div>
                <div class="col-md-12 col-md-offset-5">
                    <div class="form-group">
                        <asp:Button ID="btnGuardar" CssClass="btn btn-primary" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
