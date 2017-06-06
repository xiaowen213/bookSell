using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class admin_bookTypeAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["adminuser"] == null)
                Response.Redirect("Login.aspx");

        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string bcId = e.Keys[0].ToString();//要删除的分类编号
        //查询分类下面是否有图书信息
        string sql = "SELECT count(*) FROM [bookInfo] where [bcid]=@bcId";
        SqlParameter[] param ={
                             new SqlParameter("@bcid",SqlDbType.Int)
                             };
        param[0].Value = bcId;
        int count = (int)sqlHelper.ExecuteScalar(sqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql, param);
        if (count > 0)
        {
            Response.Write("该分类下存在图书信息不能删除！");
            e.Cancel = true;//如果有图书不能删除信息取消删除信息
        }
    }
    protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        string cname = e.Values[0].ToString();//分类名称
        string sql = "SELECT count(*) FROM [bookClass] where [bcName]=@bcName";
        SqlParameter[] param ={
                             new SqlParameter("@bcName",SqlDbType.VarChar)
                             };
        param[0].Value = cname;
        int count = (int)sqlHelper.ExecuteScalar(sqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql, param);
        if (count > 0)
        {
            Response.Write("该分类已经存在！");
            e.Cancel = true;//取消添加
        }
    }
}