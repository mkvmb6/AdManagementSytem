using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdManagementEntity;
using AdManagementDataAccess;

namespace AdManagementSystem.Advertiser
{
    public partial class MyAds : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Category> categories = CategoryDao.GetCategories();
                foreach (var item in categories)
                {
                    /*HyperLink hl = new HyperLink();
                    string id = "cat" + item.CategoryId.ToString();
                    hl.Text = item.CategoryName;
                    hl.NavigateUrl = Request.Path + "?categoryId=" + id + "#" + id;
                    hl.CssClass = "list-group-item";
                    hl.ID = id;
                    hl.ClientIDMode = System.Web.UI.ClientIDMode.Static;
                    pnlCategories.Controls.Add(hl);*/
                    
                    ListItem li = new ListItem(item.CategoryName, item.CategoryId.ToString());
                    li.Attributes.Add("class", "list-group-item");
                    lbCategories.Items.Add(li);

                    ddlCategory.Items.Add(new ListItem() { Text = item.CategoryName, Value = item.CategoryId.ToString() });
                }
                ddlCategory.Items[0].Selected=true;
            }
        }

        protected void lbCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Populate ads on right side with thumbnails ajax
        }
    }
}