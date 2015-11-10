using EPiServer;
using EPiServer.Framework;
using EPiServer.Framework.Initialization;
using EPiServer.Framework.Localization;
using EPiServer.Globalization;
using EPiServer.Web;
using EPiServer.XForms.WebControls;
using System;
using System.Text;
using Label = System.Web.UI.WebControls.Label;

namespace $rootnamespace$.Business.Initialization
{
    [InitializableModule]
    [ModuleDependency(typeof(EPiServer.Web.InitializationModule))]
    public class XFormInitialization : IInitializableModule
    {
        public void Initialize(InitializationEngine context)
        {
            if (context.HostType == HostType.WebApplication)
            {
                XFormControl.ControlSetup += new EventHandler(XForm_ControlSetup);
            }
        }

        public void Preload(string[] parameters) { }

        public void Uninitialize(InitializationEngine context) { }

        #region Global XForm Events

        /// <summary>
        /// Sets up events for each new instance of the XFormControl control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        /// <remarks>As the ControlSetup event is triggered for each instance of the XFormControl control
        /// you need to take into consideration that any event handlers will affect all XForms for the entire
        /// application. If the EPiServer UI is running in the same application this might also be affected depending
        /// on which events you attach to and what is done in the event handlers.</remarks>
        public void XForm_ControlSetup(object sender, EventArgs e)
        {
            XFormControl control = (XFormControl)sender;
            control.AfterSubmitPostedData += new SaveFormDataEventHandler(XForm_AfterSubmitPostedData);
        }

        /// <summary>
        /// Handles the AfterSubmitPostedData event of the XFormControl.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EPiServer.XForms.WebControls.SaveFormDataEventArgs"/> instance containing the event data.</param>
        public void XForm_AfterSubmitPostedData(object sender, SaveFormDataEventArgs e)
        {
            XFormControl control = (XFormControl)sender;

            if (control.FormDefinition.PageGuidAfterPost != Guid.Empty)
            {
                PermanentContentLinkMap pageMap = PermanentLinkMapStore.Find(control.FormDefinition.PageGuidAfterPost) as PermanentContentLinkMap;
                if (pageMap != null)
                {
                    string internalUrl = pageMap.MappedUrl.ToString();
                    internalUrl = UriSupport.AddLanguageSelection(internalUrl, ContentLanguage.PreferredCulture.Name);
                    UrlBuilder urlBuilder = new UrlBuilder(internalUrl);
                    //Rewrite the url to make sure that it gets the friendly url if such a provider has been configured.
                    EPiServer.Global.UrlRewriteProvider.ConvertToExternal(urlBuilder, null, Encoding.UTF8);

                    //Always cast UrlBuilders to get a correctly encoded url since ToString() is for "human" readability.
                    control.Page.Response.Redirect((string)urlBuilder);
                    return;
                }
            }

            //After the form has been posted we remove the form elements and add a "thank you message".
            control.Controls.Clear();
            Label label = new Label();
            label.CssClass = "xformthankyoumessage";
            label.Text = LocalizationService.Current.GetString("/form/postedmessage");
            control.Controls.Add(label);
        }

        #endregion
    }
 
}
