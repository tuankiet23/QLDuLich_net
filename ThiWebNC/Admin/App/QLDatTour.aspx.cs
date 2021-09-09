using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThiWebNC.Admin.App
{
    public partial class QLDatTour : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getData();
                getCBTenTour();
                getCBPhuongThuc();
                getCBTinhTrang();
            }
            panelform.Visible = false;
        }

        public void getData()
        {
            dulichEntities db = new dulichEntities();
            var qldt = (from qld in db.DatTour
                        orderby qld.MaDT ascending
                        select qld).ToList();
            dgvQLDatTour.DataSource = qldt;
            dgvQLDatTour.DataBind();
        }

        public string getTour(string matour)
        {
            try
            {
                dulichEntities db = new dulichEntities();
                return db.Tour.First(x => x.Matour == matour).Tentour;
            }
            catch
            {
                return "";
            }
        }

        public string getTinhTrang(string matinhtrangdattour)
        {
            try
            {
                dulichEntities db = new dulichEntities();
                return db.TinhTrangDatTour.First(x => x.MaTinhTrangDatTour == matinhtrangdattour).TenTinhTrangDatTour;
            }
            catch
            {
                return "";
            }
        }

        public string getPhuongThucTT(string mapt)
        {
            try
            {
                dulichEntities db = new dulichEntities();
                return db.Phuongthucthanhtoan.First(x => x.Mapt == mapt).Tenpt;
            }
            catch
            {
                return "";
            }
        }


        public void getCBTenTour()
        {
            dulichEntities db = new dulichEntities();

            List<Tour> tentour = db.Tour.OrderBy(x => x.Matour).ToList();

            cbTenTour.DataSource = tentour;
            cbTenTour.DataValueField = "Matour";
            cbTenTour.DataTextField = "Tentour";
            cbTenTour.DataBind();
        }



        public void getCBPhuongThuc()
        {
            dulichEntities db = new dulichEntities();

            List<Phuongthucthanhtoan> pt = db.Phuongthucthanhtoan.OrderBy(x => x.Mapt).ToList();

            cbphuongthuctt.DataSource = pt;
            cbphuongthuctt.DataValueField = "Mapt";
            cbphuongthuctt.DataTextField = "Tenpt";
            cbphuongthuctt.DataBind();
        }

        public void getCBTinhTrang()
        {
            dulichEntities db = new dulichEntities();

            List<TinhTrangDatTour> tt = db.TinhTrangDatTour.OrderBy(x => x.MaTinhTrangDatTour).ToList();

            cbtinhtrang.DataSource = tt;
            cbtinhtrang.DataValueField = "MaTinhTrangDatTour";
            cbtinhtrang.DataTextField = "TenTinhTrangDatTour";
            cbtinhtrang.DataBind();
        }


        protected void linkDelete_Command(object sender, CommandEventArgs e)
        {
            dulichEntities db = new dulichEntities();
            int MaDT = Convert.ToInt32(e.CommandArgument.ToString());
            DatTour obj = db.DatTour.FirstOrDefault(x => x.MaDT == MaDT);

            if (obj != null)
            {
                db.DatTour.Remove(obj);
            }
            db.SaveChanges();
            getData();
        }

       
        public void clearText()
       {
            txt_Madattour.Text = "";
            txt_tenkh.Text = "";
            txt_dienthoai.Text = "";
            txt_email.Text = "";
            txt_diachi.Text = "";
            txt_songuoilon.Text = "";
            txt_sotreem.Text = "";
            txt_yeucau.Text = "";
            txt_Madattour.ReadOnly = false;
        }

        protected void linkEdit_Command(object sender, CommandEventArgs e)
        {
            panelform.Visible = true;
            btnAdd.Text = "Lưu";
            btnDelete.Visible = true;
            dulichEntities db = new dulichEntities();
            int MaDT = Convert.ToInt32(e.CommandArgument.ToString());
            DatTour obj = db.DatTour.FirstOrDefault(x => x.MaDT == MaDT);

            if (obj != null)
            {
                txt_Madattour.Text = Convert.ToString(obj.MaDT);
                cbTenTour.SelectedValue = obj.Matour;
                txt_tenkh.Text = obj.TenKH;
                txt_dienthoai.Text = obj.DienThoai;
                txt_email.Text = obj.Email;
                txt_diachi.Text = obj.DiaChi;
                txt_songuoilon.Text = Convert.ToString(obj.SoNguoiLon);
                txt_sotreem.Text = Convert.ToString(obj.SoTreEm);
                
                cbphuongthuctt.SelectedValue = obj.Mapt;
                txt_yeucau.Text = obj.YeuCau;
                cbtinhtrang.SelectedValue = obj.MaTinhtrangDatTour;

                txt_Madattour.ReadOnly = false;
            }

        }

        protected void btn_Save(object sender, CommandEventArgs e)
        {
            panelform.Visible = true;
            btnAdd.Text = "Thêm";
            clearText();
            btnDelete.Visible = false;
        }

        protected void btn_Add(object sender, CommandEventArgs e)
        {
            dulichEntities db = new dulichEntities();

            if (btnAdd.Text == "Thêm")
            {
                DatTour obj = new DatTour();
                obj.MaDT = Convert.ToInt32(txt_Madattour.Text);
                obj.Matour = cbTenTour.SelectedValue;
                obj.TenKH = txt_tenkh.Text;
                obj.DienThoai = txt_dienthoai.Text;
                obj.Email = txt_email.Text;
                obj.DiaChi = txt_diachi.Text;
                obj.SoNguoiLon = Convert.ToInt32(txt_songuoilon.Text);
                obj.SoTreEm = Convert.ToInt32(txt_sotreem.Text);
                
                obj.Mapt = cbphuongthuctt.SelectedValue;
                obj.YeuCau = txt_yeucau.Text;
                obj.MaTinhtrangDatTour = cbtinhtrang.SelectedValue;

                db.DatTour.Add(obj);
                db.SaveChanges();
                panelform.Visible = false;
                getData();
            }
            else if (btnAdd.Text == "Lưu")
            {
                int MaDT = Convert.ToInt32(txt_Madattour.Text);
                DatTour obj = db.DatTour.FirstOrDefault(x => x.MaDT == MaDT);
                if (obj != null)
                {
                    //obj.MaDT = txt_Madattour.Text;
                    obj.Matour = cbTenTour.SelectedValue;
                    obj.TenKH = txt_tenkh.Text;
                    obj.DienThoai = txt_dienthoai.Text;
                    obj.Email = txt_email.Text;
                    obj.DiaChi = txt_diachi.Text;
                    obj.SoNguoiLon = Convert.ToInt32(txt_songuoilon.Text);
                    obj.SoTreEm = Convert.ToInt32(txt_sotreem.Text);
                    obj.Mapt = cbphuongthuctt.SelectedValue;
                    obj.YeuCau = txt_yeucau.Text;
                    //obj.Tinhtrang = txt_tinhtrang.Text;
                    obj.MaTinhtrangDatTour = cbtinhtrang.SelectedValue;
                    db.SaveChanges();
                    panelform.Visible = false;
                    getData();
                }
            }
        }

        protected void btn_Delete(object sender, CommandEventArgs e)
        {
            dulichEntities db = new dulichEntities();
            int MaDT = Convert.ToInt32(txt_Madattour.Text);
            DatTour obj = db.DatTour.FirstOrDefault(x => x.MaDT == MaDT);

            if (obj != null)
            {
                db.DatTour.Remove(obj);
            }
            db.SaveChanges();
            getData();
            clearText();
        }

        protected void btn_Out(object sender, CommandEventArgs e)
        {
            panelform.Visible = false;
        }



        protected void dgvQLDatTour_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvQLDatTour.PageIndex = e.NewPageIndex;
            getData();
        }

    }
}