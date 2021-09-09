using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThiWebNC.Admin.App
{
    public partial class QLDiaDiemTour : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getData();
                getCBDiaiem();
                getCBTour();
            }
            panelform.Visible = false;
        }

        public void getData()
        {
            dulichEntities db = new dulichEntities();
            var chitiet = (from dd in db.ChiTietDiaDiem
                           orderby dd.Matour ascending
                           select dd).ToList();
            dgvQLChiTietDiaDiem.DataSource = chitiet;
            dgvQLChiTietDiaDiem.DataBind();
            btnDelete.Visible = false;
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

        public void getCBDiaiem()
        {
            dulichEntities db = new dulichEntities();
            List<Diadiem> dd = db.Diadiem.OrderBy(x => x.Madiadiem).ToList();

            cbDiaDiem.DataSource = dd;
            cbDiaDiem.DataValueField = "Madiadiem";
            cbDiaDiem.DataTextField = "Tendiadiem";
            cbDiaDiem.DataBind();
        }

        public void getCBTour()
        {
            dulichEntities db = new dulichEntities();
            List<Tour> dd = db.Tour.OrderBy(x => x.Matour).ToList();

            cbTenTour.DataSource = dd;
            cbTenTour.DataValueField = "Matour";
            cbTenTour.DataTextField = "Tentour";
            cbTenTour.DataBind();
        }

        public void clearText()
        {
            txt_madiadiem.Text = "";
            txt_tendiadiem.Text = "";

            txt_madiadiem.ReadOnly = false;
        }

        protected void linkEdit_Command(object sender, CommandEventArgs e)
        {
            panelform.Visible = true;
            btnDelete.Visible = true;
            btnAdd.Text = "Lưu";
            dulichEntities db = new dulichEntities();
            string MaChiTietDD = e.CommandArgument.ToString();
            ChiTietDiaDiem obj = db.ChiTietDiaDiem.FirstOrDefault(x => x.MaChiTietDD == MaChiTietDD);

            if (obj != null)
            {
                txt_madiadiem.Text = obj.MaChiTietDD;
                txt_tendiadiem.Text = obj.TenChiTietDD;
                cbDiaDiem.SelectedValue = obj.Madiadiem;
                cbTenTour.SelectedValue = obj.Matour;

                txt_madiadiem.ReadOnly = true;
            }
        }

        protected void linkDelete_Command(object sender, CommandEventArgs e)
        {
            dulichEntities db = new dulichEntities();
            string MaChiTietDD = e.CommandArgument.ToString();
            ChiTietDiaDiem obj = db.ChiTietDiaDiem.FirstOrDefault(x => x.MaChiTietDD == MaChiTietDD);

            if (obj != null)
            {
                db.ChiTietDiaDiem.Remove(obj);
            }
            db.SaveChanges();
            getData();
        }

        protected void btn_Save(object sender, CommandEventArgs e)
        {
            panelform.Visible = true;
            btnAdd.Text = "Thêm";
            btnDelete.Visible = false;
            clearText();
        }

        protected void btn_Add(object sender, CommandEventArgs e)
        {
            dulichEntities db = new dulichEntities();

            if (btnAdd.Text == "Thêm")
            {
                ChiTietDiaDiem obj = new ChiTietDiaDiem();

                obj.MaChiTietDD = txt_madiadiem.Text;
                obj.Madiadiem = cbDiaDiem.SelectedValue;
                obj.Matour = cbTenTour.SelectedValue;
                obj.TenChiTietDD = txt_tendiadiem.Text;

                db.ChiTietDiaDiem.Add(obj);
                db.SaveChanges();
                clearText();
                panelform.Visible = false;
                getData();
            }
            else if (btnAdd.Text == "Lưu")
            {
                string MaChiTietDD = txt_madiadiem.Text;

                ChiTietDiaDiem obj = db.ChiTietDiaDiem.FirstOrDefault(x => x.MaChiTietDD == MaChiTietDD);
                if (obj != null)
                {
                    //obj.MaChiTietDD = txt_madiadiem.Text;
                    obj.Madiadiem = cbDiaDiem.SelectedValue;
                    obj.Matour = cbTenTour.SelectedValue;
                    obj.TenChiTietDD = txt_tendiadiem.Text;

                    db.SaveChanges();
                    panelform.Visible = false;
                    clearText();
                    getData();
                }
            }
        }

        protected void btn_Delete(object sender, CommandEventArgs e)
        {
            dulichEntities db = new dulichEntities();
            string MaChiTietDD = txt_madiadiem.Text;

            ChiTietDiaDiem obj = db.ChiTietDiaDiem.FirstOrDefault(x => x.MaChiTietDD == MaChiTietDD);

            if (obj != null)
            {
                db.ChiTietDiaDiem.Remove(obj);
            }
            db.SaveChanges();
            clearText();
            panelform.Visible = false;
            getData();
        }

        protected void btn_Out(object sender, CommandEventArgs e)
        {
            panelform.Visible = false;
        }



        protected void dgvQLChiTietDiaDiem_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvQLChiTietDiaDiem.PageIndex = e.NewPageIndex;
            getData();
        }
    }
}