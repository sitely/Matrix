<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" 
    CodeFile="Default.aspx.cs" Inherits="_Default" EnableEventValidation="false"  %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>

<asp:Content ID="Content01" ContentPlaceHolderID="cph_main_content" Runat="Server">
    <div id="div01">
        <span>שם עובד:</span>
        <asp:DropDownList ID="ddl_worker" runat="server" DataSourceID="ods_worker" DataTextField="Name" DataValueField="Id" 
            AppendDataBoundItems="True" CssClass="selected_value" >
            <asp:ListItem Selected="True" Value="0" CssClass="selected_value"  >בחר עובד</asp:ListItem>
        </asp:DropDownList>

        <span>תאריך:</span>
        <asp:TextBox ID="tb_date" runat="server"  CssClass="selected_value" ></asp:TextBox>
        <asp:CalendarExtender ID ="calendar_date" runat="server"  Format="dd/MM/yyyy" TargetControlID="tb_date" FirstDayOfWeek="Sunday" ViewStateMode="Inherit" ></asp:CalendarExtender>      
    </div>
    <div id="div02">
        <span>לקוח:</span>
        <asp:DropDownList ID="ddl_client" runat="server" Width="150" CssClass="selected_value"></asp:DropDownList>
        <ajaxToolkit:CascadingDropDown ID="cdd_client" runat="server" TargetControlID="ddl_client" Category="client" 
            PromptText="בחר לקוח" ServicePath="WebService.asmx" ServiceMethod="GetClient" />
            
        <span>פרויקט:</span>
        <asp:DropDownList ID="ddl_project" runat="server" Width="150" CssClass="selected_value"></asp:DropDownList>
        <ajaxToolkit:CascadingDropDown ID="cdd_project" runat="server" TargetControlID="ddl_project" Category="project" 
            PromptText="בחר פרויקט" ServicePath="WebService.asmx" ServiceMethod="GetProject" ParentControlID="ddl_client" />
            
        <span>משימה:</span>
        <asp:DropDownList ID="ddl_task" runat="server" Width="150" CssClass="selected_value"></asp:DropDownList>
        <ajaxToolkit:CascadingDropDown ID="cdd_task" runat="server" TargetControlID="ddl_task" Category="task" 
            PromptText="בחר משימה" ServicePath="WebService.asmx" ServiceMethod="GetTask"  ParentControlID="ddl_project" />
            
        <span>שעות:</span>
        <asp:DropDownList ID="ddl_hour" runat="server" DataSourceID="ods_hour" 
            DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True" CssClass="selected_value" >
            <asp:ListItem Selected="True" Value="0">בחר שעות</asp:ListItem>
        </asp:DropDownList>
        <span>דקות:</span>
        <asp:DropDownList ID="ddl_minute" runat="server"  DataSourceID="ods_minute" 
            DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True" CssClass="selected_value">
            <asp:ListItem Selected="True" Value="0">בחר דקות</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div id ="div03">
        <h1><span>הערות</span></h1>
        
        <asp:TextBox ID="tb_comment" runat="server" TextMode="MultiLine" CssClass="tb01"></asp:TextBox>
    </div>
    <div id ="div04">
        <asp:Button ID="btn_save" runat="server" Text="שמור"  CssClass="button01" OnClick="btn_save_Click" />
    </div>
    <asp:ObjectDataSource ID="ods_worker" runat="server"  OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetData" TypeName="DataSetTableAdapters.workerTableAdapter"></asp:ObjectDataSource>
     <asp:ObjectDataSource ID="ods_hour" runat="server" OldValuesParameterFormatString="original_{0}" 
         SelectMethod="GetData" TypeName="DataSetTableAdapters.dim_hoursTableAdapter"></asp:ObjectDataSource>
     <asp:ObjectDataSource ID="ods_minute" runat="server" OldValuesParameterFormatString="original_{0}" 
         SelectMethod="GetData" TypeName="DataSetTableAdapters.dim_minutesTableAdapter"></asp:ObjectDataSource>
</asp:Content>

