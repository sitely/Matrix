using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        tb_date.Text = DateTime.Now.ToString().Substring(0, 10);
    }

    

    protected void btn_save_Click(object sender, EventArgs e)
    {
        int worker_id, task_id;
        String  comments, date, time;
        DataSetTableAdapters.workHoursTableAdapter adapter;

        worker_id = int.Parse(ddl_worker.SelectedValue);
        date = tb_date.Text;
        task_id = int.Parse(ddl_task.SelectedValue);
        time = string.Format(ddl_minute.SelectedItem.Text.Trim() + ":" + ddl_hour.SelectedItem.Text.Trim());
        comments = tb_comment.Text.Trim();

        adapter = new DataSetTableAdapters.workHoursTableAdapter();
        adapter.InsertQuery(worker_id, task_id, date, time, comments);
        Response.Write("<script>alert('הנתונים נשמרו בהצלחה');</script>");
    }
    
}