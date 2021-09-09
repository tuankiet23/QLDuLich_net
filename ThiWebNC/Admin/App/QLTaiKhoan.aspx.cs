using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThiWebNC.Admin.App
{
    public partial class QLTaiKhoan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getData();
            }
        }

        public void getData()
        {
            dulichEntities db = new dulichEntities();
            var account = (from acc in db.Users
                           select acc).ToList();
            dgvAccount.DataSource = account;
            dgvAccount.DataBind();
        }
        
        protected void dgvAccount_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvAccount.PageIndex = e.NewPageIndex;
            getData();
        }

        //Xoá
        protected void linkDelete_Command(object sender, CommandEventArgs e)
        {
            dulichEntities db = new dulichEntities();
            string Usename = e.CommandArgument.ToString();
            Users obj = db.Users.FirstOrDefault(x => x.Username==Usename);
            if (obj != null)
            {
                db.Users.Remove(obj);
            }
            db.SaveChanges();
            getData();
        }
    }
}