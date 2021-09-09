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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnthongbao.Visible = false;
                pnsucces.Visible = false;
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

        protected void btn_Register(object sender, CommandEventArgs e)
        {
            string username = txtusername.Text;
            string pass1 = txtpass1.Text;
            string pass2 = txtpass2.Text;

            dulichEntities db = new dulichEntities();
            Users obj = db.Users.FirstOrDefault(x => x.Username == username);
            if (obj != null)
            {
                pnthongbao.Visible = true;
            }
            else
            {
                if (pass1 == pass2)
                {
                    Users newacc = new Users();
                    newacc.Username = username;
                    newacc.Userpass = GetMD5(pass2);

                    db.Users.Add(newacc);
                    db.SaveChanges();
                    pnsucces.Visible = true;
                    pnthongbao.Visible = false;
                    Response.Redirect("Login.aspx");
                }
                else
                    pnthongbao.Visible = true;
            }
        }
    }
}