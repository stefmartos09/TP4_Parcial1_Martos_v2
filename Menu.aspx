<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="Parcial_1_Martos.Menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 192px">
    <form id="form1" runat="server">
        <div>
            <h2>Menú Principal</h2>
            <br />
        </div>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/GestionEmpleados.aspx">Gestión Empleados</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/GestionSectores.aspx">Gestión Sectores</asp:HyperLink>
    </form>
</body>
</html>
