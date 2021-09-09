using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThiWebNC.Admin.App
{
    public partial class QLNhanVien : System.Web.UI.Page
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
            var nhanvien = (from nv in db.NhanVien
                             //where sl.TrangThai=="Tắt"
                             orderby nv.MaNV ascending
                             select nv).ToList();
            dgvQLNhanVien.DataSource = nhanvien;
            dgvQLNhanVien.DataBind();
            btnDelete.Visible = false;
        }

        public void clearText()
        {
            txt_manv.Text = "";
            txt_ngaysinh.Text = "2000-01-01";
            txt_chucvu.Text = "";
            txt_que.Text = "";
            txt_tennv.Text = "";

            txt_manv.ReadOnly = false;
        }

        protected void linkDelete_Command(object sender, CommandEventArgs e)
        {
            dulichEntities db = new dulichEntities();
            string MaNV = e.CommandArgument.ToString();
            NhanVien obj = db.NhanVien.FirstOrDefault(x => x.MaNV == MaNV);

            if (obj != null)
            {
                db.NhanVien.Remove(obj);
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
            string MaNV = e.CommandArgument.ToString();

            NhanVien obj = db.NhanVien.FirstOrDefault(x => x.MaNV == MaNV);

            if (obj != null)
            {
                txt_tennv.Text = obj.TenNV;
                txt_que.Text = obj.TenNV;
                txt_ngaysinh.Text =String.Format("{0:yyyy-MM-dd}",obj.NgaySinh);
                txt_manv.Text = obj.MaNV;
                txt_chucvu.Text = obj.ChucVu;
                txt_manv.ReadOnly = true;
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
                NhanVien obj = new NhanVien();

                obj.ChucVu = txt_chucvu.Text;
                obj.MaNV = txt_manv.Text;
                obj.NgaySinh = Convert.ToDateTime(txt_ngaysinh.Text);
                obj.QueQuan = txt_que.Text;
                obj.TenNV = txt_tennv.Text;

                db.NhanVien.Add(obj);
                db.SaveChanges();
                panelform.Visible = false;
                getData();
            }
            else if (btnAdd.Text == "Lưu")
            {
                string MaNV = txt_manv.Text;
                NhanVien obj = db.NhanVien.FirstOrDefault(x => x.MaNV == MaNV);

                if (obj != null)
                {
                    obj.ChucVu = txt_chucvu.Text;
                    //obj.MaNV = txt_manv.Text;
                    obj.NgaySinh = Convert.ToDateTime(txt_ngaysinh.Text);
                    obj.QueQuan = txt_que.Text;
                    obj.TenNV = txt_tennv.Text;

                    db.SaveChanges();
                    panelform.Visible = false;
                    getData();
                }
            }
        }

        protected void btn_Delete(object sender, CommandEventArgs e)
        {
            dulichEntities db = new dulichEntities();
            string MaNV = txt_manv.Text;
            NhanVien obj = db.NhanVien.FirstOrDefault(x => x.MaNV == MaNV);

            if (obj != null)
            {
                db.NhanVien.Remove(obj);
            }
            db.SaveChanges();
            getData();
            clearText();
        }

        protected void btn_Out(object sender, CommandEventArgs e)
        {
            panelform.Visible = false;
        }

        protected void dgvQLNhanVien_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvQLNhanVien.PageIndex = e.NewPageIndex;
            getData();
        }
    }
}