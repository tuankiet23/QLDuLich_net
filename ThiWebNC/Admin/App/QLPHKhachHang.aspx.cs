using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThiWebNC.Admin.App
{
    public partial class QLPHKhachHang : System.Web.UI.Page
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
            var lienhe = (from lh in db.LienHe
                          orderby lh.MaLH descending
                          select lh).ToList();
            dgvQLPHKhachHang.DataSource = lienhe;
            dgvQLPHKhachHang.DataBind();
            btnDelete.Visible = false;
        }

        public void clearText()
        {
            txt_chude.Text = "";
            txt_email.Text = "";
            txt_madlienhe.Text = "";
            txt_noidung.Text = "";
            txt_tenkh.Text = "";
            txt_tinhtrang.Text = "";

            //txt_madlienhe.ReadOnly = false;
            //txt_chude.ReadOnly = false;
            //txt_email.ReadOnly = false;
            //txt_noidung.ReadOnly = false;
            //txt_tenkh.ReadOnly = false;
        }

        protected void linkDelete_Command(object sender, CommandEventArgs e)
        {
            dulichEntities db = new dulichEntities();
            string MaLH = e.CommandArgument.ToString();
            LienHe obj = db.LienHe.FirstOrDefault(x => x.MaLH == MaLH);
            if (obj != null)
            {
                db.LienHe.Remove(obj);
            }
            db.SaveChanges();
            getData();
        }

        protected void linkEdit_Command(object sender, CommandEventArgs e)
        {
            panelform.Visible = true;
            btnDelete.Visible = true;
            dulichEntities db = new dulichEntities();
            string MaLH = e.CommandArgument.ToString();
            LienHe obj = db.LienHe.FirstOrDefault(x => x.MaLH == MaLH);
            if (obj != null)
            {
                txt_chude.Text = obj.ChuDe;
                txt_email.Text = obj.Email;
                txt_madlienhe.Text = obj.MaLH;
                txt_noidung.Text = obj.NoiDung;
                txt_tenkh.Text = obj.TenKH;
                //txt_tinhtrang.Text = obj.TinhTrang;

                txt_madlienhe.ReadOnly = true;
                txt_chude.ReadOnly = true;
                txt_email.ReadOnly = true;
                txt_noidung.ReadOnly = true;
                txt_tenkh.ReadOnly = true;
            }
        }

        protected void btn_Save(object sender, CommandEventArgs e)
        {
            btnAdd.Text = "Thêm";
            panelform.Visible = true;
            clearText();
            btnDelete.Visible = false;
        }

        protected void btn_Add(object sender, CommandEventArgs e)
        {
            dulichEntities db = new dulichEntities();
            string MaLH = txt_madlienhe.Text;
            LienHe obj = db.LienHe.FirstOrDefault(x => x.MaLH == MaLH);
            if (obj != null)
            {
                //obj.TinhTrang = txt_tinhtrang.Text;
                obj.ChuDe=txt_chude.Text;
                obj.Email=txt_email.Text;
                //obj.MaLH=txt_madlienhe.Text;
                obj.NoiDung=txt_noidung.Text;
                obj.TenKH=txt_tenkh.Text;

                db.SaveChanges();
                clearText();
                panelform.Visible = false;
                getData();
            }
        }

        protected void btn_Delete(object sender, CommandEventArgs e)
        {
            dulichEntities db = new dulichEntities();
            string MaLH = txt_madlienhe.Text;
            LienHe obj = db.LienHe.FirstOrDefault(x => x.MaLH == MaLH);
            if (obj != null)
            {
                db.LienHe.Remove(obj);
            }
            db.SaveChanges();
            clearText();
            panelform.Visible = false;
            getData();
        }

        protected void btn_Out(object sender, CommandEventArgs e)
        {
            panelform.Visible = false;
        }

        protected void dgvQLPHKhachHang_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvQLPHKhachHang.PageIndex = e.NewPageIndex;
            getData();
        }
    }
}