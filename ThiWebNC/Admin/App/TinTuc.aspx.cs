using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThiWebNC.Admin.App
{
    public partial class TinTuc : System.Web.UI.Page
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
            var tintuc = (from tt in db.Tintuc
                          orderby tt.MaTT ascending
                          select tt).ToList();
            dgvTinTuc.DataSource = tintuc;
            dgvTinTuc.DataBind();
            btnDelete.Visible = false;
        }

        public string getLinkAnh(string MaTT)
        {
            try
            {
                dulichEntities db = new dulichEntities();
                return db.Tintuc.FirstOrDefault(x => x.MaTT == MaTT).Hinhanh;
            }
            catch
            {
                return "";
            }
        }

        public void clearText()
        {
            txt_anh.Text = "";
            txt_loaitt.Text = "";
            txt_matt.Text = "";
            txt_mota.Text = "";
            txt_ngaydang.Text = "";
            //txt_noidung.Text = "";
            txt_noidung.InnerText = "";
            txt_tieude.Text = "";

            txt_matt.ReadOnly = false;
        }

        protected void linkDelete_Command(object sender, CommandEventArgs e)
        {
            dulichEntities db = new dulichEntities();
            string MaTT = e.CommandArgument.ToString();
            Tintuc obj = db.Tintuc.FirstOrDefault(x => x.MaTT == MaTT);

            if (obj != null)
            {
                db.Tintuc.Remove(obj);
            }
            db.SaveChanges();
            getData();
        }

        protected void linkEdit_Command(object sender, CommandEventArgs e)
        {
            panelform.Visible = true;
            btnDelete.Visible = true;
            btnAdd.Text = "Lưu";
            dulichEntities db = new dulichEntities();
            string MaTT = e.CommandArgument.ToString();

            Tintuc obj = db.Tintuc.FirstOrDefault(x => x.MaTT == MaTT);

            if (obj != null)
            {
                txt_anh.Text = obj.Hinhanh;
                txt_loaitt.Text = obj.Loaitt;
                txt_mota.Text = obj.Mota;
                txt_matt.Text = obj.MaTT;
                txt_ngaydang.Text = String.Format("{0:yyyy-MM-dd}",obj.Ngaydang);
                //txt_noidung.Text = obj.Noidung;
                txt_noidung.InnerText = obj.Noidung;
                txt_tieude.Text = obj.Tieude;
                //txt_matt.ReadOnly = true;
            }
            txt_matt.ReadOnly = true;
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

            if (btnAdd.Text == "Thêm")
            {
                Tintuc obj = new Tintuc();
          
                obj.Tieude = txt_tieude.Text;
                //obj.Noidung = txt_noidung.Text;
                obj.Noidung = txt_noidung.InnerText;
                obj.Ngaydang = Convert.ToDateTime(txt_ngaydang.Text);
                obj.Mota = txt_mota.Text;
                obj.MaTT = txt_matt.Text;
                obj.Loaitt = txt_loaitt.Text;
                obj.Hinhanh = txt_anh.Text;

                db.Tintuc.Add(obj);
                db.SaveChanges();
                panelform.Visible = false;
                getData();
            }
            else if (btnAdd.Text == "Lưu")
            {
                string MaTT = txt_matt.Text;
                Tintuc obj = db.Tintuc.FirstOrDefault(x => x.MaTT == MaTT);

                if (obj != null)
                {
                    obj.Tieude = txt_tieude.Text;
                    //obj.Noidung = txt_noidung.Text;
                    obj.Noidung = txt_noidung.InnerText;
                    obj.Ngaydang = Convert.ToDateTime(txt_ngaydang.Text);
                    obj.Mota = txt_mota.Text;
                    //obj.MaTT = txt_matt.Text;
                    obj.Loaitt = txt_loaitt.Text;
                    obj.Hinhanh = txt_anh.Text;

                    db.SaveChanges();
                    panelform.Visible = false;
                    getData();
                }

            }
        }

        protected void btn_Delete(object sender, CommandEventArgs e)
        {
            dulichEntities db = new dulichEntities();
            string Matt = txt_matt.Text;
            Tintuc obj = db.Tintuc.FirstOrDefault(x => x.MaTT == Matt);

            if (obj != null)
            {
                db.Tintuc.Remove(obj);
            }
            db.SaveChanges();
            getData();
            clearText();
        }

        protected void btn_Out(object sender, CommandEventArgs e)
        {
            panelform.Visible = false;
        }

        protected void dgvTinTuc_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvTinTuc.PageIndex = e.NewPageIndex;
            getData();
        }
    }
}