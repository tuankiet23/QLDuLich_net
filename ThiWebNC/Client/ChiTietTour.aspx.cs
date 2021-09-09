using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThiWebNC.Client
{
    public partial class ChiTietTour : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ID = Request.QueryString["ID"];
            string ml = Request.QueryString["ml"];
            string ttt = Request.QueryString["ttt"];
            chitiet(ID);
            {
                if (!IsPostBack)
                {
                    chitiet(ID);

                }
            }
            lienhe(ml);
            {
                if (!IsPostBack)
                {
                    lienhe(ml);

                }
            }
            if (!IsPostBack)
            {
                getCBThanhToan();
                
            }
            if (ttt == "TT002")
            {
                panel.Visible = false;
                lable.Text = "TOUR ĐÃ ĐỦ CHỖ, MONG KHÁCH HÀNG THÔNG CẢM!!!";
            }

        }

        private void lienhe(string ml)
        {
            dulichEntities db = new dulichEntities();
            var lienhe = (from Tour in db.Tour
                          join Diadiem in db.Diadiem
                          on Tour.Madiadiem equals Diadiem.Madiadiem
                          join TinhTrangTour in db.TinhTrangTour on Tour.MaTinhTrangTour equals TinhTrangTour.MaTinhTrangTour
                          where Tour.MaLoaiTour == ml
                          select new
                          {
                              Images = Tour.Images,
                              Banggia = Tour.Banggia,
                              Thoiluong = Tour.Thoiluong,
                              Tentour = Tour.Tentour,
                              Matour = Tour.Matour,
                              MaLoaiTour = Tour.MaLoaiTour,
                              Tendiadiem = Diadiem.Tendiadiem,
                              Mota = Tour.Mota,
                              Lichtrinh = Tour.Lichtrinh,
                              Thongtinlienquan = Tour.Thongtinlienquan,
                              MaTinhTrangTour=TinhTrangTour.MaTinhTrangTour
                          }).ToList();

            rpLienhe.DataSource = lienhe;
            rpLienhe.DataBind();
        }



        public void chitiet(string iD)
        {
            dulichEntities db = new dulichEntities();
            var chitiet = (from Tour in db.Tour
                           join Diadiem in db.Diadiem
                           on Tour.Madiadiem equals Diadiem.Madiadiem
                           join TinhTrangTour in db.TinhTrangTour on Tour.MaTinhTrangTour equals TinhTrangTour.MaTinhTrangTour
                           where Tour.Matour == iD
                           select new
                           {
                               Images = Tour.Images,
                               Banggia = Tour.Banggia,
                               Thoiluong = Tour.Thoiluong,
                               Tentour = Tour.Tentour,
                               Matour = Tour.Matour,
                               MaLoaiTour = Tour.MaLoaiTour,
                               Tendiadiem = Diadiem.Tendiadiem,
                               Mota = Tour.Mota,
                               Lichtrinh = Tour.Lichtrinh,
                               Thongtinlienquan = Tour.Thongtinlienquan,
                               TenTinhTrangTour = TinhTrangTour.MaTinhTrangTour
                           }).ToList();

            rpChitiet.DataSource = chitiet;
            rpChitiet.DataBind();
        }
        public void getCBThanhToan()
        {
            dulichEntities db = new dulichEntities();
            List<Phuongthucthanhtoan> pt = db.Phuongthucthanhtoan.OrderBy(x => x.Mapt).ToList();

            cbphuongthuctt.DataSource = pt;
            cbphuongthuctt.DataValueField = "Mapt";
            cbphuongthuctt.DataTextField = "Tenpt";
            cbphuongthuctt.DataBind();
        }
        public void clearTexxt()
        {
            txt_diachi.Text = "";
            txt_dienthoai.Text = "";
            txt_email.Text = "";
            txt_songuoilon.Text = "";
            txt_sotreem.Text = "";
            txt_tenkh.Text = "";
            txt_yeucau.Text = "";
        }

        protected void btn_DatTour(object sender, CommandEventArgs e)
        {
            dulichEntities db = new dulichEntities();
            DatTour obj = new DatTour();
            //obj.Matour = id;
            string Matour = Request.QueryString["ID"];
            obj.Matour = Matour;
            obj.TenKH = txt_tenkh.Text;
            obj.DienThoai = txt_dienthoai.Text;
            obj.Email = txt_email.Text;
            obj.DiaChi = txt_diachi.Text;
            obj.SoNguoiLon = Convert.ToInt32(txt_songuoilon.Text);
            obj.SoTreEm = Convert.ToInt32(txt_sotreem.Text);
            obj.Mapt = cbphuongthuctt.SelectedValue;
            obj.YeuCau = txt_yeucau.Text;
            obj.MaTinhtrangDatTour = "MTTDT001";

            try
            {
                db.DatTour.Add(obj);
                db.SaveChanges();
                clearTexxt();
                lb_thongbao.Text = "Đăng kí tham gia Tour thành công";
            }
            catch
            {
                lb_thongbao.Text = "Đăng kí không thành công";
            }

        }
        public void ktra()
        {
            dulichEntities db = new dulichEntities();
            string tt = "MT002";
            Tour obj = db.Tour.FirstOrDefault(x => x.MaTinhTrangTour == tt);
            if (obj != null)
            {
                panel.Visible = false;
            }
            else
            {
                panel.Visible = true;
            }
        }
        
        }
    }
