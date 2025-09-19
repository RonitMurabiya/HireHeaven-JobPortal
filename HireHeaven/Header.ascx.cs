using System;
using System.Web;
using System.Web.UI;

public partial class HeaderControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SetHeaderLinks();
        }
    }

    private void SetHeaderLinks()
    {
        // Default: Logged-out users
        phDefaultLinksDesktop.Visible = true;
        phDefaultLinksMobile.Visible = true;
        phLoggedOutDesktop.Visible = true;
        phLoggedOutMobile.Visible = true;

        // Hide all role-specific placeholders by default
        phJobSeekerDesktop.Visible = false;
        phJobSeekerMobile.Visible = false;
        phEmployerDesktop.Visible = false;
        phEmployerMobile.Visible = false;
        phAdminDesktop.Visible = false;
        phAdminMobile.Visible = false;

        phEmployerLinksDesktop.Visible = false;
        phEmployerLinksMobile.Visible = false;
        phAdminLinksDesktop.Visible = false;
        phAdminLinksMobile.Visible = false;

        // Check if user is logged in
        if (Session["UserID"] != null && Session["UserType"] != null)
        {
            string userType = Session["UserType"].ToString();

            // Hide logged-out placeholders
            phDefaultLinksDesktop.Visible = false;
            phDefaultLinksMobile.Visible = false;
            phLoggedOutDesktop.Visible = false;
            phLoggedOutMobile.Visible = false;

            switch (userType.ToLower())
            {
                case "jobseeker":
                    phJobSeekerDesktop.Visible = true;
                    phJobSeekerMobile.Visible = true;
                    phDefaultLinksDesktop.Visible = true; // Show "Jobs" link
                    phDefaultLinksMobile.Visible = true;
                    break;

                case "employer":
                    phEmployerDesktop.Visible = true;
                    phEmployerMobile.Visible = true;
                    phEmployerLinksDesktop.Visible = true;
                    phEmployerLinksMobile.Visible = true;
                    break;

                case "admin":
                    phAdminDesktop.Visible = true;
                    phAdminMobile.Visible = true;
                    phAdminLinksDesktop.Visible = true;
                    phAdminLinksMobile.Visible = true;
                    break;
            }
        }
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        // Clear session and redirect to Home
        Session.Clear();
        Session.Abandon();
        Response.Redirect("Home.aspx");
    }
}
