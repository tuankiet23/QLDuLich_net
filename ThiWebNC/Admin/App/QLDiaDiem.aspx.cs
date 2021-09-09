using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThiWebNC.Admin.App
{
    public partial class QLDiaDiem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getData();
                panelform.Visible = false;
            }
           
        }

        public void getData()
        {
            dulichEntities db = new dulichEntities();
            var diadiem = (from dd in db.Diadiem
                           orderby dd.Madiadiem ascending
                           select dd).ToList();
            dgvQLDiaDiem.DataSource = diadiem;
            dgvQLDiaDiem.DataBind();
            btnDelete.Visible = false;
        }

        public string getLinkAnh(string Madiadiem)
        {
            try
            {
                dulichEntities db = new dulichEntities();
                return db.Diadiem.FirstOrDefault(x => x.Madiadiem == Madiadiem).Images;
            }
            catch
            {
                return "";
            }
        }

        public void clearText()
        {
            txt_tendiadiem.Text = "";
            //txt_mota.Text = "";
            txt_mota.InnerText = "";
            txt_madiadiem.Text = "";
            txt_Images.Text = "";

            txt_madiadiem.ReadOnly = false;
            
        }

        protected void linkEdit_Command(object sender, CommandEventArgs e)
        {
            panelform.Visible = true;
            btnDelete.Visible = true;
            btnAdd.Text = "Lưu";
            dulichEntities db = new dulichEntities();
            string Madiadiem = e.CommandArgument.ToString();
            Diadiem obj = db.Diadiem.FirstOrDefault(x => x.Madiadiem == Madiadiem);

            if (obj != null)
            {
                txt_Images.Text = obj.Images;
                txt_madiadiem.Text = obj.Madiadiem;
                //txt_mota.Text = obj.MoTaChiTiet;
                txt_mota.InnerText = obj.MoTaChiTiet;
                txt_tendiadiem.Text = obj.Tendiadiem;

                txt_madiadiem.ReadOnly = true;
            }
        }

        protected void linkDelete_Command(object sender, CommandEventArgs e)
        {
            dulichEntities db = new dulichEntities();
            string Madiadiem = e.CommandArgument.ToString();
            Diadiem obj = db.Diadiem.FirstOrDefault(x => x.Madiadiem == Madiadiem);

            if (obj != null)
            {
                db.Diadiem.Remove(obj);
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
                Diadiem obj = new Diadiem();

                obj.Images = txt_Images.Text;
                obj.Madiadiem = txt_madiadiem.Text;
                //obj.MoTaChiTiet = txt_mota.Text;
                obj.MoTaChiTiet = txt_mota.InnerText;
                obj.Tendiadiem = txt_tendiadiem.Text;

                db.Diadiem.Add(obj);
                db.SaveChanges();
                clearText();
                panelform.Visible = false;
                getData();
            }
            else if (btnAdd.Text == "Lưu")
            {
                string Madiadiem = txt_madiadiem.Text;

                Diadiem obj = db.Diadiem.FirstOrDefault(x => x.Madiadiem == Madiadiem);
                if (obj != null)
                {
                    obj.Images = txt_Images.Text;
                    //obj.Madiadiem = txt_madiadiem.Text;
                    //obj.MoTaChiTiet = txt_mota.Text;
                    obj.MoTaChiTiet = txt_mota.InnerText;
                    obj.Tendiadiem = txt_tendiadiem.Text;

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
            string Madiadiem = txt_madiadiem.Text;

            Diadiem obj = db.Diadiem.FirstOrDefault(x => x.Madiadiem == Madiadiem);

            if (obj != null)
            {
                db.Diadiem.Remove(obj);
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

        protected void dgvQLDiaDiem_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvQLDiaDiem.PageIndex = e.NewPageIndex;
            getData();
        }
    }
}