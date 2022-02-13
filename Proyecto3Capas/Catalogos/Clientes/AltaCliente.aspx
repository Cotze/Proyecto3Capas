<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AltaCliente.aspx.cs" Inherits="Proyecto3Capas.Catalogos.Clientes.AltaCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-col-md-12">
                <h3>ACTUALIZACION DE CLIENTES</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-btn-group">
                    <label for="<%=txtNombre.ClientID %>">Nombre cliente</label>
                    <asp:TextBox ID="txtNombre" placeholder="Nombre del cliente" CssClass="form-control" runat="server" MaxLength="150"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtNombre" CssClass="text-danger" runat="server"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-md-12">
                <div class="form-btn-group">
                    <label for="<%=TxtApPaterno.ClientID %>">Apellido paterno</label>
                    <asp:TextBox ID="TxtApPaterno" placeholder="Apellido paterno" CssClass="form-control" runat="server" MaxLength="150"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TxtApPaterno" CssClass="text-danger" runat="server" Enabled="true"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-md-12">
                <div class="form-btn-group">
                    <label for="<%=TxtApMaterno.ClientID %>">Apellido materno</label>
                    <asp:TextBox ID="TxtApMaterno" placeholder="Apellido materno" CssClass="form-control" runat="server" MaxLength="150"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TxtApMaterno" CssClass="text-danger" runat="server" Enabled="true"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-md-12">
                <div class="form-btn-group">
                    <label for="<%=txtRFC.ClientID %>">RFC</label>
                    <asp:TextBox ID="txtRFC" placeholder="XXXX000000X00" CssClass="form-control" runat="server" MaxLength="13"></asp:TextBox>
                    <div class="col-md-12" style="margin-bottom: 30px;">
                        <div style="position: absolute; top: 0px; left: 0;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtRFC" CssClass="text-danger" runat="server" ErrorMessage="El RFC del cliente es requerido"></asp:RequiredFieldValidator>
                        </div>
                        <div style="position:absolute; top:0; left:0;">
                            <asp:RegularExpressionValidator ID="revtxtRFC" controlToValidate="txtRFC" CssClass="text-danger" ValidationExpression="^[a-z0-9A-Z]{13}$" runat="server" ErrorMessage="El formato del RFC XXXX000000X00"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="form-btn-group">
                    <label for="<%=txtTelefono.ClientID %>">Telefono</label>
                    <asp:TextBox ID="txtTelefono" CssClass="form-control" runat="server" MaxLength="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtTelefono" CssClass="text-danger" runat="server" ErrorMessage="Telefono de chofer es requerido"></asp:RequiredFieldValidator>
                    <%--aca vamos a colocar una mascara--%>
                    <ajaxToolkit:MaskedEditExtender ID="MEEtxtTelefono" TargetControlID="txtTelefono" Mask="(999) 999-9999" ClearMaskOnLostFocus="false" runat="server"/>
                </div>
            </div>
            <div class="col-md-12 col-md-offset-5">
                <div class="form-group">
                    <asp:Button ID="btnGuardar" CssClass="btn btn-primary" runat="server" Text="Guardar" OnClick="btnGuardar_Click"/>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
