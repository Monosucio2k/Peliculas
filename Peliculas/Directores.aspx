<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Directores.aspx.cs" Inherits="Peliculas.Directores" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <div>
        <div>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Menu.aspx">Menu</asp:HyperLink>
</div>
    <form id="form1" runat="server">
        <table>
            <tr>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Placeholder="Nombre"></asp:TextBox>
            </td>
                <td>
    <asp:TextBox ID="TextBox2" runat="server" Placeholder="Apellido"></asp:TextBox>
</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Agregar" OnClick="Button1_Click" />
            </td>
            </tr>
        </table>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="Crud" EmptyDataText="No hay registros de datos para mostrar." CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="id">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="Id" SortExpression="id" ReadOnly="True" />
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                    <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="Crud" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT [id], [nombre], [apellido] FROM [Directores]" DeleteCommand="DELETE FROM [Directores] WHERE [id] = @id" InsertCommand="INSERT INTO [Directores] ([nombre], [apellido]) VALUES (@nombre, @apellido)" UpdateCommand="UPDATE [Directores] SET [nombre] = @nombre, [apellido] = @apellido WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="nombre" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="TextBox2" Name="apellido" PropertyName="Text" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nombre" Type="String" />
                    <asp:Parameter Name="apellido" Type="String" />
                    <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>


        </div>
    </form>
    </div>
 </body>

</html>
