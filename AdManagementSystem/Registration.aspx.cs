using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdManagementDataAccess;
using AdManagementEntity;

namespace AdManagementSystem
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddlCountry_TextChanged(object sender, EventArgs e)
        {

        }

        protected void ddlCountry_DataBound(object sender, EventArgs e)
        {
            ddlCountry.Items.Insert(0, new ListItem()
            {
                Text = "Select Country",
                Value = "Select Country",
                Selected = true
            });
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            try
            {
                UserInfo objUserInfo = new UserInfo();
                objUserInfo.FullName = txtName.Text;
                objUserInfo.EmailId = txtEmail.Text;
                objUserInfo.Company = txtCompanyName.Text;
                objUserInfo.PhoneNum = txtPhoneNum.Text;
                objUserInfo.Skype = txtSkype.Text;
                AddressInfo objAddressInfo = new AddressInfo()
                {
                    AddressLine1 = txtAddressLine1.Text,
                    AddressLine2 = txtAddressLine2.Text,
                    CountryId = (ddlCountry.SelectedIndex > 0) ? ddlCountry.SelectedItem.Value : null,
                    State = txtState.Text,
                    MainAddress = true,
                    EmailId = txtEmail.Text,

                };
                LoginInfo objLoginInfo = new LoginInfo()
                {
                    EmailId = txtEmail.Text,
                    Password = txtPassword.Text,
                    UserType = (rbAdvertiser.Checked) ? rbAdvertiser.Text : rbPublisher.Text
                };
                if (UserInfoDao.GetUserInfo(txtEmail.Text) != null)
                {
                    Response.Write(AdManagementUtility.GetAlertMessage("User already exist"));
                }
                else
                {
                    if (UserInfoDao.SaveUserInfo(objUserInfo, objAddressInfo, objLoginInfo))
                    {
                        Response.Write(AdManagementUtility.GetRedirectMessage(Request.Path, "User registered successfully"));
                    }
                    else
                    {
                        Response.Write(AdManagementUtility.GetAlertMessage("Error while registering the user"));
                    }
                }

            }
            catch (Exception)
            {
                Response.Write(AdManagementUtility.GetAlertMessage("Error while registering the user. Invalid data."));
            }
        }
    }
}