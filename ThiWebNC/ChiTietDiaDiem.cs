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
    
    public partial class ChiTietDiaDiem
    {
        public string MaChiTietDD { get; set; }
        public string Madiadiem { get; set; }
        public string Matour { get; set; }
        public string TenChiTietDD { get; set; }
    
        public virtual Diadiem Diadiem { get; set; }
        public virtual Tour Tour { get; set; }
    }
}