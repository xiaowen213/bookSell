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
public partial class bookOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)//判断是否为页面回发事件
        {
            string op = Request.Params["op"];//接收操作参数
            if (op != null && op.Equals("add"))//如果为添加商品事件，执行图书添加操作
            {
                string bid = Request.Params["bid"];//接收参数传递的图书编号
                ArrayList shopList = (ArrayList)Session["shopList"];//得到保存在session的购物车列表
                if (shopList == null)//如果是第一次使用购物车，新建一个购物车对象
                    shopList = new ArrayList();
                //查询购物车内是否存在该商品
                int i;
                for (i = 0; i < shopList.Count; i++)
                    if (bid == ((shopObject)shopList[i]).Isbn)
                    {
                        ((shopObject)shopList[i]).Count++;//如果找到增加图书数量
                        break;
                    }
                //如果没有找到，折添加商品
                if (i == shopList.Count)
                {
                    shopObject shop = new shopObject();
                    shop.Isbn = bid;
                    shop.Count = 1;
                    //查询出图书名称
                    string sql = "select bname,bprice from bookInfo where ISBN='" + bid + "'";
                    SqlDataReader dread = sqlHelper.ExecuteReader(sqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql);
                    if (dread.Read())
                    {
                        shop.Bname = dread.GetString(0);
                        shop.Bprice = dread.GetDouble(1);
                    }
                    shopList.Add(shop);
                }
                Session["shopList"] = shopList;//保存购物车
            }
            string isbn = Request.Params["isbn"];//接收参数传递的图书编号
            if (op != null && op.Equals("subcount"))//购物车物品数量减少事件处理
            {
                ArrayList shopList = (ArrayList)Session["shopList"];//得到保存在session的购物车列表
                int i;
                for (i = 0; i < shopList.Count; i++)
                    if (isbn == ((shopObject)shopList[i]).Isbn)
                    {
                        ((shopObject)shopList[i]).Count--;//如果找到增加图书数量
                        if (((shopObject)shopList[i]).Count == 0)//如果图书数量为0删除图书
                        {
                            shopList.RemoveAt(i);
                        }
                        break;
                    }
            }
            if (op != null && op.Equals("addcount"))//购物车物品数量增加事件处理
            {
                ArrayList shopList = (ArrayList)Session["shopList"];//得到保存在session的购物车列表
                int i;
                for (i = 0; i < shopList.Count; i++)
                    if (isbn == ((shopObject)shopList[i]).Isbn)
                    {
                        ((shopObject)shopList[i]).Count++;//如果找到增加图书数量
                        break;
                    }
            }

            //显示购物车
            ArrayList shopCartList = (ArrayList)Session["shopList"];
            GridView1.DataSource = shopCartList;
            GridView1.DataBind();
            GridView1.DataKeyNames = new String[] { "isbn" };

            //计算购物车物品总价格
            if (shopCartList != null)
            {
                double sumPrice = 0;
                for (int i = 0; i < shopCartList.Count; i++)
                    sumPrice += ((shopObject)shopCartList[i]).Bprice * ((shopObject)shopCartList[i]).Count;
                sumCount.Text = "购物车总价格为：" + sumPrice + "元";
            }


        }
    }
}
