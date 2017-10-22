<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test01.aspx.cs" Inherits="test01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Data list</h1>
        <asp:DataList ID="DataList1" runat="server" DataKeyField="id" DataSourceID="ObjectDataSource1">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                edit<br />
            </EditItemTemplate>
            <ItemTemplate>
                id:
                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                <br />
                name:
                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                <br />
<br />
            </ItemTemplate>
        </asp:DataList> 
        <h1>Details view</h1>
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="ObjectDataSource1">
            <Fields>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" InsertMethod="Insert" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="DataSetTableAdapters.clientTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="Original_id" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
