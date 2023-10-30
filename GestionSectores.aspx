<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionSectores.aspx.cs" Inherits="Parcial_1_Martos.GestionSectores" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 221px">
    <form id="form1" runat="server">
        <div style="height: 479px">
            <h2> Gestión Sectores </h2>
            <br>
            <asp:TextBox ID="txtSector" runat="server"></asp:TextBox>
            <asp:Button ID="btnAgregar" runat="server" OnClick="Button1_Click" Text="Agregar" />
            <br>
            <br>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="nombre" HeaderText="Nombre Sector" SortExpression="nombre" />
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" DeleteText="Eliminar" EditText="Editar" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <br>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" DeleteCommand="DELETE FROM [EmpleadoSectores] WHERE [id] = @id" InsertCommand="INSERT INTO [EmpleadoSectores] ([nombre]) VALUES (@nombre)" SelectCommand="SELECT * FROM [EmpleadoSectores]" UpdateCommand="UPDATE [EmpleadoSectores] SET [nombre] = @nombre WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtSector" Name="nombre" PropertyName="Text" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nombre" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Menu.aspx">Atrás</asp:HyperLink>
        </div>
    </form>
</body>
</html>
