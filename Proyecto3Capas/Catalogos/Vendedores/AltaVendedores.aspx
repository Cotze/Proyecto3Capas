<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AltaVendedores.aspx.cs" Inherits="Proyecto3Capas.Catalogos.Vendedores.AltaVendedores" %>

<%--Registramos la referencia al ensamblador AjaxControlTookit--%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="//maps.googleapis.com/maps/api/js?key=AIzaSyCWeeateTaYGqsHhNcmoDfT7Us-vLDZVPs&amp;sensor=false&amp;language=en"></script>
    <style>
        .modalPanel {
            background: #fff;
        }

        .bgpanel {
            background: #0d0d0d;
            opacity: 0.70;
        }
    </style>
    <div class="container">
        <div class="row">
            <div class="col-col-md-12">
                <h3>Registro de vendedor</h3>

            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-btn-group">
                    <label for="<%=txtNombre.ClientID %>">Nombre</label>
                    <asp:TextBox ID="txtNombre" placeholder="Nombre completo" CssClass="form-control" runat="server" MaxLength="150"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtNombre" CssClass="text-danger" runat="server" ErrorMessage="Nombre del vendedor requerido"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-md-12">
                <div class="form-btn-group">
                    <label for="<%=txtApPaterno.ClientID %>">Apellido paterno</label>
                    <asp:TextBox ID="txtApPaterno" placeholder="Apellido paterno" CssClass="form-control" runat="server" MaxLength="150"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtApPaterno" CssClass="text-danger" runat="server" ErrorMessage="Apellido paterno de vendedor requerido"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-md-12">
                <div class="form-btn-group">
                    <label for="<%=txtApMaterno.ClientID %>">Apellido materno</label>
                    <asp:TextBox ID="txtApMaterno" placeholder="Apellido materno" CssClass="form-control" runat="server" MaxLength="150"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtApMaterno" CssClass="text-danger" runat="server" ErrorMessage="Apellido materno de vendedor requerido"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-md-12">
                <div class="form-btn-group">
                    <label for="<%=DDLTipoPuesto %>">Puesto del empleado</label>
                    <asp:DropDownList ID="DDLTipoPuesto" CssClass="form-control" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator ControlToValidate="DDLTipoPuesto" ID="RequiredFieldValidator4" runat="server" CssClass="text-danger" ErrorMessage="Selecciona Puesto"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-md-12">
                <div class="form-btn-group">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="<%=txtPais.ClientID %>">Pais del vendedor</label>
                            <asp:TextBox ID="txtPais" placeholder="Pais del vendedor" CssClass="form-control" runat="server" MaxLength="150"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtPais" CssClass="text-danger" runat="server" ErrorMessage="Pais del vendedor es requerido"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-md-6">
                            <asp:Button ID="btnAddOrigen" CssClass="btn btn-primary btn-xs" runat="server" Text="Obtener Datos" Style="margin-top: 30px;" OnClientClick="getDireccion(1)" />
                            <ajaxToolkit:ModalPopupExtender ID="MPOrigen" TargetControlID="btnAddOrigen" PopupControlID="PnlOrigenDestino" CancelControlID="btnCancelar" BackgroundCssClass="bgpanel" runat="server"></ajaxToolkit:ModalPopupExtender>
                        </div>
                    </div>
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

    <script>
        function getDireccion(fuente) {
            var direccion = "";
            if (fuente == 1) //La dirección es un Origen
            {

                direccion = $("#<%=txtPais.ClientID%>").val();
                //11 sur 305
            }

        }
        //guardar del lado del servidor si el usuario
        //dio click en origen o en destino
        $("#<%=txtEsOD.ClientID%>").val(fuente);

        if (direccion != "") {
            //Llamamos a la api de google maps
            //para obtener los datos completos de la dirección
            var geocoder = new google.maps.Geocoder();

            geocoder.geocode({ 'address': direccion }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    //Traemos los datos completos de la dirección
                    console.log(results);
                    console.log("El conteinente es: ");
                    console.log(results[0].address_components[0].long_name);
                    $("#origen").val(results[0].address_components[0].long_name);
                    console.log(status);
                    var numresults = results[0].address_components.length;
                    //Recorremos cada una de las propiedades de address_components
                    for (var indice = 0; indice < numresults; indice++) {
                        var numresultstypes =
                            results[0].address_components[indice].types.length;
                        //Recorremos los tipos de cada componente de la dirección
                        for (var propiedad = 0; propiedad < numresultstypes; propiedad++) {
                            //Declarar una variable que nos permita saber ell tipo
                            // de propiedad que estamos recorriendo
                            var Tipo = results[0].address_components[indice].types[propiedad]; // ""route""
                            //Descripcion va a contener el valor de la propiedad // street_number
                            var Descripcion =
                                results[0].address_components[indice].long_name; // "Avenida 10 Oriente"
                            //Validamos cada propiedad para escribirla en el textbox
                            //que corresponda

                            switch (Tipo) {
                                case "administrative_area_level_1": //Estado
                                    $("#<%=txtEstado.ClientID%>").val(Descripcion);
                                    break;

                            }

                        }
                    }

                    //Asignamos a txtorigen o destino la dirección formateada
                    if (results[0].address_components.length > 0) {
                        if (fuente == 1) //es origen
                        {
                            $("#<%=txtPais.ClientID%>").val(results[0].formatted_address);
                        }

                    }


                }
                else {
                    swal("Error de Google", "Google no obtuvo datos", "warning");
                }
            });
        }
        else {
            //Avisamos al usuario que tendrá que capturar
            //todos los datos
            swal({
                title: "¿Estás seguro?",
                text: "No podemos obtener datos sino proporciona una dirección",
                type: "warning",
                showCancelButton: true,
                confirmButtonClass: "btn-warning",
                confirmButtonText: "Si, quiero capturar la información",
                cancelButtonText: "Cancelar",
                closeOnConfirm: true,
                closeOnCancel: true
            }, function (isConfirm) {
                if (!isConfirm) {
                    $(".modalPanel").hide();
                    $(".bgpanel").hide();

                }

            });

        }
        function LimpiarDatos() {
            $(".mpanel").val("");
        }
    </script>

    <%--aca vamos a pintar el modal--%>
    <asp:Panel ID="PnlOrigenDestino" Width="500" CssClass="modalPanel" runat="server">
        <div style="width: 90%; margin: 0 auto; margin-top: 20px">
            <asp:UpdatePanel ID="UPOrigenDestino" UpdateMode="Always" runat="server">
                <ContentTemplate>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <h4>GUARDAR DIRECCION</h4>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="<%=txtEstado.ClientID %>">Estado</label>
                                    <asp:TextBox ID="txtEstado" CssClass="mpanel form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" CssClass="text-danger" ControlToValidate="txtEstado" runat="server" ErrorMessage="Estado Rquerido" ValidationGroup="POD"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="col-md-6">
                                    <asp:Button ID="btnGuardarDir" CssClass="btn btn-success" runat="server" Text="Guardar" ValidationGroup="POD" formnovalidate="" OnClick="btnGuardarDir_Click" OnClientClick="prueba()" />
                                </div>
                                <div class="">
                                    <asp:Button ID="btnCancelar" CssClass="btn btn-danger" formnovalidate="" runat="server" Text="Cancelar" OnClientClick="limpiarDatos()" />
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
</asp:Content>
