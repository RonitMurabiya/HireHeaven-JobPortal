using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HireHeaven
{
    // This is the code-behind class for the ASCX User Control.
    // It is named to match the ASCX file and inherits from System.Web.UI.UserControl.
    public partial class Footer : System.Web.UI.UserControl
    {
        // This event handler runs when the user control is loaded by a parent page.
        // It's the place to add any logic that needs to happen on initial load.
        protected void Page_Load(object sender, EventArgs e)
        {
            // The !IsPostBack check is important for UserControls as well,
            // to prevent logic from running on every postback (e.g., when a form is submitted).
            if (!IsPostBack)
            {
                // Here, you would add logic for dynamic content in the footer.
                // For example, you could bind data to a Repeater or update a Label control.
                // For now, we'll just log a message to the debug console to confirm it loaded.
                System.Diagnostics.Debug.WriteLine("Footer user control loaded successfully!");
            }
        }
    }
}
