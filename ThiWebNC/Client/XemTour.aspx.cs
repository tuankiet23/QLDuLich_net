using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThiWebNC.Client
{
    public partial class XemTour : System.Web.UI.Page
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
                           join TinhTrangTour in db.TinhTrangTour on Tour.MaTinhTrangTour equals TinhTrangTour.MaTinhTrangTour
                           select new
                           {
                               Images = Tour.Images,
                               Banggia = Tour.Banggia,
                               Thoiluong = Tour.Thoiluong,
                               Tentour = Tour.Tentour,
                               Matour = Tour.Matour,
                               MaLoaiTour = Tour.MaLoaiTour,
                               Tendiadiem = Diadiem.Tendiadiem,
                               MaTinhTrangTour = TinhTrangTour.MaTinhTrangTour
                           }
            ).ToList();

            rpXemtour.DataSource = xemtour;
            rpXemtour.DataBind();
        }
    }
}