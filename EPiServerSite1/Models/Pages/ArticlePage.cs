using System.ComponentModel.DataAnnotations;
using EPiServer.Core;
using EPiServer.DataAbstraction;
using EPiServer.DataAnnotations;
using ImageVault.EPiServer;

namespace EPiServerSite1.Models.Pages
{
    /// <summary>
    ///     Used primarily for publishing news articles on the website
    /// </summary>
    [SiteContentType(
        GroupName = Global.GroupNames.News,
        GUID = "AEECADF2-3E89-4117-ADEB-F8D43565D2F4")]
    [SiteImageUrl(Global.StaticGraphicsFolderPath + "page-type-thumbnail-article.png")]
    public class ArticlePage : StandardPage
    {
        [Display(
            Name = "Media",
            GroupName = SystemTabNames.Content,
            Order = 310)]
        [CultureSpecific]
        public virtual MediaReference Media{ get; set; }
    }
}