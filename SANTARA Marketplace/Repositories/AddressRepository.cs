using SANTARA_Marketplace.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SANTARA_Marketplace.Repositories
{
    public class AddressRepository
    {
        private static SantaraDatabaseEntities1 db = DatabaseSingleton.GetInstance();

        public Address GetAddress(String AddressID)
        {
            return (from a in db.Addresses where a.AddressID.Equals(AddressID) select a).FirstOrDefault();
        }
    }
}