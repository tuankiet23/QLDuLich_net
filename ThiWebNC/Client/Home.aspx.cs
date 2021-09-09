using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThiWebNC.Client
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getThongdung();
                getnew();
                getHot();
                getSlide();
                getCaocap();

            }
        }

        private void getThongdung()
        {
            dulichEntities db = new dulichEntities();
            var thongdung = (from Tour in db.Tour
                             join Diadiem in db.Diadiem on Tour.Madiadiem equals Diadiem.Madiadiem
                             join LoaiTour in db.LoaiTour on Tour.MaLoaiTour equals LoaiTour.MaLoaiTour
                             join TinhTrangTour in db.TinhTrangTour on Tour.MaTinhTrangTour equals TinhTrangTour.MaTinhTrangTour
                             where Tour.Banggia<=2000000
                             select new
                             {
                                 MaLoaiTour = LoaiTour.MaLoaiTour,
                                 Matour = Tour.Matour,
                                 Images = Tour.Images,
                                 Thoiluong = Tour.Thoiluong,
                                 Banggia = Tour.Banggia,
                                 Tentour = Tour.Tentour,
                                 Tendiadiem = Diadiem.Tendiadiem,
                                 MaTinhTrangTour = TinhTrangTour.MaTinhTrangTour

                             }
            ).Take(6).ToList();

            rpThongdung.DataSource = thongdung;
            rpThongdung.DataBind();
        }

        private void getnew()
        {
            dulichEntities db = new dulichEntities();
            var tourmoi = (from Tour in db.Tour
                           join Diadiem in db.Diadiem
                           on Tour.Madiadiem equals Diadiem.Madiadiem
                           join LoaiTour in db.LoaiTour on Tour.MaLoaiTour equals LoaiTour.MaLoaiTour
                           join TinhTrangTour in db.TinhTrangTour on Tour.MaTinhTrangTour equals TinhTrangTour.MaTinhTrangTour
                           orderby Tour.Ngaycapnhat descending
                           select new
                           {
                               MaLoaiTour = LoaiTour.MaLoaiTour,
                               Matour = Tour.Matour,
                               Images = Tour.Images,
                               Banggia = Tour.Banggia,
                               Tentour = Tour.Tentour,
                               Thoiluong = Tour.Thoiluong,
                               Tendiadiem = Diadiem.Tendiadiem,
                               MaTinhTrangTour = TinhTrangTour.MaTinhTrangTour

                           }
            ).Take(4).ToList();
            rdtournew.DataSource = tourmoi;
            rdtournew.DataBind();
        }
        //đếm theo số lượng đặt tour
        public void getHot()
        {
            dulichEntities db = new dulichEntities();
            var tourhot = (from Tour in db.Tour
                           join Diadiem in db.Diadiem on Tour.Madiadiem equals Diadiem.Madiadiem
                           join LoaiTour in db.LoaiTour on Tour.MaLoaiTour equals LoaiTour.MaLoaiTour
                           join TinhTrangTour in db.TinhTrangTour on Tour.MaTinhTrangTour equals TinhTrangTour.MaTinhTrangTour
                           select new
                           {
                               MaLoaiTour = LoaiTour.MaLoaiTour,
                               Matour = Tour.Matour,
                               Images = Tour.Images,
                               Thoiluong = Tour.Thoiluong,
                               Banggia = Tour.Banggia,
                               Tentour = Tour.Tentour,
                               Tendiadiem = Diadiem.Tendiadiem,
                               MaTinhTrangTour = TinhTrangTour.MaTinhTrangTour
                           }
            ).Take(6).ToList();

            rpSpHot.DataSource = tourhot;
            rpSpHot.DataBind();

        }

       
        public void getSlide()
        {
            dulichEntities db = new dulichEntities();
            var slide = (from Slide in db.Slide
                         where Slide.TrangThai == "1"
                         select Slide).ToList();
            RpSlide.DataSource = slide;
            RpSlide.DataBind();

        }
        public void getCaocap()
        {
            dulichEntities db = new dulichEntities();
            var caocap = (from Tour in db.Tour
                          join Diadiem in db.Diadiem on Tour.Madiadiem equals Diadiem.Madiadiem
                          join LoaiTour in db.LoaiTour on Tour.MaLoaiTour equals LoaiTour.MaLoaiTour
                          join TinhTrangTour in db.TinhTrangTour on Tour.MaTinhTrangTour equals TinhTrangTour.MaTinhTrangTour
                          where Tour.Banggia >= 3000000
                          select new
                          {
                              MaLoaiTour = LoaiTour.MaLoaiTour,
                              Matour = Tour.Matour,
                              Images = Tour.Images,
                              Thoiluong = Tour.Thoiluong,
                              Banggia = Tour.Banggia,
                              Tentour = Tour.Tentour,
                              Tendiadiem = Diadiem.Tendiadiem,
                              MaTinhTrangTour = TinhTrangTour.MaTinhTrangTour
                          }
            ).Take(4).ToList();

            rpCaocap.DataSource = caocap;
            rpCaocap.DataBind();

        }
    }
}