using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThiWebNC.Client
{
    public partial class SiteClient : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string key = txt_timkiem.Text;
        }
        protected void btn_TimKiem(object sender, EventArgs e)
        {
            string keys = txt_timkiem.Text;
            Response.Redirect("TimKiem.aspx?key=" + keys + "");
        }
    }
}