using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdManagementSystem.Advertiser
{
    public partial class NewCampaign : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Wizard1.PreRender += new EventHandler(Wizard1_PreRender);
        }
        protected void Wizard1_PreRender(object sender, EventArgs e)
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
        }

    }
}