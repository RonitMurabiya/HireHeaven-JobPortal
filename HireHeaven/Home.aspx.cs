using System;
using System.Web.UI;

namespace HireHeaven
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMessage.Text = "";
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (IsValidCredentials(username, password))
            {
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid username or password.";
            }
        }

        private bool IsValidCredentials(string username, string password)
        {
            // Example: placeholder logic for demonstration
            return username == "testuser" && password == "password123";
        }
    }
}
