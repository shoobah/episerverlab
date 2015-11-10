using System;
using EPiServer.Core;
using $rootnamespace$.Models.Pages;

namespace $rootnamespace$.Views.Pages
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
