using System;
using System.Linq;
using EPiServer;
using EPiServer.Web;

namespace EPiServerSite1.Views.Shared
{
    public partial class Breadcrumb : SiteUserControlBase
    {
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            // Include all pages but the root page
            BreadcrumbList.DataSource = DataFactory.Instance.GetAncestors(CurrentPage.ContentLink)
                                                            .Where(p => !p.ContentLink.CompareToIgnoreWorkID(SiteDefinition.Current.RootPage))
                                                            .Reverse();

            BreadcrumbList.DataBind();
        }
    }
}
