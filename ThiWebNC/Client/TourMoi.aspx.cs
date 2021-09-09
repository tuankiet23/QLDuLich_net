using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThiWebNC.Client
{
    public partial class TourMoi : System.Web.UI.Page
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
            ).ToList();
            rpXemtour.DataSource = xemtour;
            rpXemtour.DataBind();
        }
    }
}