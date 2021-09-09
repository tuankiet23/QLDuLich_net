using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThiWebNC.Admin.App
{
    public partial class QLKhachSan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getData();
                getCBLoaiKhachSan();
            }
            panelform.Visible = false;
        }

        public void getData()
        {
            dulichEntities db = new dulichEntities();
            var khachsan = (from ks in db.KhachSan
                      orderby ks.MaKhachSan ascending
                      select ks).ToList();
            dgvQLKhachSan.DataSource = khachsan;
            dgvQLKhachSan.DataBind();
            btnDelete.Visible = false;
        }

        public string getLoaiKhachSan(string maloaikhachsan)
        {
            try
            {
                dulichEntities db = new dulichEntities();
                return db.LoaiKhachSan.First(x => x.MaLoaiKhachSan == maloaikhachsan).TenLoaiKhachSan;
            }
            catch
            {
                return " ";
            }
        }

        public string getLinkAnh(string MaKhachSan)
        {
            try
            {
                dulichEntities db = new dulichEntities();
                return db.KhachSan.FirstOrDefault(x => x.MaKhachSan == MaKhachSan).Images;
            }
            catch
            {
                return "";
            }
        }

        public void getCBLoaiKhachSan()
        {
            dulichEntities db = new dulichEntities();
            List<LoaiKhachSan> ks = db.LoaiKhachSan.OrderBy(x => x.MaLoaiKhachSan).ToList();

            cbloaiks.DataSource = ks;
            cbloaiks.DataValueField = "MaLoaiKhachSan";
            cbloaiks.DataTextField = "TenLoaiKhachSan";
            cbloaiks.DataBind();
        }

        public void clearText()
        {
            txt_diachi.Text = "";
            txt_dongia.Text = "";
            txt_images.Text = "";
            txt_makhachsan.Text = "";
            //txt_mota.Text = "";
            txt_mota.InnerText = "";
            txt_tenks.Text = "";
            txt_tinhtrang.Text = "";
            txt_ythongtin.Text = "";

            txt_makhachsan.ReadOnly = false;
        }

        protected void linkEdit_Command(object sender, CommandEventArgs e)
        {
            panelform.Visible = true;
            btnDelete.Visible = true;
            btnAdd.Text = "Lưu";
            dulichEntities db = new dulichEntities();
            string MaKhachSan = e.CommandArgument.ToString();
            KhachSan obj = db.KhachSan.FirstOrDefault(x => x.MaKhachSan == MaKhachSan);

            if (obj != null)
            {
                txt_diachi.Text =obj.Diachi;
                txt_dongia.Text = Convert.ToString(obj.DonGia);
                txt_images.Text = obj.Images;
                txt_makhachsan.Text = obj.MaKhachSan;
                //txt_mota.Text = obj.Mota;
                txt_mota.InnerText = obj.Mota;
                txt_tenks.Text = obj.TenKhachSan;
                txt_tinhtrang.Text = obj.TinhTrang;
                txt_ythongtin.Text = obj.Thongtinchitiet;
                cbloaiks.SelectedValue = obj.MaLoaiKhachSan;
            }
            txt_makhachsan.ReadOnly = true;

        }

        protected void linkDelete_Command(object sender, CommandEventArgs e)
        {
            dulichEntities db = new dulichEntities();
            string MaKhachSan = e.CommandArgument.ToString();
            KhachSan obj = db.KhachSan.FirstOrDefault(x => x.MaKhachSan == MaKhachSan);
            if (obj != null)
            {
                db.KhachSan.Remove(obj);
            }
            db.SaveChanges();
            getData();
        }

        protected void btn_Save(object sender, CommandEventArgs e)
        {
            btnAdd.Text = "Thêm";
            panelform.Visible = true;
            btnDelete.Visible = false;
            clearText();
        }

        protected void btn_Add(object sender, CommandEventArgs e)
        {
            dulichEntities db = new dulichEntities();
            if (btnAdd.Text == "Thêm")
            {
                KhachSan obj = new KhachSan();

                obj.Diachi=txt_diachi.Text ;
                obj.DonGia=Convert.ToInt32(txt_dongia.Text);
                obj.Images=txt_images.Text ;
                obj.MaKhachSan=txt_makhachsan.Text ;
                //obj.Mota=txt_mota.Text ;
                obj.Mota = txt_mota.InnerText;
                obj.TenKhachSan=txt_tenks.Text ;
                obj.TinhTrang=txt_tinhtrang.Text ;
                obj.Thongtinchitiet=txt_ythongtin.Text;
                obj.MaLoaiKhachSan = cbloaiks.SelectedValue;

                db.KhachSan.Add(obj);
                db.SaveChanges();
                panelform.Visible = false;
                getData();
            }
            else if (btnAdd.Text == "Lưu")
            {
                string MaKhachSan = txt_makhachsan.Text;
                KhachSan obj = db.KhachSan.FirstOrDefault(x => x.MaKhachSan == MaKhachSan);

                if (obj != null)
                {
                    obj.Diachi = txt_diachi.Text;
                    obj.DonGia = Convert.ToInt32(txt_dongia.Text);
                    obj.Images = txt_images.Text;
                    //obj.MaKhachSan = txt_makhachsan.Text;
                    //obj.Mota = txt_mota.Text;
                    obj.Mota = txt_mota.InnerText;
                    obj.TenKhachSan = txt_tenks.Text;
                    obj.TinhTrang = txt_tinhtrang.Text;
                    obj.Thongtinchitiet = txt_ythongtin.Text;
                    obj.MaLoaiKhachSan = cbloaiks.SelectedValue;

                    db.SaveChanges();
                    panelform.Visible = false;
                    getData();
                }
            }
        }

        protected void btn_Delete(object sender, CommandEventArgs e)
        {
            dulichEntities db = new dulichEntities();
            string MaKhachSan = txt_makhachsan.Text;
            KhachSan obj = db.KhachSan.FirstOrDefault(x => x.MaKhachSan == MaKhachSan);

            if (obj != null)
            {
                db.KhachSan.Remove(obj);
            }
            db.SaveChanges();
            getData();
            clearText();
        }

        protected void btn_Out(object sender, CommandEventArgs e)
        {
            panelform.Visible = false;
        }

        protected void dgvQLKhachSan_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvQLKhachSan.PageIndex = e.NewPageIndex;
            getData();
        }
    }
}