<%@ Page Title="New Campaign" Language="C#" MasterPageFile="~/Advertiser/AdvertiserMaster.Master" AutoEventWireup="true" CodeBehind="NewCampaign.aspx.cs" Inherits="AdManagementSystem.Advertiser.NewCampaign" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/wizard.css" rel="stylesheet" />
    <link href="../css/datepicker/datepicker3.css" rel="stylesheet" />
    <script>
        function pageLoad(sender, args) {
            $("#datemask2").inputmask("mm/dd/yyyy", { "placeholder": "mm/dd/yyyy" });
            $("[data-mask]").inputmask();
            $(".datepicker").datepicker({
                dateFormat: "dd-mm-yy"
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Wizard ID="Wizard1" runat="server" DisplaySideBar="false">
                <StartNextButtonStyle CssClass="btn btn-default" />
                <StepNextButtonStyle CssClass="btn btn-default" />
                <StepPreviousButtonStyle CssClass="btn btn-default" />
                <StepStyle CssClass="wizardStep" />
                <WizardSteps>
                    <asp:WizardStep ID="WizardStep1" runat="server" Title="Info">
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
                    </asp:WizardStep>
                    <asp:WizardStep ID="WizardStep2" runat="server" Title="Creatives">2</asp:WizardStep>
                    <asp:WizardStep ID="WizardStep3" runat="server" Title="Geo">3</asp:WizardStep>
                    <asp:WizardStep ID="WizardStep4" runat="server" Title="Device">4</asp:WizardStep>
                    <asp:WizardStep ID="WizardStep5" runat="server" Title="Advanced">5</asp:WizardStep>
                    <asp:WizardStep ID="WizardStep6" runat="server" Title="Optimization">6</asp:WizardStep>
                    <asp:WizardStep ID="WizardStep7" runat="server" Title="Summary">7</asp:WizardStep>
                </WizardSteps>
                <FinishCompleteButtonStyle CssClass="btn btn-primary" />
                <FinishPreviousButtonStyle CssClass="btn btn-default" />
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
        </ContentTemplate>
    </asp:UpdatePanel>
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

                            <button type="submit" class="btn btn-primary pull-left"><i class="fa fa-envelope"></i>Create Group</button>
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

</asp:Content>
