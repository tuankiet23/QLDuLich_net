using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThiWebNC.Admin.App
{
    public partial class QLDichVu : System.Web.UI.Page
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
            var dichvu = (from dv in db.DichVu
                          orderby dv.MaDichVu ascending
                          select dv).ToList();
            dgvQLDichVu.DataSource = dichvu;
            dgvQLDichVu.DataBind();
            btnDelete.Visible = false;
        }

        public void clearText()
        {
            //txt_Images.Text = "";
            txt_madichvu.Text = "";
            //txt_mota.Text = "";
            txt_mota.InnerText = "";
            txt_tendv.Text = "";
            txt_thongtin.Text = "";
            txt_tinhtrang.Text = "";

            txt_madichvu.ReadOnly = false;
        }

        protected void linkDelete_Command(object sender, CommandEventArgs e)
        {
            dulichEntities db = new dulichEntities();
            string MaDichVu = e.CommandArgument.ToString();
            DichVu obj = db.DichVu.FirstOrDefault(x => x.MaDichVu == MaDichVu);

            if (obj != null)
            {
                db.DichVu.Remove(obj);
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
            string MaDichvu = e.CommandArgument.ToString();

            DichVu obj = db.DichVu.FirstOrDefault(x => x.MaDichVu == MaDichvu);

            if (obj != null)
            {
               // txt_Images.Text = obj.Images ;
                txt_madichvu.Text = obj.MaDichVu;
                //txt_mota.Text = obj.MoTaChiTiet;
                txt_mota.InnerText = obj.MoTaChiTiet;
                txt_tendv.Text = obj.TenDichVu;
                txt_thongtin.Text = obj.Thongtin;
                txt_tinhtrang.Text = obj.TinhTrang;

                txt_madichvu.ReadOnly = true;
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
                DichVu obj = new DichVu();
                obj.MaDichVu = txt_madichvu.Text;
                obj.TenDichVu = txt_tendv.Text;
                //obj.MoTaChiTiet = txt_mota.Text;
                obj.MoTaChiTiet = txt_mota.InnerText;
                //obj.Images = txt_Images.Text;
                obj.TinhTrang = txt_tinhtrang.Text;
                obj.Thongtin = txt_thongtin.Text;

                db.DichVu.Add(obj);
                db.SaveChanges();
                panelform.Visible = false;
                getData();
            }
            else if (btnAdd.Text == "Lưu")
            {
                string MaDichVu = txt_madichvu.Text;
                DichVu obj = db.DichVu.FirstOrDefault(x => x.MaDichVu == MaDichVu);

                if (obj != null)
                {
                    obj.TenDichVu = txt_tendv.Text;
                    //obj.MoTaChiTiet = txt_mota.Text;
                    obj.MoTaChiTiet = txt_mota.InnerText;
                    //obj.Images = txt_Images.Text;
                    obj.TinhTrang = txt_tinhtrang.Text;
                    obj.Thongtin = txt_thongtin.Text;

                    db.SaveChanges();
                    panelform.Visible = false;
                    getData();
                }

            }
        }

        protected void btn_Delete(object sender, CommandEventArgs e)
        {
            dulichEntities db = new dulichEntities();
            string MaDichVu = txt_madichvu.Text;
            DichVu obj = db.DichVu.FirstOrDefault(x => x.MaDichVu == MaDichVu);

            if (obj != null)
            {
                db.DichVu.Remove(obj);
            }
            db.SaveChanges();
            getData();
            clearText();
        }

        protected void btn_Out(object sender, CommandEventArgs e)
        {
            panelform.Visible = false;
        }

        protected void dgvQLDichVu_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvQLDichVu.PageIndex = e.NewPageIndex;
            getData();
        }
    }
}