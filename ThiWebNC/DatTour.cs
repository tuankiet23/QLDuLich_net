//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ThiWebNC
{
    using System;
    using System.Collections.Generic;
    
    public partial class DatTour
    {
        public int MaDT { get; set; }
        public string Matour { get; set; }
        public string TenKH { get; set; }
        public string DienThoai { get; set; }
        public string Email { get; set; }
        public string DiaChi { get; set; }
        public Nullable<int> SoNguoiLon { get; set; }
        public Nullable<int> SoTreEm { get; set; }
        public string Mapt { get; set; }
        public string YeuCau { get; set; }
        public string MaTinhtrangDatTour { get; set; }
    
        public virtual Phuongthucthanhtoan Phuongthucthanhtoan { get; set; }
        public virtual TinhTrangDatTour TinhTrangDatTour { get; set; }
        public virtual Tour Tour { get; set; }
    }
}
