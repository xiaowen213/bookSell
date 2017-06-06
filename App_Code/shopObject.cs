using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

/// <summary>
///保存购物车中存放的图书号及购买量
/// </summary>
public class shopObject
{
    private string isbn;//书号

    public string Isbn
    {
        get { return isbn; }
        set { isbn = value; }
    }
    private int count;//数量

    public int Count
    {
        get { return count; }
        set { count = value; }
    }
    private string bname;//书名 

    public string Bname
    {
        get { return bname; }
        set { bname = value; }
    }
    private double bprice;//单价

    public double Bprice
    {
        get { return bprice; }
        set { bprice = value; }
    }
}
