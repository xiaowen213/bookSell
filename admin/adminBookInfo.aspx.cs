using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_adminBookInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["adminuser"] == null)
                Response.Redirect("Login.aspx");

        }

    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        string isbn = (string)GridView1.DataKeys[e.NewEditIndex].Value;
        e.Cancel = true;
        Response.Redirect("modifyBookInfo.aspx?isbn=" + isbn);
    }
}