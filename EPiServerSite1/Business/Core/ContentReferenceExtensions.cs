using System;
using EPiServer;
using EPiServer.Core;
using EPiServer.Web;

namespace EPiServerSite1.Business
{
    /// <summary>
    /// Provides extension methods for content references
    /// </summary>
    public static class ContentReferenceExtensions
    {
        /// <summary>
        /// Gets the top page reference, i e page beneath the start page, starting at the specified page reference
        /// </summary>
        public static ContentReference GetTopPage(this ContentReference contentLink)
        {
            if (ContentReference.IsNullOrEmpty(contentLink))
            {
                throw new NotSupportedException("Current top page cannot be retrieved without a starting point, and the specified page link was empty");
            }

            var page = contentLink.GetPage();

            while (!ContentReference.IsNullOrEmpty(page.ParentLink) && !page.ParentLink.CompareToIgnoreWorkID(SiteDefinition.Current.RootPage) && !page.ParentLink.CompareToIgnoreWorkID(SiteDefinition.Current.StartPage))
            {
                page = page.ParentLink.GetPage();
            }

            return page.ContentLink;
        }

        /// <summary>
        /// Shorthand for DataFactory.Instance.GetPage
        /// </summary>
        public static PageData GetPage(this ContentReference contentLink)
        {
            return DataFactory.Instance.Get<PageData>(contentLink);
        }

        /// <summary>
        /// Shorthand for DataFactory.Instance.GetPage
        /// </summary>
        public static T GetPage<T>(this ContentReference contentLink) where T : PageData
        {
            if (contentLink.CompareToIgnoreWorkID(SiteDefinition.Current.RootPage))
            {
                throw new NotSupportedException("The root page cannot be converted to type " + typeof(T).Name);
            }

            return DataFactory.Instance.Get<T>(contentLink);
        }

        /// <summary>
        /// Shorthand for DataFactory.Instance.GetPage
        /// </summary>
        public static PageData GetPage(this ContentReference contentLink, LanguageSelector languageSelector)
        {
            return DataFactory.Instance.Get<PageData>(contentLink, languageSelector);
        }

    }
}
