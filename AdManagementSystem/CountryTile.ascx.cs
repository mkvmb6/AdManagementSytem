using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdManagementSystem
{
    public partial class CountryTile : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string CountryName
        {
            get { return lblCountryName.Text; }
            set { lblCountryName.Text = value; }
        }

        public string FlagCssClass
        {
            get { return imgMap.CssClass; }
            set { imgMap.CssClass = value; }
        }
    }
}