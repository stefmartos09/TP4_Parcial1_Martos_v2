<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionEmpleados.aspx.cs" Inherits="Parcial_1_Martos.GestionEmpleados" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 503px">
            <h2>Gestión Empleados</h2>
            <br>
            <asp:Label ID="Label1" runat="server" Text="Apellido"></asp:Label>
            <asp:TextBox ID="txtApellido" runat="server"></asp:TextBox>
            <br>
            <asp:Label ID="Label2" runat="server" Text="Nombre"></asp:Label>
            <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
            <br>
            <asp:Label ID="Label3" runat="server" Text="Sector"></asp:Label>
            <asp:DropDownList ID="drpSector" runat="server" DataSourceID="SqlDataSource2" DataTextField="nombre" DataValueField="id">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click" />
            <asp:Button ID="txtActualizar" runat="server" OnClick="txtActualizar_Click" Text="Actualizar" />
            <br />
            <br>
            <br>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                    <asp:BoundField DataField="idSector" SortExpression="idSector" ReadOnly="True" />
                    <asp:BoundField DataField="Expr1" HeaderText="Sector" SortExpression="Expr1" />
                    <asp:CommandField ButtonType="Button" DeleteText="Eliminar" EditText="Editar" ShowDeleteButton="True" SelectText="Seleccionar" ShowSelectButton="True" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <h3>Listado de Empleados por Sector</h3>
            <asp:GridView ID="gvEmpleadoSector" width="500px" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDatEmpleadoSector">
                <Columns>
                    <asp:BoundField DataField="Sector" HeaderText="Sector" SortExpression="Sector" />
                    <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" ReadOnly="True" SortExpression="Cantidad" />
                </Columns>
            </asp:GridView>
            <br>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" DeleteCommand="DELETE FROM [Empleados] WHERE [id] = @id" InsertCommand="INSERT INTO [Empleados] ([apellido], [nombre], [idSector]) VALUES (@apellido, @nombre, @idSector)" SelectCommand="SELECT Empleados.id, Empleados.apellido, Empleados.nombre, Empleados.idSector, EmpleadoSectores.nombre AS Expr1 FROM Empleados INNER JOIN EmpleadoSectores ON Empleados.idSector = EmpleadoSectores.id" UpdateCommand="UPDATE [Empleados] SET [apellido] = @apellido, [nombre] = @nombre, [idSector] = @idSector WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtApellido" Name="apellido" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtNombre" Name="nombre" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="drpSector" Name="idSector" PropertyName="SelectedValue" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="txtApellido" Name="apellido" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtNombre" Name="nombre" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="drpSector" Name="idSector" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" SelectCommand="SELECT * FROM [EmpleadoSectores]"></asp:SqlDataSource>
            <br />
            <asp:SqlDataSource ID="SqlDatEmpleadoSector" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" SelectCommand="  select sec.nombre as Sector, count(emp.id) Cantidad  from EmpleadoSectores sec, empleados emp
  where sec.id = emp.idSector
  group by sec.id, sec.nombre"></asp:SqlDataSource>
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Menu.aspx">Atrás</asp:HyperLink>
            <br />
        </div>
    </form>
</body>
</html>
