<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Report.aspx.cs" Inherits="report" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>


<asp:Content ID="Content01" ContentPlaceHolderID="cph_main_content" Runat="Server">
    <asp:Repeater ID="repeater_work_hours" runat="server" DataSourceID="ods_work_hours">
        <HeaderTemplate>
        <table class = "tbl01">
            <tr>
                <th>
                    עריכה
                </th>
                <th>
                    עובד
                </th>
                <th>
                    משימה
                </th>
                <th>
                    תאריך
                </th>
                <th>
                    שעות
                </th>
                <th>
                    הערות
                </th>
            </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td>
                <asp:LinkButton ID="lb_edit" Text="עריכה" runat="server" OnClick="OnEdit" />
                <asp:LinkButton ID="lb_update" Text="עידכון" runat="server" Visible="false" OnClick="OnUpdate" />
                <asp:LinkButton ID="lb_cancel" Text="ביטול" runat="server" Visible="false" OnClick="OnCancel" />
                <asp:LinkButton ID="lb_delete" Text="מחיקה" runat="server" OnClick="OnDelete" 
                    OnClientClick="return confirm('האם ברצונך למחוק ?');" />
            </td>

            <td>
                <asp:Label ID="lbl_worker" runat="server" Text='<%# Eval("ex_worker") %>' />
                <asp:DropDownList ID="ddl_worker1" runat="server" DataSourceID="ods_worker" DataTextField="Name" 
                    DataValueField="Id" AppendDataBoundItems="True" Width="80" Visible="False">
                <asp:ListItem Selected="True" Value="0">בחר עובד</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="record_id" runat="server" Text='<%# Eval("id") %>' Visible = "false" />
            </td>

            <td>
                <asp:Label ID="lbl_task" runat="server" Text='<%# Eval("ex_task") %>' />
                <asp:DropDownList ID="ddl_task1" runat="server" DataSourceID="ods_task" DataTextField="Name" 
                    DataValueField="Id" AppendDataBoundItems="True" Width="80" Visible="False">
                <asp:ListItem Selected="True" Value="0">בחר משימה</asp:ListItem>
            </asp:DropDownList>
            </td>

            <td>
                <asp:Label ID="lbl_date" runat="server" 
                    Text='<%# DataBinder.Eval(Container.DataItem, "date", "{0:d/M/yyyy}") %>' />
                <asp:TextBox ID="tb_date1" runat="server"  Visible="False" 
                    Text='<%# DataBinder.Eval(Container.DataItem, "date", "{0:d/M/yyyy}") %>'></asp:TextBox>
                <asp:CalendarExtender ID ="calendar_date" runat="server"  Format="dd/MM/yyyy" TargetControlID="tb_date1" 
                    FirstDayOfWeek="Sunday" ViewStateMode="Inherit" ></asp:CalendarExtender>      
            </td>

            <td>
                <asp:Label ID="lbl_time" runat="server" Text='<%# Eval("total_hours") %>' />
                <asp:TextBox ID="tb_edit_total_hours" runat="server"  Text='<%# Eval("total_hours") %>' Visible="false" />
            </td>

            <td>
                <asp:Label ID="lbl_comments" runat="server" Text='<%# Eval("comment") %>' />
                <asp:TextBox ID="tb_edit_comment" runat="server"  Text='<%# Eval("comment") %>' Visible="false" />
            </td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
    </asp:Repeater>
    <div class="space" />
    <h2>הוספת שורה</h2>
    <table class="tbl01">
    <tr>
        <td >
            עובד:<br />
            <asp:DropDownList ID="ddl_worker2" runat="server" DataSourceID="ods_worker" DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True" Width="80" >
                <asp:ListItem Selected="True" Value="0">בחר עובד</asp:ListItem>
            </asp:DropDownList>
        </td>

        <td >
            משימה:<br />
            <asp:DropDownList ID="ddl_task2" runat="server" DataSourceID="ods_task" DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True" Width="80" >
                <asp:ListItem Selected="True" Value="0">בחר משימה</asp:ListItem>
            </asp:DropDownList>
        </td>

        <td >
            תאריך:<br />
            <asp:TextBox ID="tb_date2" runat="server"  ></asp:TextBox>
            <asp:CalendarExtender ID ="calendar_date2" runat="server"  Format="dd/MM/yyyy" TargetControlID="tb_date2" FirstDayOfWeek="Sunday" ViewStateMode="Inherit" ></asp:CalendarExtender>      
        </td>

        <td >
            שעות:<br />
            <asp:TextBox ID="tb_hours" runat="server"></asp:TextBox>
        </td>

        <td >
            הערות:<br />
            <asp:TextBox ID="tb_comment" runat="server"  Width="100" TextMode="MultiLine"></asp:TextBox>
        </td>

        <td >
            <asp:Button ID="btn_add" runat="server" Text="הוסף" OnClick="Insert" CssClass ="button01" />
        </td>
    </tr>
</table>
<div class="space" />

    <asp:ObjectDataSource ID="ods_work_hours" runat="server" DataObjectTypeName="System.Data.DataRow" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="DataSetTableAdapters.workHoursTableAdapter" UpdateMethod="Update">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ods_worker" runat="server" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetData" TypeName="DataSetTableAdapters.workerTableAdapter">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ods_task" runat="server" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetView" TypeName="DataSetTableAdapters.taskTableAdapter">
    </asp:ObjectDataSource>
    </asp:Content>

