<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CountryTile.ascx.cs" Inherits="AdManagementSystem.CountryTile" %>
<div class="pull-left" style="border: 1px solid gray; background-color: ActiveCaption; width: 200px;">
    <asp:Image ID="imgMap" runat="server" CssClass="flag flag-us" />
    <asp:Label Text="United States of America" ID="lblCountryName" CssClass="control-label" runat="server" />
    <asp:Button Text="x" runat="server" ID="btnRemove" CssClass="invisibleButPresent pull-right" OnClientClick="$(this).parent().remove();" />
</div>
