using System;
using EPiServerSite1.Models.Blocks;
using EPiServer.Web;

namespace EPiServerSite1.Views.Blocks
{
    /// <summary>
    /// Primarily used to display contact details in a contact block
    /// </summary>
    public partial class ContactBlockControl : SiteBlockControlBase<ContactBlock>
    {
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            // Only display the button if a link URL and link text have been specified
            ContactBlockLink.Visible = !string.IsNullOrWhiteSpace(CurrentBlock.LinkText) &&
                                       CurrentBlock.LinkUrl != null &&
                                       !CurrentBlock.LinkUrl.IsEmpty();

            // In edit mode an editor can click the link button below the contact details to edit its text
            Link.ApplyEditAttributes<ContactBlock>(c => c.LinkText);

            Link.DataBind();
        }
    }
}
