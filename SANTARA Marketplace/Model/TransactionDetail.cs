//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SANTARA_Marketplace.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class TransactionDetail
    {
        public string TransactionID { get; set; }
        public string StorageID { get; set; }
        public string StoreID { get; set; }
        public int Quantity { get; set; }
        public string ShipmentMethod { get; set; }
        public string ShipmentPrice { get; set; }
        public string Status { get; set; }
    
        public virtual Storage Storage { get; set; }
        public virtual Store Store { get; set; }
        public virtual Transaction Transaction { get; set; }
    }
}
