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

public partial class admin_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        //获得输入用户名与密码信息
        string adminuser = Login1.UserName.Replace("'", "");
        string adminpass = Login1.Password.Replace("'", "");
        //生成程序语句
        string sql = "select count(*) from administrator where adminname=@adminname and adminpass=@adminpass";
        SqlParameter[] param ={
                             new SqlParameter("@adminname",SqlDbType.VarChar),
                             new SqlParameter("@adminpass",SqlDbType.VarChar)
                             };
        param[0].Value = adminuser;
        param[1].Value = adminpass;
        //执行查询于语句，得到查询结果
        int usercount = ((int)(sqlHelper.ExecuteScalar(sqlHelper.ConnectionStringLocalTransaction,
            CommandType.Text, sql, param)));
        if (usercount > 0)
        {
            //查询成功保存用户名
            e.Authenticated = true;
            Session["adminuser"] = adminuser;
        }
        else//查询失败
            e.Authenticated = false;
    }
}