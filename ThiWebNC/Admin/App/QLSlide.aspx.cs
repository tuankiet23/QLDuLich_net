using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThiWebNC.Admin.App
{
    public partial class QLSlide : System.Web.UI.Page
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
            var slide = (from sl in db.Slide
                         //where sl.TrangThai=="Tắt"
                          orderby sl.MaAnh ascending
                          select sl).ToList();
            dgvQLSlide.DataSource = slide;
            dgvQLSlide.DataBind();
            btnDelete.Visible = false;
        }

        public string getLinkAnh(string MaAnh)
        {
            try
            {
                dulichEntities db = new dulichEntities();
                return db.Slide.FirstOrDefault(x => x.MaAnh == MaAnh).Anh;
            }
            catch
            {
                return "";
            }
        }

        public void clearText()
        {
            txt_anh.Text = "";
            txt_maanh.Text = "";
            txt_mota.Text = "";
            //txt_trangthai.Text = "";

            txt_maanh.ReadOnly = false;
        }

        protected void linkDelete_Command(object sender, CommandEventArgs e)
        {
            dulichEntities db = new dulichEntities();
            string MaAnh = e.CommandArgument.ToString();
            Slide obj = db.Slide.FirstOrDefault(x => x.MaAnh == MaAnh);

            if (obj != null)
            {
                db.Slide.Remove(obj);
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
            string MaAnh = e.CommandArgument.ToString();

            Slide obj = db.Slide.FirstOrDefault(x => x.MaAnh == MaAnh);

            if (obj != null)
            {
                txt_anh.Text = obj.Anh;
                txt_mota.Text = obj.MoTa;
                txt_maanh.Text = obj.MaAnh;
                //txt_trangthai.Text =obj.TrangThai;
                cbTrangThai.SelectedValue = obj.TrangThai;
                txt_maanh.ReadOnly = true;
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
           
            if (btnAdd.Text == "Thêm")
            {
                Slide obj = new Slide();

                obj.MaAnh = txt_maanh.Text;
                obj.Anh = txt_anh.Text;
                obj.MoTa = txt_mota.Text;
                //obj.TrangThai = txt_trangthai.Text;
                obj.TrangThai = cbTrangThai.SelectedValue;

                db.Slide.Add(obj);
                db.SaveChanges();
                panelform.Visible = false;
                getData();
            }
            else if (btnAdd.Text == "Lưu")
            {
                string MaAnh = txt_maanh.Text;
                Slide obj = db.Slide.FirstOrDefault(x => x.MaAnh == MaAnh);

                if (obj != null)
                {
                    //obj.MaAnh = txt_maanh.Text;
                    obj.Anh = txt_anh.Text;
                    obj.MoTa = txt_mota.Text;
                    //obj.TrangThai = txt_trangthai.Text;
                    obj.TrangThai = cbTrangThai.SelectedValue;

                    db.SaveChanges();
                    panelform.Visible = false;
                    getData();
                }
            }
        }

        protected void btn_Delete(object sender, CommandEventArgs e)
        {
            dulichEntities db = new dulichEntities();
            string MaAnh = txt_maanh.Text;
            Slide obj = db.Slide.FirstOrDefault(x => x.MaAnh == MaAnh);

            if (obj != null)
            {
                db.Slide.Remove(obj);
            }
            db.SaveChanges();
            getData();
            clearText();
        }

        protected void btn_Out(object sender, CommandEventArgs e)
        {
            panelform.Visible = false;
        }

        protected void dgvQLSlide_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvQLSlide.PageIndex = e.NewPageIndex;
            getData();
        }

    }
}