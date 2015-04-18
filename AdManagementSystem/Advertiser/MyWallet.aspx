<%@ Page Title="My Wallet" Language="C#" MasterPageFile="~/Advertiser/AdvertiserMaster.Master" AutoEventWireup="true" CodeBehind="MyWallet.aspx.cs" Inherits="AdManagementSystem.Advertiser.MyWallet" %>

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
    <div class="row">
        <div class="col-sm-2">
            <div class="panel panel-default">
                <div class="panel-heading">My Wallet</div>
                <div class="panel-body text-center text-bold">
                    <span class="text-success border-bottom">Wallet Balance</span>
                    <h3 class="text-bold">$<asp:Label Text="100" ID="lblBalance" runat="server" /></h3>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="panel panel-default">
                <div class="panel-heading">Campaign Fund Summary</div>
                <div class="panel-body">
                    <div class="row text-center text-bold">
                        <div class="col-xs-4">
                            <span class="text-warning border-bottom">Campaign Reserve</span>
                            <h3 class="text-bold">$<asp:Label Text="100" ID="Label1" runat="server" /></h3>
                        </div>
                        <div class="col-xs-4 border-left border-right">
                            <div class="minusWallet">
                                <span style="margin-top: -2px; margin-left: -2px; position: fixed">-</span>
                            </div>
                            <span class="text-danger border-bottom">Campaign Spent</span>
                            <h3 class="text-bold">$<asp:Label Text="50" ID="Label2" runat="server" /></h3>
                        </div>
                        <div class="col-xs-4">
                            <div class="equalsWallet">
                                =
                            </div>
                            <span class="text-success border-bottom">Campaign Available</span>
                            <h3 class="text-bold">$<asp:Label Text="50" ID="Label3" runat="server" /></h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div role="tabpanel" class="panel panel-default">
        <!-- Nav tabs -->
        <ul class="nav panel-heading nav-pills" role="tablist">
            <li role="presentation" class="active"><a href="#add" aria-controls="home" role="tab" data-toggle="tab">Add Funds</a></li>
            <li role="presentation"><a href="#transfer" aria-controls="profile" role="tab" data-toggle="tab">Transfer Funds</a></li>
            <li role="presentation"><a href="#payments" aria-controls="messages" role="tab" data-toggle="tab">Payments</a></li>
            <li role="presentation"><a href="#history" aria-controls="settings" role="tab" data-toggle="tab">Monthly History</a></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content border-bottom">
            <div role="tabpanel" class="tab-pane fade in active" id="add">
                <div class="row">
                    <div class="col-md-6 border-right">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-4 control-label">Amount (in dollars)</label>
                                <div class="input-group col-sm-6">
                                    <div class="input-group-addon">$</div>
                                    <asp:TextBox runat="server" ID="txtAmount" CssClass="form-control" placeholder="Amount" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">Fee (3.5 %)</label>
                                <div class="input-group col-sm-6">
                                    <div class="input-group-addon">$</div>
                                    <asp:TextBox runat="server" ID="txtFee" CssClass="form-control" placeholder="Fee" Enabled="false" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">Total</label>
                                <div class="input-group col-sm-6">
                                    <div class="input-group-addon">$</div>
                                    <asp:TextBox runat="server" ID="txtTotal" CssClass="form-control" placeholder="Total" Enabled="false" />
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Payment method</label>
                            <div class="input-group col-sm-6">
                                <div class="input-group-addon"><i class="fa fa-credit-card"></i></div>
                                <asp:DropDownList ID="ddlPaymentMethod" CssClass="form-control" runat="server">
                                    <asp:ListItem>Credit Card</asp:ListItem>
                                    <asp:ListItem>Paypal</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-6">
                                <asp:Button Text="Proceed for payment" ID="btnPayment" CssClass="btn btn-primary pull-right" runat="server" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane fade" id="transfer">
                <div class="row">
                    <div class="col-md-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">Wallet To Campaign</div>
                            <div class="panel-body">
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label">Campaign</label>
                                        <div class="input-group col-sm-6">
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="ddlWltToCmp">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label">Amount</label>
                                        <div class="input-group col-sm-6">
                                            <div class="input-group-addon">$</div>
                                            <asp:TextBox runat="server" ID="txtWltToCmpAmt" CssClass="form-control" placeholder="Amount" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Button Text="Transfer" ID="btnWltToCmpTransfer" CssClass="btn btn-primary pull-right margin-left" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">Campaign To Wallet</div>
                            <div class="panel-body">
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label">Campaign</label>
                                        <div class="input-group col-sm-6">
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="ddlCmpToWlt">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label">Amount</label>
                                        <div class="input-group col-sm-6">
                                            <div class="input-group-addon">$</div>
                                            <asp:TextBox runat="server" ID="txtCmpToWltAmt" CssClass="form-control" placeholder="Amount" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Button Text="Transfer" ID="btnCmpToWltTransfer" CssClass="btn btn-primary pull-right margin-left" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane fade" id="payments">
                , iaculis eu lacus nunc mi elit, vehicula ut laoreet ac, aliquam sit amet justo nunc tempor, metus vel.
Placerat suscipit, orci nisl iaculis eros, a tincidunt nisi odio eget lorem nulla condimentum tempor mattis ut vitae feugiat augue cras ut metus a risus iaculis scelerisque eu ac ante.
            </div>
            <div role="tabpanel" class="tab-pane fade" id="history">
                nc elit dolor, luctus placerat scelerisque euismod, iaculis eu lacus nunc mi elit, vehicula ut laoreet ac, aliquam sit amet justo nunc tempor, metus vel.
Placerat suscipit, orci nisl iaculis eros, a tincidunt nisi odio eget lorem nulla condimentum tempor mattis ut vitae feugiat augue cras ut metus a risus iaculis scelerisque eu ac ante.
            </div>
        </div>

    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphAtEnd" runat="server">
    <script>
        $(document).ready(function () {
            $("#ContentPlaceHolder1_txtAmount,#ContentPlaceHolder1_txtWltToCmpAmt,#ContentPlaceHolder1_txtCmpToWltAmt").on("keydown", function () {
                return ValidateNumeric(event);
            });
        });
    </script>
</asp:Content>
