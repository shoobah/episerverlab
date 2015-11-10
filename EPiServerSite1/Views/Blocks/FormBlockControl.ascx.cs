using EPiServerSite1.Models.Blocks;
using EPiServer.Framework.DataAnnotations;
using EPiServer.Framework.Web;

namespace EPiServerSite1.Views.Blocks
{
    [TemplateDescriptor(Inherited = true, TemplateTypeCategory = TemplateTypeCategories.UserControl)]
    public partial class FormBlockControl : SiteBlockControlBase<FormBlock> { }
}
