using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThiWebNC.Client
{
    public partial class TourCaoCap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                xemtour();
            }
        }
        public void xemtour()
        {
            dulichEntities db = new dulichEntities();
            var xemtour = (from Tour in db.Tour
                           join Diadiem in db.Diadiem on Tour.Madiadiem equals Diadiem.Madiadiem
                           join LoaiTour in db.LoaiTour on Tour.MaLoaiTour equals LoaiTour.MaLoaiTour
                           join TinhTrangTour in db.TinhTrangTour on Tour.MaTinhTrangTour equals TinhTrangTour.MaTinhTrangTour
                           where LoaiTour.MaLoaiTour == "LT001"
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
            ).ToList();
            rpXemtour.DataSource = xemtour;
            rpXemtour.DataBind();
        }
        public void xemtour1()
        {
            dulichEntities db = new dulichEntities();
            var xemtour = (from Tour in db.Tour
                           join Diadiem in db.Diadiem on Tour.Madiadiem equals Diadiem.Madiadiem
                           join LoaiTour in db.LoaiTour on Tour.MaLoaiTour equals LoaiTour.MaLoaiTour
                           
                           select new
                           {
                               MaLoaiTour = LoaiTour.MaLoaiTour,
                               Matour = Tour.Matour,
                               Images = Tour.Images,
                               Thoiluong = Tour.Thoiluong,
                               Banggia = Tour.Banggia,
                               Tentour = Tour.Tentour,
                               Tendiadiem = Diadiem.Tendiadiem
                           }
            ).ToList();
            rpXemtour.DataSource = xemtour;
            rpXemtour.DataBind();
        }
    }
}