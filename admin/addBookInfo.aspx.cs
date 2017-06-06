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


public partial class admin_addBookInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["adminuser"] == null)
                Response.Redirect("Login.aspx");

        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //获得各个文本框的输入值
        string isbn = txtIsbn.Text;
        string bname = txtBname.Text;
        string bcid = ddlBcid.SelectedValue;
        string bzz = txtBzz.Text;
        string price = txtBprice.Text;
        string bkcount = txtBkcCount.Text;
        string BContent = txtBContent.Text;
        string pic = "";
        //如果有图片上传
        if (fileBPictuer.HasFile)
        {
            string savePath = Server.MapPath("~/images/") + fileBPictuer.FileName;//设置图片保存服务器路径
            fileBPictuer.SaveAs(savePath);//保存图片
            pic = "images/" + fileBPictuer.FileName;//图片名称 
        }
        //添加到数据库
        string sql = "insert into bookInfo values(@isbn,@bname,@bcid,@author,@price,@bount,0,@pic,@BContent)";
        SqlParameter[] param ={
                             new SqlParameter("@isbn",SqlDbType.VarChar),
                             new SqlParameter("@bname",SqlDbType.VarChar),
                             new SqlParameter("@bcid",SqlDbType.Int),
                             new SqlParameter("@author",SqlDbType.VarChar),
                             new SqlParameter("@price",SqlDbType.VarChar),
                             new SqlParameter("@bount",SqlDbType.VarChar),
                             new SqlParameter("@pic",SqlDbType.VarChar),
                             new SqlParameter("@BContent",SqlDbType.VarChar)
                             };
        param[0].Value = isbn;
        param[1].Value = bname;
        param[2].Value = bcid;
        param[3].Value = bzz;
        param[4].Value = price;
        param[5].Value = bkcount;
        param[6].Value = pic;
        param[7].Value = BContent;

        if (sqlHelper.ExecuteNonQuery(sqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql, param) > 0)
            Response.Write("图书添加成功");
        else
            Response.Write("数据库操作失败");

    }
}