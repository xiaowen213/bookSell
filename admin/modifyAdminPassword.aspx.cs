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

public partial class admin_modifyAdminPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["adminuser"] == null)
                Response.Redirect("Login.aspx");

        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        //获得次输入的新旧密码，及登陆时保存的用户名
        string adminuser = (string)Session["adminuser"];
        string oldPassword = txtOldPassword.Text.Replace("'", "");
        string newPassword = txtNewPassword.Text.Replace("'", "");
        //查询数据库，验证旧密码是否正确
        string sql = "select count(*) from administrator where adminname=@adminname and adminpass=@adminpass";
        SqlParameter[] param = new SqlParameter[]{
                             new SqlParameter("@adminname",SqlDbType.VarChar),
                             new SqlParameter("@adminpass",SqlDbType.VarChar)
                             };
        param[0].Value = adminuser;
        param[1].Value = oldPassword;
        int usercount = ((int)(sqlHelper.ExecuteScalar(sqlHelper.ConnectionStringLocalTransaction,
            CommandType.Text, sql, param)));
        if (usercount <= 0)
        {
            labMsg.Text = "旧密码错误";
        }
        else
        {
            //执行数据库操作效果密码
            string updatesql = "update administrator set adminpass=@adminpass where adminname=@adminname";
            SqlParameter[] updateParam ={
                                 new SqlParameter("@adminpass",SqlDbType.VarChar),
                                 new SqlParameter("@adminname",SqlDbType.Char)
                                 };
            updateParam[0].Value = newPassword;
            updateParam[1].Value = adminuser;
            if (sqlHelper.ExecuteNonQuery(sqlHelper.ConnectionStringLocalTransaction,
                CommandType.Text, updatesql, updateParam) > 0)
            {
                labMsg.Text = "修改成功";
            }
            else
            {
                labMsg.Text = "操作错误";
            }
        }
    }
}