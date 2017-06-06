using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_postOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["adminuser"] == null)
                Response.Redirect("Login.aspx");

        }
        //查询订单状态
        string orderid = Request.Params["orderid"];
        string sql = "select isPay,isPost from orders where [orderid]=@orderid";
        SqlParameter[] param ={
                  new SqlParameter("@orderid",SqlDbType.Char)
                  };
        param[0].Value = orderid;
        SqlDataReader dread = sqlHelper.ExecuteReader(sqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql, param);
        if (dread.Read())
        {
            //设置收款及发货状态
            btnIsPay.Enabled = !dread.GetBoolean(0);
            btnIsPost.Enabled = !dread.GetBoolean(1);

        }
    }
    //以收款按钮处理
    protected void btnIsPay_Click(object sender, EventArgs e)
    {
        //只有在订单没有付款也没有发货的状态下才修改状态为已付款未发货
        string orderid = Request.Params["orderid"];
        string sql = "update orders set isPay=1 where orderid=@orderid and isPay=0 and isPost=0";
        SqlParameter[] param ={
                  new SqlParameter("@orderid",SqlDbType.Char)
                  };
        param[0].Value = orderid;
        if (sqlHelper.ExecuteNonQuery(sqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql, param) > 0)
            DetailsView1.DataBind();
        else
            Response.Write("已经处理过收款或数据库操作失败");
    }
    //发货按钮处理
    protected void btnIsPost_Click(object sender, EventArgs e)
    {
        //如果订单状态为已付款未发货，修改状态为已发货
        string orderid = Request.Params["orderid"];
        string sql = "update orders set isPost=1 where orderid=@orderid and isPay=1 and isPost=0";
        SqlParameter[] param ={
                  new SqlParameter("@orderid",SqlDbType.Char)
                  };
        param[0].Value = orderid;
        if (sqlHelper.ExecuteNonQuery(sqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql, param) > 0)
            DetailsView1.DataBind();
        else
            Response.Write("已经处理过收款或数据库操作失败");
    }
}