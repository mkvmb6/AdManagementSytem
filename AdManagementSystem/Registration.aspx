<%@ Page Title="Registration" Language="C#" MasterPageFile="~/Common.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="AdManagementSystem.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-box {
            margin: 10px auto 0 auto;
            width: 500px;
        }
    </style>
    <script>
        $(document).ready(function () {
            $(".myContent").addClass("bg-black");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="form-box" id="login-box">
        <div class="header">Register New Membership</div>
        <div class="body bg-gray">
            <div class="form-group">
                <asp:TextBox runat="server" ID="txtName" CssClass="form-control"
                    placeholder="Full Name" required="required" />
            </div>
            <div class="form-group">
                <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control"
                    placeholder="Email" TextMode="Email" required="required" />
            </div>
            <div class="form-group">
                <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control"
                    placeholder="Password" TextMode="Password" required="required" />
            </div>
            <div class="form-group">
                <asp:TextBox runat="server" ID="txtConfirmPassword" CssClass="form-control"
                    placeholder="Confirm Password" TextMode="Password" required="required" /><asp:CompareValidator ID="cvPasswords" runat="server" ErrorMessage="Passwords do not match." ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" CssClass="alert-danger" Display="Dynamic"></asp:CompareValidator>
            </div>
            <div class="form-group">
                <asp:TextBox runat="server" ID="txtCompanyName" CssClass="form-control"
                    placeholder="Company Name" />
            </div>
            <div class="form-group">
                <asp:TextBox runat="server" ID="txtPhoneNum" CssClass="form-control"
                    placeholder="9876543210" pattern="\d{10}" MaxLength="10" />
            </div>
            <div class="form-group">
                <asp:TextBox runat="server" ID="txtSkype" CssClass="form-control"
                    placeholder="Skype Name" />
            </div>
            <div class="form-group">
                <asp:TextBox runat="server" ID="txtAddressLine1" CssClass="form-control"
                    placeholder="Address Line 1" />
            </div>
            <div class="form-group">
                <asp:TextBox runat="server" ID="txtAddressLine2" CssClass="form-control"
                    placeholder="Address Line 2" />
            </div>
            <div class="form-group">
                <asp:DropDownList ID="ddlCountry" CssClass="form-control" runat="server" DataSourceID="SqlDataSourceCountry" DataTextField="CountryName" DataValueField="CountryId" OnDataBound="ddlCountry_DataBound" OnTextChanged="ddlCountry_TextChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceCountry" runat="server" ConnectionString="<%$ ConnectionStrings:AdManagementConStr %>" SelectCommand="SELECT * FROM [Country] ORDER BY [CountryName]"></asp:SqlDataSource>
            </div>
            <div class="form-group">
                <asp:TextBox runat="server" ID="txtState" CssClass="form-control"
                    placeholder="State" />
            </div>
            <div class="form-inline">
                <div class="form-group">
                    <span>Account Type: </span>
                    <asp:RadioButton ID="rbAdvertiser" CssClass="form-control" runat="server" Text="&nbsp;Advertiser" Checked="true" GroupName="accType" />
                    <asp:RadioButton ID="rbPublisher" CssClass="form-control" runat="server" Text="&nbsp;Publisher" GroupName="accType" />
                </div>
            </div>
        </div>
        <div class="footer">
            <asp:Button ID="btnSignUp" CssClass="btn bg-olive btn-block" runat="server" Text="Sign me up" OnClick="btnSignUp_Click" />
            <a href="Login.aspx" class="text-center">I already have a membership</a>
        </div>

        <div class="margin text-center">
            <span>Register using social networks</span>
            <br />
            <button class="btn bg-light-blue btn-circle"><i class="fa fa-facebook"></i></button>
            <button class="btn bg-aqua btn-circle"><i class="fa fa-twitter"></i></button>
            <button class="btn bg-red btn-circle"><i class="fa fa-google-plus"></i></button>

        </div>
    </div>

</asp:Content>
