using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SANTARA_Marketplace.Template
{
    public partial class HeaderAndFooter : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public static string GetImageBase64String(object imageData)
        {
            if (imageData == null)
            {
                return string.Empty;
            }

            if (imageData is byte[] data)
            {
                //string mimeType = IsPngImage(data) ? "image/png" : "image/jpeg";
                string mimeType = "image/png";
                string base64String = Convert.ToBase64String(data);
                return $"data:{mimeType};base64,{base64String}";
            }

            return string.Empty;

        }

        public static String GetPrice(object ProductPrice)
        {
            int price = (int)ProductPrice;

            NumberFormatInfo nfi = new CultureInfo("id-ID").NumberFormat;
            nfi.CurrencyDecimalDigits = 0;

            return price.ToString("C", nfi);
        }
    }
}