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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class dulichEntities : DbContext
    {
        public dulichEntities()
            : base("name=dulichEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<ChiTietDiaDiem> ChiTietDiaDiem { get; set; }
        public virtual DbSet<DatTour> DatTour { get; set; }
        public virtual DbSet<Diadiem> Diadiem { get; set; }
        public virtual DbSet<DichVu> DichVu { get; set; }
        public virtual DbSet<KhachSan> KhachSan { get; set; }
        public virtual DbSet<LienHe> LienHe { get; set; }
        public virtual DbSet<LoaiKhachSan> LoaiKhachSan { get; set; }
        public virtual DbSet<LoaiTour> LoaiTour { get; set; }
        public virtual DbSet<NhanVien> NhanVien { get; set; }
        public virtual DbSet<Phuongthucthanhtoan> Phuongthucthanhtoan { get; set; }
        public virtual DbSet<Slide> Slide { get; set; }
        public virtual DbSet<TinhTrangDatTour> TinhTrangDatTour { get; set; }
        public virtual DbSet<TinhTrangLoaiTour> TinhTrangLoaiTour { get; set; }
        public virtual DbSet<TinhTrangTour> TinhTrangTour { get; set; }
        public virtual DbSet<Tintuc> Tintuc { get; set; }
        public virtual DbSet<Tour> Tour { get; set; }
        public virtual DbSet<Users> Users { get; set; }
    }
}
