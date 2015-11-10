using EPiServerSite1.Models.Pages;
using EPiServer;

namespace EPiServerSite1.Views.Pages
{
    /// <summary>
    /// Base class for all page templates on the site
    /// </summary>
    public abstract class SiteTemplatePage : SiteTemplatePage<SitePageData>
    { 
    }

    /// <summary>
    /// Base class for all page templates for a specific page type
    /// </summary>
    public abstract class SiteTemplatePage<T> : TemplatePage<T> where T : SitePageData
    {
    }
}
