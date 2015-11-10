using $rootnamespace$.Models.Blocks;
using EPiServer.Framework.DataAnnotations;
using EPiServer.Framework.Web;

namespace $rootnamespace$.Views.Blocks
{
    [TemplateDescriptor(Inherited = true, TemplateTypeCategory = TemplateTypeCategories.UserControl)]
    public partial class FormBlockControl : SiteBlockControlBase<FormBlock> { }
}
