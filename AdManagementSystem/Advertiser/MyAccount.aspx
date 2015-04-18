<%@ Page Title="My Account" Language="C#" MasterPageFile="~/Advertiser/AdvertiserMaster.Master" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="AdManagementSystem.Advertiser.MyAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .tab-content {
            border-left: 1px solid #ddd;
            border-right: 1px solid #ddd;
            padding: 10px;
        }

        .nav-tabs {
            margin-bottom: 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div role="tabpanel" class="panel panel-default">
        <!-- Nav tabs -->
        <ul class="nav panel-heading nav-pills" role="tablist">
            <li role="presentation" class="active"><a href="#profile" aria-controls="home" role="tab" data-toggle="tab">Profile</a></li>
            <li role="presentation"><a href="#settings" aria-controls="profile" role="tab" data-toggle="tab">Settings</a></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content border-bottom">
            <div role="tabpanel" class="tab-pane fade in active" id="profile">
                <div class="panel panel-default">
                    <div class="panel-heading">Account Details</div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-sm-3">
                                <label class="control-label">Name</label>
                            </div>
                            <div class="col-sm-5">
                                <asp:TextBox ID="txtName" CssClass="form-control" runat="server" />
                            </div>
                        </div>
                        <div class="row top10">
                            <div class="col-sm-3">
                                <label class="control-label">Company Name</label>
                            </div>
                            <div class="col-sm-5">
                                <asp:TextBox ID="txtCompanyName" CssClass="form-control" runat="server" />
                            </div>
                        </div>
                        <div class="row top10">
                            <div class="col-sm-3">
                                <label class="control-label">Phone Number</label>
                            </div>
                            <div class="col-sm-5">
                                <asp:TextBox ID="txtPhoneNum" CssClass="form-control" runat="server" />
                            </div>
                        </div>
                        <div class="row top10">
                            <div class="col-sm-3">
                                <label class="control-label">Skype Name</label>
                            </div>
                            <div class="col-sm-5">
                                <asp:TextBox ID="txtSkypeName" CssClass="form-control" runat="server" />
                            </div>
                        </div>
                        <div class="row top10">
                            <div class="col-sm-3">
                                <label class="control-label">Address</label>
                            </div>
                            <div class="col-sm-5">
                                <asp:Label Text="" ID="lblAddress" runat="server" />
                            </div>
                        </div>
                        <div class="row top10">
                            <div class="col-sm-8">
                                <asp:Button Text="Update" runat="server" ID="btnUpdate" CssClass="btn btn-primary pull-right" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane fade" id="settings">
                <div class="panel panel-default">
                    <div class="panel-heading">Change Password</div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-sm-3">
                                <label class="control-label">Old Password</label>
                            </div>
                            <div class="col-sm-5">
                                <asp:TextBox ID="txtOldPassword" CssClass="form-control" runat="server" />
                            </div>
                        </div>
                        <div class="row top10">
                            <div class="col-sm-3">
                                <label class="control-label">New Password</label>
                            </div>
                            <div class="col-sm-5">
                                <asp:TextBox ID="txtNewPassword" CssClass="form-control" runat="server" />
                            </div>
                        </div>
                        <div class="row top10">
                            <div class="col-sm-3">
                                <label class="control-label">Confirm Password</label>
                            </div>
                            <div class="col-sm-5">
                                <asp:TextBox ID="txtConfirmPassword" CssClass="form-control" runat="server" />
                            </div>
                        </div>
                        <div class="row top10">
                            <div class="col-sm-8">
                                <asp:Button Text="Change Password" runat="server" ID="btnChangePassword" CssClass="btn btn-primary pull-right" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphAtEnd" runat="server">
</asp:Content>
