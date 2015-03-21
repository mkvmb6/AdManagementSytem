<%@ Page Title="Buy Inventory" Language="C#" MasterPageFile="~/Advertiser/AdvertiserMaster.Master" AutoEventWireup="true" CodeBehind="BuyInventory.aspx.cs" Inherits="AdManagementSystem.Advertiser.BuyInventory" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function pageLoad(sender, args) {
            $("#ContentPlaceHolder1_gvBuyInventory tr").css({ "cursor": "pointer" });
            $("#ContentPlaceHolder1_gvBuyInventory tr").click(function () {
                $("#ContentPlaceHolder1_gvBuyInventory tr").removeClass("info");
                $(this).addClass("info");
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="well well-sm">
                <div class="form-inline">
                    <div class="form-group">
                        <label>Size:</label>
                        <asp:DropDownList ID="ddlBannerSize" CssClass="form-control" runat="server">
                            <asp:ListItem Value="Popunder" Text="Popunder" />
                            <asp:ListItem Value="468x60" Text="Full Banner (468x60)" />
                            <asp:ListItem Value="728x90" Text="Leaderboard (728x90)" />
                            <asp:ListItem Value="300x250" Text="Medium Rectangle (300x250)" />
                            <asp:ListItem Value="300x50" Text="Mobile (300x50)" />
                            <asp:ListItem Value="120x600" Text="Skyscraper (120x600)" />
                            <asp:ListItem Value="160x600" Text="
                                    Wide Skyscraper (160x600)" />
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label>Device:</label>
                        <asp:DropDownList ID="ddlDevice" CssClass="form-control" runat="server" DataSourceID="deviceDataSource" DataTextField="DeviceType" DataValueField="DeviceId" AutoPostBack="True"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="deviceDataSource" ConnectionString='<%$ ConnectionStrings:AdManagementConStr %>' SelectCommand="SELECT * FROM [Device]"></asp:SqlDataSource>
                    </div>
                    <div class="form-group">
                        <label>OS:</label>
                        <asp:DropDownList ID="ddlOS" CssClass="form-control" runat="server" DataSourceID="osDataSource" DataTextField="OsId" DataValueField="OsId"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="osDataSource" ConnectionString='<%$ ConnectionStrings:AdManagementConStr %>' SelectCommand="SELECT * FROM [DeviceOs] WHERE ([DeviceId] = @DeviceId)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlDevice" PropertyName="SelectedValue" Name="DeviceId" Type="String"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <div class="form-group">
                        <label>Zone:</label>
                        <asp:DropDownList ID="ddlZone" CssClass="form-control" runat="server" DataSourceID="zoneDataSource" DataTextField="CountryName" DataValueField="CountryId"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="zoneDataSource" ConnectionString='<%$ ConnectionStrings:AdManagementConStr %>' SelectCommand="SELECT * FROM [Country] ORDER BY [CountryName]"></asp:SqlDataSource>
                    </div>

                    <asp:Button ID="btnFilter" CssClass="btn btn-primary" runat="server" Text="Filter" />
                </div>
            </div>
            <asp:GridView ID="gvBuyInventory" CssClass="table table-hover table-bordered" GridLines="None" runat="server" AutoGenerateColumns="False" DataKeyNames="CountryId" DataSourceID="BuyInventoryDataSource" AllowSorting="True" OnRowDataBound="gvBuyInventory_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="CountryId" HeaderText="CountryId" ReadOnly="True" SortExpression="CountryId"></asp:BoundField>
                    <asp:BoundField DataField="CountryName" HeaderText="CountryName" SortExpression="CountryName"></asp:BoundField>
                    <asp:BoundField DataField="Impressions" HeaderText="Impressions" ReadOnly="True" SortExpression="Impressions"></asp:BoundField>
                    <asp:ButtonField Text="Buy Now" ButtonType="Button">
                        <ControlStyle CssClass="btn btn-success"></ControlStyle>
                    </asp:ButtonField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="BuyInventoryDataSource" ConnectionString='<%$ ConnectionStrings:AdManagementConStr %>' SelectCommand="spBuyInventory" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphAtEnd" runat="server">
</asp:Content>
