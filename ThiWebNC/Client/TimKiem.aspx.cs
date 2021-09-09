using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThiWebNC.Client
{
    public partial class TimKiem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string key = Request.QueryString["key"];
            if (!IsPostBack)
            {
                xemtour(key);
            }
        }
        public void xemtour(string key)
        {
            dulichEntities db = new dulichEntities();
            var timkiem = (from Tour in db.Tour
                           join Diadiem in db.Diadiem on Tour.Madiadiem equals Diadiem.Madiadiem
                           join ChiTietDiaDiem in db.ChiTietDiaDiem on Tour.Matour equals ChiTietDiaDiem.Matour
                           join TinhTrangTour in db.TinhTrangTour on Tour.MaTinhTrangTour equals TinhTrangTour.MaTinhTrangTour
                           where Tour.Tentour.Contains(key) || Diadiem.Tendiadiem.Contains(key) || ChiTietDiaDiem.TenChiTietDD.Contains(key)
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
            ).Distinct().ToList();

            rpTimkiem.DataSource = timkiem;
            rpTimkiem.DataBind();
        }
    }
}