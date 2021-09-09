using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThiWebNC.Admin.App
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getSumTour();
                tourTrongThang();
                doanhThu();
                tinhTrangTour();
                tienThudc();
            }
            
        }

        public void getSumTour()
        {
            dulichEntities db = new dulichEntities();
            var tongTien = (from tour in db.Tour
                            select tour.Banggia).Sum();
            lb_tongtien.InnerText = "Tổng tiền tour đang có: " + Convert.ToString(tongTien);
            
        }
        public void tourTrongThang()
        {
            DateTime now = DateTime.Now;
            int thang = now.Month;
            dulichEntities db = new dulichEntities();
            var sum = (from tour in db.Tour
                            where tour.Ngaycapnhat.Value.Month == now.Month
                            select tour).ToList();
            lb_sotourtrongthang.InnerText = "Số lượng tour đã thêm trong tháng " + now.Month + "là : " + sum.Count;
        }
        public void doanhThu()
        {
            DateTime now = DateTime.Now;
            dulichEntities db = new dulichEntities();
            int thang = now.Month;
            var doanhthu = (from tour in db.Tour
                            where tour.Ngaycapnhat.Value.Month == now.Month
                            select tour.Banggia).Sum();
            
            lb_doanhthu1.InnerText = "Tổng tiền tour trong tháng " + now.Month + " là : " + doanhthu;
           
            var doanhthu2 = (from tour in db.Tour
                            where tour.Ngaycapnhat.Value.Month == (now.Month - 1)
                            select tour.Banggia).Sum();

            lb_doanhthu2.InnerText = "Tổng tiền tour trong tháng " + (now.Month - 1) + " là : " + doanhthu2;
            
            var doanhthu3 = (from tour in db.Tour
                            where tour.Ngaycapnhat.Value.Month == (now.Month - 2)
                            select tour.Banggia).Sum();

            lb_doanhthu3.InnerText = "Tổng tiền tour trong tháng " + (now.Month - 2) + " là : " + doanhthu3;

        }
        public void tinhTrangTour()
        {
            dulichEntities db = new dulichEntities();
       
            var chualienhe = (from dattour in db.DatTour
                            where dattour.MaTinhtrangDatTour == "MTTDT001"
                            select dattour).ToList();
            lb_tinhtrang1.InnerText = "Số khách hàng chưa được liên hệ: " + chualienhe.Count;

            var dalienhe_datt = (from dattour in db.DatTour
                              where dattour.MaTinhtrangDatTour == "MTTDT003"
                              select dattour).ToList();
            lb_tinhtrang3.InnerText = "Số khách hàng đã được liên hệ và đã thanh toán: " + dalienhe_datt.Count;

            var dalienhe_chuatt = (from dattour in db.DatTour
                              where dattour.MaTinhtrangDatTour == "MTTDT002"
                              select dattour).ToList();
            lb_tinhtrang2.InnerText = "Số khách hàng chưa được liên hệ và chưa thanh toán: " + dalienhe_chuatt.Count;
        }
        public void tienThudc()
        {
            dulichEntities db = new dulichEntities();
            var tongtien = (from tour in db.Tour
                            join dattour in db.DatTour on tour.Matour equals dattour.Matour
                            where dattour.MaTinhtrangDatTour == "MTTDT003"
                            select tour.Banggia).Sum();
            lb_tienthudc.InnerText = "Số tiền thu về được sau khi khách hàng đã thanh toán: " + tongtien;
        }
    }
}