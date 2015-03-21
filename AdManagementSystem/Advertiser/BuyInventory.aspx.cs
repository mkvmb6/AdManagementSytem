using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdManagementSystem.Advertiser
{
    public partial class BuyInventory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            gvBuyInventory.UseAccessibleHeader = true;
            gvBuyInventory.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void gvBuyInventory_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //e.Row.Attributes["onmouseover"] = "this.style.cursor='pointer';this.style.textDecoration='underline';$(this).addClass('active');";
                //e.Row.Attributes["onmouseout"] = "this.style.textDecoration='none';$(this).removeClass('active');";
                e.Row.ToolTip = "Click to select row";
                e.Row.Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.gvBuyInventory, "Select$" + e.Row.RowIndex);
            }
        }

        protected void gvBuyInventory_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gvBuyInventory.Rows)
            {
                row.Attributes.Remove("class");
            }
            gvBuyInventory.SelectedRow.Attributes["class"] = "info";
        }

        protected void gvBuyInventory_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                foreach (TableCell cell in e.Row.Cells)
                {
                    if (cell.Controls.Count > 0)
                    {
                        LinkButton sortLink = (LinkButton)cell.Controls[0];
                        if (sortLink.Text == gvBuyInventory.SortExpression)
                        {
                            if (gvBuyInventory.SortDirection == SortDirection.Ascending)
                                sortLink.Text += " <img src='../img/asc.gif' class='pull-right' title='Sort ascending' />";
                            else
                                sortLink.Text +=
                                    "<img src='../img/asc.gif' class='fa-flip-vertical pull-right' title='Sort descending' />";
                        }

                    }
                }
            }
        }
    }
}