using AdManagementDataAccess;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdManagementSystem.Advertiser
{
    public partial class NewCampaign : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           // Wizard1.PreRender += new EventHandler(Wizard1_PreRender);            
        }
       /* protected void Wizard1_PreRender(object sender, EventArgs e)
        {
            Repeater SideBarList = Wizard1.FindControl("HeaderContainer").FindControl("SideBarList") as Repeater;
            SideBarList.DataSource = Wizard1.WizardSteps;
            SideBarList.DataBind();

        }

        protected string GetWizardCount(object wizardStep)
        {
            WizardStep step = wizardStep as WizardStep;
            if (step == null)
            {
                return "";
            }
            return (Wizard1.WizardSteps.IndexOf(step) + 1).ToString();
        }
        protected string GetClassForWizardStep(object wizardStep)
        {
            WizardStep step = wizardStep as WizardStep;

            if (step == null)
            {
                return "";
            }
            int stepIndex = Wizard1.WizardSteps.IndexOf(step);

            if (stepIndex < Wizard1.ActiveStepIndex)
            {
                return "prevStep";
            }
            else if (stepIndex > Wizard1.ActiveStepIndex)
            {
                return "nextStep";
            }
            else
            {
                return "currentStep";
            }
        }

        protected void linkWizard_Click(object sender, EventArgs e)
        {
            LinkButton linkWizard = sender as LinkButton;
            Wizard1.ActiveStepIndex = int.Parse(linkWizard.CommandArgument) - 1;
        }*/
        [ScriptMethod()]
        [WebMethod]
        public static List<string> SearchCountries(string prefixText, int count)
        {
            List<string> countries = CountryDao.GetAllCountries();
            List<string> matchList = new List<string>();
            var matches = from country in countries
                          where country.ToLower().StartsWith(prefixText.ToLower()) 
                          select country;
            foreach (string item in matches)
            {
                matchList.Add(item);
            }
            return matchList;
        }

        [WebMethod]
        public static string AddCountryControl(string arg1, string arg2)
        {
            try
            {
                StringBuilder countryTile = new StringBuilder();
                countryTile.Append("<div class=\"pull-left margin-right\" style=\"border: 1px solid gray; background-color: ActiveCaption;\">");
                countryTile.Append("<img class=\"flag flag-"+CountryDao.GetCountryCode(arg1).ToLower()+"\" />");
                countryTile.Append("<label class=\"control-label\">" + arg1 + "</label>");
                countryTile.Append("<i style=\"margin:3px; cursor:pointer;\" class=\"fa fa-remove pull-right\" onclick=\"removeCountry($(this));\" /></i> ");
                countryTile.Append("</div>");
                return countryTile.ToString();
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        protected void chkAllDevices_CheckedChanged(object sender, EventArgs e)
        {
            chkPc.Checked = false;
            chkTablets.Checked = false;
            chkMobile.Checked = false;
        }        

    }
}