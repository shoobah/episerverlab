using System;
using EPiServer.Core;
using EPiServerSite1.Models.Pages;

namespace EPiServerSite1.Views.Pages
{
    public partial class NewsPageTemplate : SiteTemplatePage<NewsPage>
    {
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            NoListRootMessage.DataBind();
        }
    }
}
