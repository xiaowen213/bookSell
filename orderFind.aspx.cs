using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class orderFind : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnFind_Click(object sender, EventArgs e)
    {
        //得到订单号和查询密码
        string orderid = txtOrderId.Text.Replace("'", "");
        string password = txtFindPassword.Text.Replace("'", "");
        //生成查询语句与添加
        string sql = "select * from orders,payInfo where orderid=@orderid and findPassword=@password and orders.pid=payInfo.pid";
        SqlParameter[] param ={
                             new SqlParameter("@orderid",SqlDbType.VarChar),
                             new SqlParameter("@password",SqlDbType.VarChar)
                             };
        param[0].Value = orderid;
        param[1].Value = password;
        SqlDataReader reader = sqlHelper.ExecuteReader(sqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql, param);
        if (reader.HasRows)
        {
            //如果订单存在，查询并显示订单详细信息
            DetailsView1.DataSource = reader;
            DetailsView1.DataBind();
            sql = "select * from orderPocduct,bookInfo where orderPocduct.ISBN=bookInfo.ISBN and orderid=@orderid";
            SqlParameter[] param1 ={
                                 new SqlParameter("@orderid",SqlDbType.VarChar)
                                 };
            param1[0].Value = orderid;
            reader = sqlHelper.ExecuteReader(sqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql, param1);
            GridView1.DataSource = reader;
            GridView1.DataBind();

        }
        else
            Response.Write("订单号或查询密码错误");
    }
}