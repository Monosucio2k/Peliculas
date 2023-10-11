﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Peliculas.aspx.cs" Inherits="Peliculas.Peliculas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <div>
    <div>
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Menu.aspx">Menu</asp:HyperLink>
</div>
    <form id="form1" runat="server">
            <table>
            <tr>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Placeholder="Titulo de la Pelicula"></asp:TextBox>
            </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataDirector" DataTextField="nombreApellido" DataValueField="id"></asp:DropDownList>
</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Agregar" OnClick="Button1_Click" />
            </td>
            </tr>
        </table>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="Crud" EmptyDataText="No hay registros de datos para mostrar." Width="348px" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="Id" ReadOnly="True" SortExpression="id" InsertVisible="False" />
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                    <asp:BoundField DataField="idDirector" SortExpression="idDirector" />
                    <asp:BoundField DataField="apellido" HeaderText="Apellido Director" SortExpression="apellido" />
                    <asp:BoundField DataField="nombre1" HeaderText="Nombre Director" SortExpression="nombre1" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" HorizontalAlign="Center" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="Crud" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" DeleteCommand="DELETE FROM [Peliculas] WHERE [id] = @id" InsertCommand="INSERT INTO [Peliculas] ([nombre], [idDirector]) VALUES (@nombre, @idDirector)" ProviderName="<%$ ConnectionStrings:cadena.ProviderName %>" SelectCommand="SELECT Peliculas.id, Peliculas.nombre, Peliculas.idDirector, Directores.apellido, Directores.nombre FROM Peliculas INNER JOIN Directores ON Peliculas.idDirector = Directores.id" UpdateCommand="UPDATE [Peliculas] SET [nombre] = @nombre, [idDirector] = @idDirector WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="nombre" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="idDirector" PropertyName="SelectedValue" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nombre" Type="String" />
                    <asp:Parameter Name="idDirector" Type="Int32" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataDirector" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT id, nombre + ' ' + apellido AS nombreApellido
FROM     Directores"></asp:SqlDataSource>
        </div>
    </form>
    </div>
</body>
</html>
