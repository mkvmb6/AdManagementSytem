<%@ Page Title="New Campaign" Language="C#" MasterPageFile="~/Advertiser/AdvertiserMaster.Master" AutoEventWireup="true" CodeBehind="NewCampaign.aspx.cs" Inherits="AdManagementSystem.Advertiser.NewCampaign" %>

<%@ Register Src="~/CountryTile.ascx" TagPrefix="uc1" TagName="CountryTile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/wizard.css" rel="stylesheet" />
    <link href="../css/datepicker/datepicker3.css" rel="stylesheet" />
    <link href="../css/Flags.css" rel="stylesheet" />
    <style>
        .glyphicon-ok {
            color: #09eb00;
            font-size: 1.5em;
        }

        .glyphicon-remove {
            color: #e10000;
            font-size: 1.5em;
        }

        .easyWizardSteps {
            list-style: none;
            width: 100%;
            overflow: hidden;
            margin: 0;
            padding: 0;
            border-bottom: 1px solid #ccc;
            margin-bottom: 20px;
        }

            .easyWizardSteps li {
                font-size: 18px;
                display: inline-block;
                padding: 10px;
                color: #B0B1B3;
                margin-right: 20px;
            }

                .easyWizardSteps li span {
                    font-size: 24px;
                }

                .easyWizardSteps li.current {
                    color: #000;
                }

        .easyWizardButtons {
            overflow: hidden;
            padding: 10px;
        }

            .easyWizardButtons button, .easyWizardButtons .submit {
                cursor: pointer;
            }

            .easyWizardButtons .prev {
                float: left;
            }

            .easyWizardButtons .next, .easyWizardButtons .submit {
                float: right;
            }
    </style>
    <script src="../Scripts/jquery.easyWizard.js"></script>
    <script>
        function pageLoad(sender, args) {
            $("#datemask2").inputmask("mm/dd/yyyy", { "placeholder": "mm/dd/yyyy" });
            $("[data-mask]").inputmask();
            $(".datepicker").datepicker({
                dateFormat: "dd-mm-yy"
            });
            var chkAll = $("#<%=chkAllDevices.ClientID%>");
            chkAll.change(function () {
                if (chkAll.prop("checked")) {
                    $("#<%=chkPc.ClientID%>").prop("checked", false);
                    $("#<%=chkTablets.ClientID%>").prop("checked", false);
                    $("#<%=chkMobile.ClientID%>").prop("checked", false);
                    $(".chkTile").parent().removeClass("btn-info");
                    $(".chkTile").parent().addClass("btn-default");
                    chkAll.parent().parent().toggleClass("btn-default btn-info");
                }
            });
            $("#<%=chkPc.ClientID%>,#<%=chkTablets.ClientID%>,#<%=chkMobile.ClientID%>").change(function () {
                chkAll.prop("checked", false);
                chkAll.parent().parent().removeClass("btn-info");
                chkAll.parent().parent().addClass("btn-default");
            });



            $('#myWizard').easyWizard({
                buttonsClass: 'btn',
                submitButtonClass: 'btn btn-info',
                //my start
                before: function (wizardObj, currentStepObj, nextStepObj) {
                    //before callback code here
                },
                after: function (wizardObj, prevStepObj, currentStepObj) {
                    //after callback code here
                    UpdateCampaignDetails();
                },
                beforeSubmit: function (wizardObj) {
                    alert('Hello, I\'am the beforeSubmit callback');
                }//my end
            });
            var divPop = $("#divPopunder");
            var divBan = $("#divBanner");
            divPop.click(function () {
                divPop.addClass("selected");
                divBan.removeClass("selected");
                $("#rowBanner").addClass("hide");
                $("#rowPopunder").removeClass("hide");
            });

            divBan.click(function () {
                divPop.removeClass("selected");
                divBan.addClass("selected");
                $("#rowPopunder").addClass("hide");
                $("#rowBanner").removeClass("hide");
                $("#rowPopunder").find("input").val("http://");
            });
        }


        function addCountry(source, eventargs) {
            var country = eventargs.get_value();
            $.ajax({
                type: "POST",
                url: "NewCampaign.aspx/AddCountryControl",
                data: "{ arg1:'" + country + "',arg2:'" + country + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: "true",
                cache: "false",
                success: function (response) {
                    var hidCountries = $("#<%=hidCountries.ClientID%>");
                    if (hidCountries.val().indexOf(country + ",") != -1) {
                        $("#txtCountries").val("");
                    }
                    else {
                        $("#txtCountries").val("").before(response.d);
                        hidCountries.val(hidCountries.val() + country + ",");
                    }
                },
                Error: function (x, e) {
                    alert("Error");
                }
            });
            }

            function removeCountry(delBtn) {
                var hidCountries = $("#<%=hidCountries.ClientID%>");
                var country = delBtn.parent().find("label").html();
                hidCountries.val(hidCountries.val().replace(country + ",", ""));
                delBtn.parent().remove();
            }
            function UpdateCampaignDetails() {
                $("#<%=lblCmpName.ClientID%>").html($("#<%=txtCmpName.ClientID%>").val());
                $("#<%=lblBudget.ClientID%>").html("$" + $("#<%=txtBudget.ClientID%>").val());
                $("#<%=lblStartDate.ClientID%>").html($("#<%=txtStartDate.ClientID%>").val());
                $("#<%=lblCountries.ClientID%>").html($("#<%=hidCountries.ClientID%>").val());
                $("#<%=lblBid.ClientID%>").html("$" + $("#<%=txtBid.ClientID%>").val());
                if ($("#<%=chkAllDevices.ClientID%>").prop("checked")) {
                    $("#<%=lblDevices.ClientID%>").html($("#<%=chkAllDevices.ClientID%>").parent().find("label").html());
                }
                else {
                    if ($("#<%=chkPc.ClientID%>").prop("checked")) {
                        $("#<%=lblDevices.ClientID%>").html($("#<%=chkPc.ClientID%>").parent().find("label").html() + ",");
                    }
                    if ($("#<%=chkTablets.ClientID%>").prop("checked")) {
                        $("#<%=lblDevices.ClientID%>").html($("#<%=lblDevices.ClientID%>").html() + $("#<%=chkTablets.ClientID%>").parent().find("label").html() + ",");
                    }
                    if ($("#<%=chkMobile.ClientID%>").prop("checked")) {
                        $("#<%=lblDevices.ClientID%>").html($("#<%=lblDevices.ClientID%>").html() + $("#<%=chkMobile.ClientID%>").parent().find("label").html());
                    }
                }
                var s = " ";
                //alert();
                if ($("#<%=lblCmpName.ClientID%>").text().length > 0) {
                    var bgt = $("#<%=lblBudget.ClientID%>").text().replace("$", "").replace(" ", "");
                    if (!isNaN(bgt) && bgt != "") {
                        var bid = $("#<%=lblBid.ClientID%>").text().replace("$", "").replace(" ", "");
                        if (!isNaN(bid) && bid != "") {
                            if ($("#<%=lblStartDate.ClientID%>").text().length > 0) {
                                $("#pnlCmpInfo").find(".glyphicon").removeClass("glyphicon-remove").addClass("glyphicon-ok");
                            }
                        }
                    }
                }
            }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="myWizard" class="form-horizontal">
        <section class="step" data-step-title="Info">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Campaign Info</h3>
                </div>
                <div class="panel-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-md-2">Campaign Name</label>
                            <div class="col-md-5">
                                <asp:TextBox runat="server" ID="txtCmpName" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2">Campaign Group</label>
                            <div class="col-md-5">
                                <asp:DropDownList ID="ddlGroup" CssClass="form-control" runat="server">
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-2">
                                <asp:LinkButton CssClass="btn btn-default" data-toggle="modal" data-target="#NewGroup" runat="server">
                               <span class="glyphicon glyphicon-plus-sign text-green"></span>Create New Group
                                </asp:LinkButton>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2">Campaign Budget</label>
                            <div class="col-md-5">
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-dollar"></i>
                                    </div>
                                    <asp:TextBox runat="server" ID="txtBudget" CssClass="form-control" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2">Campaign Start Date</label>
                            <div class="col-md-5">
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <asp:TextBox runat="server" ID="txtStartDate" CssClass="form-control datepicker" data-inputmask="'alias': 'mm/dd/yyyy'" data-mask />
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="step" data-step-title="Creatives">
            <div class="row">
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div id="divBanner" style="cursor: pointer;" class="small-box bg-aqua selected margin-left">
                        <div class="inner">
                            <h3>Banner
                            </h3>
                            <p>&nbsp;</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-bag"></i>
                        </div>
                        <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i>
                        </a>
                    </div>
                </div>
                <!-- ./col -->
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div id="divPopunder" style="cursor: pointer;" class="small-box bg-aqua">
                        <div class="inner">
                            <h3>Popunder
                            </h3>
                            <p>&nbsp;</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-ios7-briefcase-outline"></i>
                        </div>
                        <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i>
                        </a>
                    </div>
                </div>
                <!-- ./col -->
            </div>
            <div id="rowBanner" class="row">
                <div class="col-sm-4">
                    <label>Select Ad:</label>
                    <asp:DropDownList runat="server" ID="ddlAds" CssClass="form-control">
                    </asp:DropDownList>
                    <a href="MyAds.aspx">Create new</a>
                </div>
            </div>
            <div id="rowPopunder" class="row hide">                
                <div class="col-sm-4">
                    <label>Popunder URL:</label>
                    <asp:TextBox runat="server" ID="txtPopUrl" CssClass="form-control" required="required" Text="http://" />
                </div>
            </div>
        </section>
        <section class="step" data-step-title="Geo">
            <h4>Select Countries:</h4>
            <asp:Panel ID="pnlCountries" CssClass="well well-sm" runat="server" ClientIDMode="Static">
                <asp:TextBox ID="txtCountries" CssClass="form-control invisibleButPresent" runat="server" ClientIDMode="Static"></asp:TextBox>
                <asp:HiddenField ID="hidCountries" runat="server" />
            </asp:Panel>
            <ajaxToolkit:AutoCompleteExtender runat="server" TargetControlID="txtCountries" ID="txtCountriesAutoCompleteExtender" CompletionInterval="100" FirstRowSelected="True" MinimumPrefixLength="2" ServiceMethod="SearchCountries" OnClientItemSelected="addCountry"></ajaxToolkit:AutoCompleteExtender>
            <div class="alert alert-warning alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                If you don't select any country by default all the countries are selected.
            </div>


            <label class="control-label">Your bid</label>
            <div class="input-group">
                <div class="input-group-addon">
                    <i class="fa fa-dollar"></i>
                </div>
                <asp:TextBox runat="server" ID="txtBid" CssClass="form-control" Width="150px" />
            </div>
        </section>
        <section class="step" data-step-title="Device">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Select the Devices you want to target (optional).
                </div>
                <div class="panel-body">
                    <label class="btn btn-lg btn-default margin-right">
                        <asp:CheckBox ID="chkAllDevices" runat="server" CssClass="chkTile" Text="All Devices" />
                        All Devices
                    </label>
                    <label class="btn btn-lg btn-default margin-right">
                        <asp:CheckBox ID="chkPc" CssClass="chkTile" runat="server" Text="PC" />
                        <i class="fa fa-desktop"></i>
                        PC
                    </label>
                    <label class="btn btn-lg btn-default margin-right">
                        <asp:CheckBox ID="chkTablets" CssClass="chkTile" runat="server" Text="Tablets" />
                        <i class="fa fa-tablet"></i>
                        Tablets
                    </label>
                    <label class="btn btn-lg btn-default margin-right">
                        <asp:CheckBox ID="chkMobile" CssClass="chkTile" runat="server" Text="Mobiles" />
                        <i class="fa fa-mobile"></i>
                        Mobiles
                    </label>
                    <div class="alert alert-warning alert-dismissable top30">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        If you don't select any device by default we will target all.
                    </div>
                </div>
            </div>
        </section>
        <section class="step" data-step-title="Summary">
            <div id="pnlSummary" class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Campaign Summary</h3>
                </div>
                <div class="panel-body">
                    <div id="pnlCmpInfo" class="panel panel-default">
                        <div class="panel-heading">
                            <strong>Campaign Info</strong>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-sm-2">
                                    <span class="glyphicon glyphicon-remove"></span>
                                </div>
                                <div class="col-sm-10 border-left">
                                    <label class="control-label margin-right">Your Bid:</label>
                                    <asp:Label Text="" ID="lblBid" runat="server" />
                                    <br />
                                    <label class="control-label margin-right">Campaign Name:</label>
                                    <asp:Label Text="" ID="lblCmpName" runat="server" />
                                    <br />
                                    <label class="control-label margin-right">Budget:</label>
                                    <asp:Label Text="" ID="lblBudget" runat="server" />
                                    <br />
                                    <label class="control-label margin-right">Start Date:</label>
                                    <asp:Label Text="" ID="lblStartDate" runat="server" />
                                    <br />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <strong>Creatives</strong>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-sm-2">
                                    <span class="glyphicon glyphicon-remove"></span>
                                </div>
                                <div class="col-sm-10 border-left">
                                    <label class="control-label margin-right">Banner:</label>
                                    <asp:Label Text="120x120" ID="lblBanner" runat="server" />
                                    <br />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <strong>Geo Targeting</strong>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-sm-2">
                                    <span class="glyphicon glyphicon-ok"></span>
                                </div>
                                <div class="col-sm-10 border-left">
                                    <label class="control-label margin-right">Countries:</label>
                                    <asp:Label Text="" ID="lblCountries" runat="server" />
                                    <br />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <strong>Device Targeting</strong>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-sm-2">
                                    <span class="glyphicon glyphicon-ok"></span>
                                </div>
                                <div class="col-sm-10 border-left">
                                    <label class="control-label margin-right">Devices:</label>
                                    <asp:Label Text="" ID="lblDevices" runat="server" />
                                    <br />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <%--    <div id="campWizard">
        <asp:Wizard ID="Wizard1" runat="server" DisplaySideBar="false" ActiveStepIndex="4">
            <StartNextButtonStyle CssClass="btn btn-default margin-right" />
            <StepNextButtonStyle CssClass="btn btn-default margin-right" />
            <StepPreviousButtonStyle CssClass="btn btn-default margin-right" />
            <StepStyle CssClass="wizardStep" />
            <WizardSteps>
                <asp:WizardStep ID="WizardStep1" runat="server" Title="Info">
                </asp:WizardStep>
                <asp:WizardStep ID="WizardStep2" runat="server" Title="Creatives">
                </asp:WizardStep>
                <asp:WizardStep ID="WizardStep3" runat="server" Title="Geo">
                </asp:WizardStep>
                <asp:WizardStep ID="WizardStep4" runat="server" Title="Device">
                </asp:WizardStep>
                <asp:WizardStep ID="WizardStep5" runat="server" Title="Advanced">
                </asp:WizardStep>
                <asp:WizardStep ID="WizardStep6" runat="server" Title="Optimization">6</asp:WizardStep>
                <asp:WizardStep ID="WizardStep7" runat="server" Title="Summary">7</asp:WizardStep>
            </WizardSteps>
            <FinishCompleteButtonStyle CssClass="btn btn-primary margin-right" />
            <FinishPreviousButtonStyle CssClass="btn btn-default margin-right" />
            <HeaderTemplate>
                <ul id="wizHeader">
                    <asp:Repeater ID="SideBarList" runat="server">
                        <ItemTemplate>
                            <li>
                                <asp:LinkButton runat="server" CssClass='<%# GetClassForWizardStep(Container.DataItem) %>' ToolTip='<%#Eval("Name")%>' ID="linkWizard" OnClick="linkWizard_Click" CommandArgument='<%# GetWizardCount(Container.DataItem) %>'>
                            <h5 class="inline"><span class="label label-default"><%# GetWizardCount(Container.DataItem) %></span></h5>
                            &nbsp;<%# Eval("Name")%></asp:LinkButton>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </HeaderTemplate>
        </asp:Wizard>
    </div>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphAtEnd" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <!-- COMPOSE MESSAGE MODAL -->
            <div class="modal fade" id="NewGroup" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title"><i class="fa fa-envelope-o"></i>Create New Group</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:Label Text="Group Name" runat="server" CssClass="control-label" />
                                </div>
                                <div class="col-md-9">
                                    <asp:TextBox runat="server" ID="txtGroupName" CssClass="form-control" />
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer clearfix">
                            <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i>Discard</button>

                            <button type="submit" class="btn btn-primary pull-left">Create Group</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->
        </ContentTemplate>
    </asp:UpdatePanel>

    <script src="../js/plugins/input-mask/jquery.inputmask.js"></script>
    <script src="../js/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
    <script src="../js/plugins/input-mask/jquery.inputmask.extensions.js"></script>
    <script src="../js/plugins/datepicker/bootstrap-datepicker.js"></script>
    <script src="../Scripts/jquery.snippet.min.js"></script>
    <script src="../Scripts/jquery.easyWizard.js"></script>
    <script src="../Scripts/scripts.js"></script>
</asp:Content>
