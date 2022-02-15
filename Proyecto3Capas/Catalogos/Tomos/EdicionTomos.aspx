<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EdicionTomos.aspx.cs" Inherits="Proyecto3Capas.Catalogos.Tomos.EdicionTomos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-col-md-12">
                <h3>EDICION DE TOMOS</h3>

            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-btn-group">
                    <label for="<%=txtTitulo.ClientID %>">Titulo del Tomo</label>
                    <asp:TextBox ID="txtTitulo" CssClass="form-control" runat="server" MaxLength="150" ReadOnly="true"></asp:TextBox>
                    
                </div>
            </div>
            <div class="col-md-12">
                <div class="form-btn-group">
                    <label for="<%=txtPrecio.ClientID %>">Precio de Tomo</label>
                    <asp:TextBox ID="txtPrecio" placeholder="Precio de Tomo" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtPrecio" CssClass="text-danger" runat="server" ErrorMessage="Precio de tomo requerido"></asp:RequiredFieldValidator>

                    <%--aca va la mascara de precio--%>
                  <ajaxToolkit:MaskedEditExtender ID="MskNumber" Mask="99.99" TargetControlID="txtPrecio" ClearMaskOnLostFocus="false" runat="server"/>

                </div>
            </div>
            <div class="col-md-12">
                <div class="form-btn-group">
                    <label for="<%=txtStock.ClientID %>">Stock</label>
                    <asp:TextBox ID="txtStock" placeholder="Cuantos tomos" CssClass="form-control" runat="server" MaxLength="150"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtStock" CssClass="text-danger" runat="server" ErrorMessage="Cantidad de stock requerida"></asp:RequiredFieldValidator>
                    <ajaxToolkit:MaskedEditExtender ID="MaskeStock" Mask="99" TargetControlID="txtStock" ClearMaskOnLostFocus="false" runat="server"/>
                </div>
            </div>
            <div class="col-md-12">
                <div class="form-btn-group">
                    <label for="<%=txtGenero.ClientID %>">Genero</label>
                    <asp:TextBox ID="txtGenero" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
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
