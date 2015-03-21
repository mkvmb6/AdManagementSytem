using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdManagementSystem.Advertiser
{
    public partial class AdvertiserMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblPageHeader.Text = Page.Title;
        }
    }
}