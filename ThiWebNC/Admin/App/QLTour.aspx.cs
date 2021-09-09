using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThiWebNC.Admin.App
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getData();
                getCBLoaiTour();
                getCBKhachSan();
                getCBDiaDiem();
                getCBTinhTrang();
                getCBDichVu();
            }
            panelform.Visible = false;
        }

        public void getData()
        {
            dulichEntities db = new dulichEntities();
            var qltour = (from qlt in db.Tour
                          orderby qlt.Matour ascending
                          select qlt).ToList();
            dgvQLTour.DataSource = qltour;
            dgvQLTour.DataBind();
        }
        //public void getData()
        //{
        //    dulichEntities db = new dulichEntities();
        //    var qltour = (from qlt in db.Tour
        //                  join ks in db.KhachSan on qlt.MaKhachSan equals ks.MaKhachSan
        //                  join dd in db.Diadiem on qlt.Madiadiem equals dd.Madiadiem

        //                  select new { Matour = qlt.Matour, MaLoaiTour = qlt.MaLoaiTour, Tentour = qlt.Tentour, Mota = qlt.Mota, Lichtrinh = qlt.Lichtrinh, Banggia = qlt.Banggia, Thongtinlienquan = qlt.Thongtinlienquan, Images = qlt.Images, Tinhtrang = qlt.Tinhtrang, Diadiemkhoihanh = qlt.Diadiemkhoihanh, Thoiluong = qlt.Thoiluong, MaKhachSan = qlt.MaKhachSan, Madiadiem = qlt.Madiadiem, Phuongtien = qlt.Phuongtien, Lienhe = qlt.Lienhe, Ngaycapnhat = qlt.Ngaycapnhat }).ToList();
        //    dgvQLTour.DataSource = qltour;
        //    dgvQLTour.DataBind();
        //}

        public string getLoaiTour(string maloaitour)
        {
            try
            {
                dulichEntities db = new dulichEntities();
                return db.LoaiTour.First(x => x.MaLoaiTour == maloaitour).TenLoaiTour;
            }
            catch
            {
                return "";
            }
        }

        public string getKhachSan(string makhachsan)
        {
            try
            {
                dulichEntities db = new dulichEntities();
                return db.KhachSan.First(x => x.MaKhachSan == makhachsan).TenKhachSan;
            }
            catch
            {
                return "";
            }
        }

        public string getDiaDiem(string madiadiem)
        {
            try
            {
                dulichEntities db = new dulichEntities();
                return db.Diadiem.First(x => x.Madiadiem == madiadiem).Tendiadiem;
            }
            catch
            {
                return "";
            }
        }

        public string getDichVu(string madichvu)
        {
            try
            {
                dulichEntities db = new dulichEntities();
                return db.DichVu.First(x => x.MaDichVu == madichvu).TenDichVu;
            }
            catch
            {
                return "";
            }
        }

        public string getTinhTrang(string matinhtrangtour)
        {
            try
            {
                dulichEntities db = new dulichEntities();
                return db.TinhTrangTour.First(x => x.MaTinhTrangTour == matinhtrangtour).TenTinhTrangTour;
            }
            catch
            {
                return "";
            }
        }

        public string getLinkAnh(string Matour)
        {
            try
            {
                dulichEntities db = new dulichEntities();
                return db.Tour.FirstOrDefault(x => x.Matour == Matour).Images;
            }
            catch
            {
                return "";
            }
        }


        public void getCBLoaiTour()
        {
            dulichEntities db = new dulichEntities();
            List<LoaiTour> lt = db.LoaiTour.OrderBy(x => x.MaLoaiTour).ToList();

            cbLoaiTour.DataSource = lt;
            cbLoaiTour.DataValueField = "MaLoaiTour";
            cbLoaiTour.DataTextField = "TenLoaiTour";
            cbLoaiTour.DataBind();
        }

        public void getCBKhachSan()
        {
            dulichEntities db = new dulichEntities();
            List<KhachSan> lt = db.KhachSan.OrderBy(x => x.MaKhachSan).ToList();

            cbKhachSan.DataSource = lt;
            cbKhachSan.DataValueField = "MaKhachSan";
            cbKhachSan.DataTextField = "TenKhachSan";
            cbKhachSan.DataBind();
        }

        public void getCBDiaDiem()
        {
            dulichEntities db = new dulichEntities();
            List<Diadiem> lt = db.Diadiem.OrderBy(x => x.Madiadiem).ToList();

            cbDiemDen.DataSource = lt;
            cbDiemDen.DataValueField = "Madiadiem";
            cbDiemDen.DataTextField = "Tendiadiem";
            cbDiemDen.DataBind();
        }

        public void getCBTinhTrang()
        {
            dulichEntities db = new dulichEntities();
            List<TinhTrangTour> lt = db.TinhTrangTour.OrderBy(x => x.MaTinhTrangTour).ToList();

            cbTinhTrang.DataSource = lt;
            cbTinhTrang.DataValueField = "MaTinhTrangTour";
            cbTinhTrang.DataTextField = "TenTinhTrangTour";
            cbTinhTrang.DataBind();
        }
        public void getCBDichVu()
        {
            dulichEntities db = new dulichEntities();
            List<DichVu> lt = db.DichVu.OrderBy(x => x.MaDichVu).ToList();

            cbDichVu.DataSource = lt;
            cbDichVu.DataValueField = "MaDichVu";
            cbDichVu.DataTextField = "TenDichVu";
            cbDichVu.DataBind();
        }

        public void clearText()
        {
            txt_Matour.Text = "";
            //txt_maloaitour.Text = "";
            txt_tentour.Text = "";
            //txt_mota.Text = "";
            txt_mota.InnerText = "";
            //txt_lichtrinh.Text = "";
            txt_lichtrinh.InnerText = "";
            txt_banggia.Text = "";
            //txt_thongtin.Text = "";
            txt_thongtin.InnerText = "";
            txt_Anh.Text = "";
            txt_ngaycapnhat.Text = "2000-01-01";
            txt_diadiemkhoihanh.Text = "";
            txt_thoiluong.Text = "";
            //txt_madiemden.Text = "";
            txt_phuongtien.Text = "";
            txt_lienhe.Text = "";
            txt_NgayDi.Text = "2000-01-01";
            //txt_makhachsan.Text = "";
            txt_Matour.ReadOnly = false;
        }

        protected void btn_Save(object sender, CommandEventArgs e)
        {
            panelform.Visible = true;
            btnAdd.Text = "Thêm";
            clearText();
            btnDelete.Visible = false;
            txt_Matour.ReadOnly = false;
        }

        protected void btn_Add(object sender, CommandEventArgs e)
        {
            dulichEntities db = new dulichEntities();
            if (btnAdd.Text == "Thêm")
            {
                Tour obj = new Tour();
                obj.Matour = txt_Matour.Text;
                //obj.MaLoaiTour = txt_maloaitour.Text;
                obj.MaLoaiTour = cbLoaiTour.SelectedValue;
                obj.Tentour = txt_tentour.Text;
                //obj.Mota = txt_mota.Text;
                obj.Mota = txt_mota.InnerText;
                //obj.Lichtrinh = txt_lichtrinh.Text;
                obj.Lichtrinh = txt_lichtrinh.InnerText;
                obj.Banggia = Convert.ToInt32(txt_banggia.Text);
                //obj.Thongtinlienquan = txt_thongtin.Text;
                obj.Thongtinlienquan = txt_thongtin.InnerText;
                obj.Images = txt_Anh.Text;
                //obj.Tinhtrang = txt_tinhtrang.Text;
                obj.Diadiemkhoihanh = txt_diadiemkhoihanh.Text;
                obj.Thoiluong = txt_thoiluong.Text;
                //obj.Madiadiem = txt_madiemden.Text;
                obj.Madiadiem = cbDiemDen.SelectedValue;
                obj.Phuongtien = txt_phuongtien.Text;
                obj.Lienhe = txt_lienhe.Text;
                //obj.MaKhachSan = txt_makhachsan.Text;
                obj.MaKhachSan = cbKhachSan.SelectedValue;
                obj.Ngaycapnhat = Convert.ToDateTime(txt_ngaycapnhat.Text);
                obj.NgayDi = Convert.ToDateTime(txt_NgayDi.Text);
                obj.MaTinhTrangTour = cbTinhTrang.SelectedValue;
                obj.MaDichVu = cbDichVu.SelectedValue;

                db.Tour.Add(obj);
                db.SaveChanges();
                panelform.Visible = false;
                getData();
            }
            else if (btnAdd.Text == "Lưu")
            {
                string Matour = txt_Matour.Text;
                Tour obj = db.Tour.FirstOrDefault(x => x.Matour == Matour);
                if (obj != null)
                {
                    //obj.Matour = txt_Matour.Text;
                    //obj.MaLoaiTour = txt_maloaitour.Text;
                    obj.MaLoaiTour = cbLoaiTour.SelectedValue;
                    obj.Tentour = txt_tentour.Text;
                    //obj.Mota = txt_mota.Text;
                    obj.Mota = txt_mota.InnerText;
                    //obj.Lichtrinh = txt_lichtrinh.Text;
                    obj.Lichtrinh = txt_lichtrinh.InnerText;
                    obj.Banggia = Convert.ToInt32(txt_banggia.Text);
                    //obj.Thongtinlienquan = txt_thongtin.Text;
                    obj.Thongtinlienquan = txt_thongtin.InnerText;
                    obj.Images = txt_Anh.Text;
                    //obj.Tinhtrang = txt_tinhtrang.Text;
                    obj.Diadiemkhoihanh = txt_diadiemkhoihanh.Text;
                    obj.Thoiluong = txt_thoiluong.Text;
                    //obj.Madiadiem = txt_madiemden.Text;
                    obj.Madiadiem = cbDiemDen.SelectedValue;
                    obj.Phuongtien = txt_phuongtien.Text;
                    obj.Lienhe = txt_lienhe.Text;
                    //obj.MaKhachSan = txt_makhachsan.Text;
                    obj.MaKhachSan = cbKhachSan.SelectedValue;
                    obj.Ngaycapnhat = Convert.ToDateTime(txt_ngaycapnhat.Text);
                    obj.NgayDi = Convert.ToDateTime(txt_NgayDi.Text);
                    obj.MaTinhTrangTour = cbTinhTrang.SelectedValue;
                    obj.MaDichVu = cbDichVu.SelectedValue;

                    db.SaveChanges();
                    panelform.Visible = false;
                    getData();
                }

            }
        }

        protected void btn_Delete(object sender, CommandEventArgs e)
        {
            string Matour = txt_Matour.Text;
            dulichEntities db = new dulichEntities();
            Tour obj = db.Tour.FirstOrDefault(x => x.Matour == Matour);

            if (obj != null)
            {
                db.Tour.Remove(obj);
            }
            db.SaveChanges();
            getData();
            clearText();
        }

        protected void btn_Out(object sender, CommandEventArgs e)
        {
            panelform.Visible = false;
        }

        protected void linkDelete_Command(object sender, CommandEventArgs e)
        {
            dulichEntities db = new dulichEntities();
            string Matour = e.CommandArgument.ToString();
            Tour obj = db.Tour.FirstOrDefault(x => x.Matour == Matour);
            if (obj != null)
            {
                db.Tour.Remove(obj);
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
            string Matour = e.CommandArgument.ToString();
            Tour obj = db.Tour.FirstOrDefault(x => x.Matour == Matour);
            if (obj != null)
            {
                txt_Matour.Text = obj.Matour;
                //txt_maloaitour.Text= obj.MaLoaiTour;
                cbLoaiTour.SelectedValue = obj.MaLoaiTour;
                txt_tentour.Text = obj.Tentour;
                //txt_mota.Text = obj.Mota;
                txt_mota.InnerText = obj.Mota;
                //txt_lichtrinh.Text = obj.Lichtrinh;
                txt_lichtrinh.InnerText = obj.Lichtrinh;
                txt_banggia.Text = Convert.ToString(obj.Banggia);
                //txt_thongtin.Text = obj.Thongtinlienquan;
                txt_thongtin.InnerText = obj.Thongtinlienquan;
                txt_Anh.Text = obj.Images;
                //txt_tinhtrang.Text = obj.Tinhtrang;
                txt_diadiemkhoihanh.Text = obj.Diadiemkhoihanh;
                txt_thoiluong.Text = obj.Thoiluong;
                //txt_madiemden.Text = obj.Madiadiem;
                cbDiemDen.SelectedValue = obj.Madiadiem;
                cbTinhTrang.SelectedValue = obj.MaTinhTrangTour;
                txt_phuongtien.Text = obj.Phuongtien;
                txt_lienhe.Text = obj.Lienhe;
                //txt_makhachsan.Text = obj.MaKhachSan;
                cbKhachSan.SelectedValue = obj.MaKhachSan;
                cbTinhTrang.SelectedValue = obj.MaTinhTrangTour;
                cbDichVu.SelectedValue = obj.MaDichVu;
                txt_ngaycapnhat.Text = String.Format("{0:yyyy-MM-dd}", obj.Ngaycapnhat);
                txt_NgayDi.Text = String.Format("{0:yyyy-MM-dd}", obj.NgayDi);

                txt_Matour.ReadOnly = true;
            }
        }

        protected void dgvQLTour_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvQLTour.PageIndex = e.NewPageIndex;
            getData();
        }
    }
}