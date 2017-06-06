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
public partial class payOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ArrayList shopCartList = (ArrayList)Session["shopList"];
        GridView1.DataSource = shopCartList;
        GridView1.DataBind();
        GridView1.DataKeyNames = new String[] { "isbn" };
        
        //计算购物车物品总价格
        double sumPrice = 0;
        for (int i = 0; i < shopCartList.Count; i++)
            sumPrice += ((shopObject)shopCartList[i]).Bprice * ((shopObject)shopCartList[i]).Count;
        labSumPrice.Text = "购物车总价格为：" + sumPrice + "元";
    }
    private Object bLock = new Object();//同步变量
    protected void btnSaveOrder_Click(object sender, EventArgs e)
    {
        String orderid;//保存订单编号
        lock (bLock)//同步代码，确保不同用户不会生成相同的编号
        {
            orderid = System.DateTime.Now.ToString("yyyyMMddhhmmss") + DateTime.Now.Millisecond.ToString();//用时间戳生成订单编号
        }
        using (SqlConnection conn = new SqlConnection(sqlHelper.ConnectionStringLocalTransaction))
        {
            conn.Open();
            SqlTransaction tran = conn.BeginTransaction();
            ArrayList shopCartList = (ArrayList)Session["shopList"];//得到购物车类别
            string sql = "insert into orderPocduct(orderid,ISBN,count,price,sumPrice) ";
            sql += "values(@orderid,@isbn,@count,@price,@sumPrice)";//订单保存语句
            string bSql = "update bookInfo set bCount=bCount-1,bSaleCount=bSaleCount+1 where ISBN=@isbn";//修改图书库存语句
            SqlCommand cmd = new SqlCommand(sql, conn, tran);
            SqlCommand bCom = new SqlCommand(bSql, conn, tran);
            try
            {
                bool bSuccess = true;  
                double sumPrice = 0;
                //////////////////////////////////////
                //  保存订单编号的所有商品信息      //
                //////////////////////////////////////
                for (int i = 0; i < shopCartList.Count; i++)
                {
                    shopObject shop = (shopObject)shopCartList[i];
                    sumPrice+=shop.Bprice*shop.Count;
                    cmd.Parameters.Clear();
                    cmd.Parameters.Add("@orderid", SqlDbType.Char).Value = orderid;
                    cmd.Parameters.Add("@isbn", SqlDbType.VarChar).Value = shop.Isbn;
                    cmd.Parameters.Add("@count", SqlDbType.Int).Value = shop.Count;
                    cmd.Parameters.Add("@price", SqlDbType.Float).Value = shop.Bprice;
                    cmd.Parameters.Add("@sumPrice", SqlDbType.Float).Value = shop.Bprice * shop.Count;

                    bCom.Parameters.Clear();
                    bCom.Parameters.Add("@isbn", SqlDbType.VarChar).Value = shop.Isbn;
                    
                    if (cmd.ExecuteNonQuery()<=0)
                    {
                        bSuccess = false;
                    }
                    else if (bCom.ExecuteNonQuery() <= 0)
                    {
                        bSuccess = false;
                    }

                    if (!bSuccess)
                        break;
                }
                if (!bSuccess)//如果一个商品保存失败，撤销订单保存
                {
                    tran.Rollback();
                    Response.Write("系统错误请稍候提交！");
                }
                else
                {
                    //////////////////////////////
                    //  保存订单信息到数据库   //
                    ////////////////////////////
                    sql = "insert into orders (orderid,postAdress,postNumber,orderMember,pid,orderPrice,isPay,isPost,findPassword) ";
                    sql += "values(@orderid,@postAdress,@postNumber,@orderMember,@pid,@orderPrice,@isPay,@isPost,@findPassword)";
                    cmd.CommandText = sql;
                    cmd.Parameters.Clear();
                    cmd.Parameters.Add("@orderid", SqlDbType.Char).Value = orderid;
                    cmd.Parameters.Add("@postAdress", SqlDbType.VarChar).Value = txtPostAdress.Text;
                    cmd.Parameters.Add("@postNumber", SqlDbType.Char).Value = txtPostNumber.Text;
                    cmd.Parameters.Add("@orderMember", SqlDbType.VarChar).Value = txtOrderMember.Text;
                    cmd.Parameters.Add("@pid", SqlDbType.Int).Value = ddlPid.SelectedValue;
                    cmd.Parameters.Add("@orderPrice", SqlDbType.Float).Value = sumPrice;
                    cmd.Parameters.Add("@isPay", SqlDbType.Bit).Value = 0;
                    cmd.Parameters.Add("@isPost", SqlDbType.Bit).Value = 0;
                    cmd.Parameters.Add("@findPassword", SqlDbType.VarChar).Value = txtFindPassword.Text;
                    if (cmd.ExecuteNonQuery() > 0)//保存成功调整到成功页面
                    {
                        tran.Commit();
                        Session.Clear();
                        Response.Redirect("viewSuccessOrder.aspx?orderId=" + orderid);
                    }
                    else//保存出错撤销事物
                    {
                        tran.Rollback();
                        Response.Write("系统错误请稍候提交！");
                    }

                }
            }
            catch (Exception ex)//保存出错撤销事物
            {
                Response.Write("系统错误请稍候提交！");
                tran.Rollback();
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }
    }
}
