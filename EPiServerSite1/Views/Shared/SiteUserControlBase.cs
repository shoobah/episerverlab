using EPiServerSite1.Models.Pages;

namespace EPiServerSite1.Views.Shared
{
    /// <summary>
    /// Base class for all user controls on the site
    /// </summary>
    public abstract class SiteUserControlBase : EPiServer.UserControlBase<SitePageData>
    {
        /* BEST PRACTICE TIP
         * Always use your own base class for user controls in your projects,
         * instead of having your user controls inherit UserControlBase directly.
         * This makes all user controls aware of the site's page type base class
         * and enables easy extension of all user controls on the site. */
    }
}
