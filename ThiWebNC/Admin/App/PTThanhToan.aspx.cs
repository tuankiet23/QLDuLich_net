using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThiWebNC.Admin.App
{
    public partial class PTThanhToan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getData();
            }
            panelform.Visible = false;
        }

        public void getData()
        {
            dulichEntities db = new dulichEntities();
            var pptt = (from pt in db.Phuongthucthanhtoan
                        orderby pt.Mapt ascending
                        select pt).ToList();
            dgvQLPTThanhToan.DataSource = pptt;
            dgvQLPTThanhToan.DataBind();
            btnDelete.Visible = false;
        }

        public void clearText()
        {
            txt_mapt.Text = "";
            txt_tenpt.Text = "";

            txt_mapt.ReadOnly = false;
        }

        protected void linkEdit_Command(object sender, CommandEventArgs e)
        {
            panelform.Visible = true;
            btnAdd.Text = "Lưu";
            btnDelete.Visible = true;

            dulichEntities db = new dulichEntities();
            string Mapt = e.CommandArgument.ToString();
            Phuongthucthanhtoan obj = db.Phuongthucthanhtoan.FirstOrDefault(x => x.Mapt == Mapt);

            if (obj != null)
            {
                txt_mapt.Text = obj.Mapt;
                txt_tenpt.Text = obj.Tenpt;
                txt_mapt.ReadOnly = true;
            }
        }

        protected void linkDelete_Command(object sender, CommandEventArgs e)
        {
            dulichEntities db = new dulichEntities();
            string Mapt = e.CommandArgument.ToString();
            Phuongthucthanhtoan obj = db.Phuongthucthanhtoan.FirstOrDefault(x => x.Mapt == Mapt);

            if (obj != null)
            {
                db.Phuongthucthanhtoan.Remove(obj);
            }
            db.SaveChanges();
            getData();
            clearText();
        }

        protected void btn_Save(object sender, CommandEventArgs e)
        {
            panelform.Visible = true;
            btnAdd.Text = "Thêm";
            btnDelete.Visible = false;
            clearText();
        }

        protected void btn_Add(object sender, CommandEventArgs e)
        {
            dulichEntities db = new dulichEntities();
            if (btnAdd.Text == "Thêm")
            {
                Phuongthucthanhtoan obj = new Phuongthucthanhtoan();
                obj.Mapt = txt_mapt.Text;
                obj.Tenpt = txt_tenpt.Text;

                db.Phuongthucthanhtoan.Add(obj);
                db.SaveChanges();
                clearText();
                getData();
                panelform.Visible = false;
            }
            else if (btnAdd.Text == "Lưu")
            {
                string Mapt = txt_mapt.Text;
                Phuongthucthanhtoan obj = db.Phuongthucthanhtoan.FirstOrDefault(x => x.Mapt == Mapt);
                if (obj != null)
                {
                    obj.Tenpt = txt_tenpt.Text;

                    db.SaveChanges();
                    clearText();
                    getData();
                    panelform.Visible = false;
                }
            }
        }

        protected void btn_Delete(object sender, CommandEventArgs e)
        {
            dulichEntities db = new dulichEntities();
            string Mapt = txt_mapt.Text;
            Phuongthucthanhtoan obj = db.Phuongthucthanhtoan.FirstOrDefault(x => x.Mapt == Mapt);
            if (obj != null)
            {
                db.Phuongthucthanhtoan.Remove(obj);
            }
            db.SaveChanges();
            clearText();
            getData();
        }

        protected void btn_Out(object sender, CommandEventArgs e)
        {
            panelform.Visible = false;
        }

        protected void dgvQLPTThanhToan_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvQLPTThanhToan.PageIndex = e.NewPageIndex;
            getData();
        }
    }
}