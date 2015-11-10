<%@ Master Language="C#" MasterPageFile="Root.Master" AutoEventWireup="false" CodeBehind="Site.master.cs" Inherits="$rootnamespace$.Views.MasterPages.Site" %>
<%@ Import Namespace="EPiServer.Web" %>
<%@ Register tagPrefix="UC" tagName="MainNavigation" src="~/Views/Shared/MainNavigation.ascx" %>
<%@ Register tagPrefix="UC" tagName="Breadcrumb" src="~/Views/Shared/Breadcrumb.ascx" %>
<%@ Register tagPrefix="UC" tagName="Footer" src="~/Views/Shared/Footer.ascx" %>

<asp:Content ContentPlaceHolderID="Content" runat="server">

    <asp:PlaceHolder ID="HeaderPlaceHolder" runat="server">
        <div class="row">
            <div id="header" clientidmode="Static" runat="server">
                <div class="span2">
                    <EPiServer:Property PageLink="<%# SiteDefinition.Current.StartPage.ToPageReference() %>" PropertyName="SiteLogotype" DisplayMissingMessage="True" runat="server">
                        <RenderSettings Tag="Header" />
                    </EPiServer:Property>
                </div>
                <div class="span10">
                    <UC:MainNavigation runat="server" />
                </div>
            </div>
        </div>

        <hr />
    </asp:PlaceHolder>

    <UC:Breadcrumb ID="Breadcrumb" runat="server" />

    <asp:ContentPlaceHolder ID="Content" runat="server" />

    <UC:Footer ID="footer" ClientIDMode="Static" runat="server" />

</asp:Content>
