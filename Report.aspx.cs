using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class report : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Insert(object sender, EventArgs e)
    {
        int worker_id, task_id;
        string date, time, comment;
        worker_id = int.Parse(ddl_worker2.SelectedValue);
        task_id = int.Parse(ddl_task2.SelectedValue);
        date = tb_date2.Text.Trim();
        time = tb_hours.Text.Trim();
        comment = tb_comment.Text.Trim();
        DataSetTableAdapters.workHoursTableAdapter adapter = new DataSetTableAdapters.workHoursTableAdapter();
        adapter.InsertQuery(worker_id, task_id, date, time, comment);
        repeater_work_hours.DataBind();
    }
    protected void OnEdit(object sender, EventArgs e)
    {
        //Find the reference of the Repeater Item.
        RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
        this.ToggleElements(item, true);
    }

    private void ToggleElements(RepeaterItem item, bool isEdit)
    {
        //Toggle Buttons.
        item.FindControl("lb_edit").Visible = !isEdit;
        item.FindControl("lb_update").Visible = isEdit;
        item.FindControl("lb_cancel").Visible = isEdit;
        item.FindControl("lb_delete").Visible = !isEdit;

        //Toggle Labels.
        item.FindControl("lbl_worker").Visible = !isEdit;
        item.FindControl("lbl_task").Visible = !isEdit;
        item.FindControl("lbl_date").Visible = !isEdit;
        item.FindControl("lbl_time").Visible = !isEdit;
        item.FindControl("lbl_comments").Visible = !isEdit;


        //Toggle Controls.
        item.FindControl("ddl_worker1").Visible = isEdit;
        item.FindControl("ddl_task1").Visible = isEdit;
        item.FindControl("tb_date1").Visible = isEdit;
        item.FindControl("tb_edit_total_hours").Visible = isEdit;
        item.FindControl("tb_edit_comment").Visible = isEdit;
    }
    protected void OnUpdate(object sender, EventArgs e)
    {
        int id, worker_id, task_id;
        string date, time, comment;
        RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
        id = int.Parse((item.FindControl("record_id") as Label).Text);
        worker_id = int.Parse((item.FindControl("ddl_worker1") as DropDownList).SelectedValue);
        task_id = int.Parse((item.FindControl("ddl_task1") as DropDownList).SelectedValue);
        date = (item.FindControl("tb_date1") as TextBox).Text;
        time = (item.FindControl("tb_edit_total_hours") as TextBox).Text;
        comment = (item.FindControl("tb_edit_comment") as TextBox).Text;

        DataSetTableAdapters.workHoursTableAdapter adapter = new DataSetTableAdapters.workHoursTableAdapter();
        adapter.UpdateQuery (worker_id, task_id, date, time, comment, id);
        repeater_work_hours.DataBind();
        
    }
    protected void OnCancel(object sender, EventArgs e)
    {
        RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
        this.ToggleElements(item, false);
    }
    protected void OnDelete(object sender, EventArgs e)
    {
        RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
        int id = int.Parse((item.FindControl("record_id") as Label).Text);

        DataSetTableAdapters.workHoursTableAdapter adapter = new DataSetTableAdapters.workHoursTableAdapter();
        adapter.DeleteQuery(id);
        repeater_work_hours.DataBind();
    }
}