using EPiServer.Framework.DataAnnotations;
using EPiServer.Framework.Web;
using $rootnamespace$.Models.Pages;

namespace $rootnamespace$.Views.Pages.Partials
{
    [TemplateDescriptor(Inherited = true, TemplateTypeCategory = TemplateTypeCategories.UserControl, 
        Tags = new[] { Global.ContentAreaTags.TwoThirdsWidth, Global.ContentAreaTags.FullWidth })]
    public partial class ContactPagePartialTemplateWide : PartialPageTemplate<ContactPage>
    {
        protected override void OnLoad(System.EventArgs e)
        {
            base.OnLoad(e);

            DataBind(); // We use data-binding expressions to make the relevant layout visible
        }
    }
}
