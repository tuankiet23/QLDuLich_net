using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThiWebNC.Admin.AccountManagers
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnthongbao.Visible = false;
            }
        }

        public static string GetMD5(string str)
        {

            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();

            byte[] bHash = md5.ComputeHash(Encoding.UTF8.GetBytes(str));

            StringBuilder sbHash = new StringBuilder();

            foreach (byte b in bHash)
            {

                sbHash.Append(String.Format("{0:x2}", b));

            }

            return sbHash.ToString();

        }

        protected void btn_Login(object sender, CommandEventArgs e)
        {
            string username = txtusername.Text;
            string password = GetMD5(txtpassword.Text);

            dulichEntities db = new dulichEntities();
            List<Users> login = (from user in db.Users
                                 where user.Username == username && user.Userpass == password
                                 select user).ToList();
            if (login.Count > 0)
            {
                Session["username"] = username;
                //Response.Redirect("../App/Index.aspx");
                Response.Redirect("../App/Index.aspx");
            }
            else
                pnthongbao.Visible = true;
        }
    }
}