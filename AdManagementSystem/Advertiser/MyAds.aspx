<%@ Page Title="My Ads" Language="C#" MasterPageFile="~/Advertiser/AdvertiserMaster.Master" AutoEventWireup="true" CodeBehind="MyAds.aspx.cs" Inherits="AdManagementSystem.Advertiser.MyAds" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/jquery.slimscroll.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">My Ads</h3>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-4">
                    <blockquote>
                        <p>
                            <strong>All Ads</strong>
                            <asp:LinkButton CssClass="btn btn-default pull-right" data-toggle="modal" data-target="#NewAd" runat="server">
                               <span class="glyphicon glyphicon-plus-sign text-green"></span> New Ad
                            </asp:LinkButton>
                        </p>
                    </blockquote>
                </div>
                <div class="col-md-8"></div>
            </div>
            <div class="row">
                <div class="col-md-4 border-right">
                    <%--<asp:Panel runat="server" ID="pnlCategories" CssClass="list-group">
                    </asp:Panel>--%>
                    <asp:ListBox ID="lbCategories" runat="server" CssClass="form-control no-border" Rows="6" OnSelectedIndexChanged="lbCategories_SelectedIndexChanged"></asp:ListBox>

                    <%--Make them a category--%>
                </div>
                <div class="col-md-8">
                </div>
            </div>
        </div>
    </div>
    <script>
        /*var catId = getParameterByName("categoryId");
        if (catId == null) {
            $(".list-group a").first().addClass("active");
        }
        else {
            $("a[id$='" + catId + "']").addClass("active");
        }
        */
    </script>
</asp:Content>
<asp:Content ID="cntAtEnd" ContentPlaceHolderID="cphAtEnd" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <!-- COMPOSE MESSAGE MODAL -->
            <div class="modal fade" id="NewAd" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title"><i class="fa fa-envelope-o"></i>Create New Ad</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:Label Text="Language" runat="server" AssociatedControlID="ddlLanguage" CssClass="control-label" />
                                </div>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="ddlLanguage" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="English" />
                                        <asp:ListItem Text="French" />
                                        <asp:ListItem Text="German" />
                                        <asp:ListItem Text="Italian" />
                                        <asp:ListItem Text="Spanish" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row top10">
                                <div class="col-md-3">
                                    <asp:Label Text="Banner Size" runat="server" AssociatedControlID="ddlBannerSize" CssClass="control-label" />
                                </div>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="ddlBannerSize" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="468x60" Text="Full Banner (468x60)" />
                                        <asp:ListItem Value="728x90" Text="Leaderboard (728x90)" />
                                        <asp:ListItem Value="300x250" Text="Medium Rectangle (300x250)" />
                                        <asp:ListItem Value="300x50" Text="Mobile (300x50)" />
                                        <asp:ListItem Value="120x600" Text="Skyscraper (120x600)" />
                                        <asp:ListItem Value="160x600" Text="
                                    Wide Skyscraper (160x600)" />
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="row top10">
                                <div class="col-md-3">
                                    <asp:Label Text="Category" runat="server" AssociatedControlID="ddlCategory" CssClass="control-label" />
                                </div>

                                <div class="col-md-9">
                                    <asp:DropDownList ID="ddlCategory" CssClass="form-control" runat="server">
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="row top10">
                                <div class="col-md-3">
                                    <asp:Label Text="Ad Image" runat="server"  CssClass="control-label" />
                                </div>
                                <div class="col-md-9">
                                    <ajaxToolkit:AsyncFileUpload ID="AsyncFileUpload1" CssClass="form-control"  runat="server" />
                                    <%--<ajaxToolkit:AjaxFileUpload ID="AjaxFileUpload1" runat="server" MaximumNumberOfFiles="1" AllowedFileTypes="jpg,gif,bmp,jpeg,png" />--%>
                                    <%--<telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server" ChunkSize="0" OnClientFileDropped="" OnClientFileSelected="" OnClientFilesSelected="" CssClass="form-control">
                                    <FileFilters>
                                        <telerik:FileFilter Description="Image Files" Extensions=".jpg,.jpeg,.png,.gif,.bmp" />
                                    </FileFilters>
                                </telerik:RadAsyncUpload>--%>
                                    <%--<asp:FileUpload ID="fuAdImage" accept="image/*" CssClass="form-control" runat="server" />--%>

                                    <%--Fix design and upload ascyncronously--%>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer clearfix">

                            <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i>Discard</button>

                            <button type="submit" class="btn btn-primary pull-left"><i class="fa fa-envelope"></i>Create Ad</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
