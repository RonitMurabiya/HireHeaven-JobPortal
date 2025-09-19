using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ApplicationReceived : System.Web.UI.Page
{
    private readonly string connectionString = ConfigurationManager.ConnectionStrings["HireBaseConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateJobFilter();
            BindData();
        }
    }

    private void BindData()
    {
        // Get applications from database
        List<ApplicationViewModel> applications = GetApplicationsFromDatabase();

        // Apply filters
        string keyword = txtSearch.Text.Trim().ToLower();
        if (!string.IsNullOrWhiteSpace(keyword))
        {
            applications = applications.Where(a => a.CandidateName.ToLower().Contains(keyword)).ToList();
        }

        if (ddlJobFilter.SelectedValue != "All")
        {
            applications = applications.Where(a => a.Title == ddlJobFilter.SelectedValue).ToList();
        }

        if (ddlStatusFilter.SelectedValue != "All")
        {
            applications = applications.Where(a => a.Status == ddlStatusFilter.SelectedValue).ToList();
        }

        // Bind to repeater
        if (applications.Any())
        {
            rptApplications.DataSource = applications.OrderByDescending(a => a.AppliedDate).ToList();
            rptApplications.DataBind();
            pnlApplications.Visible = true;
            pnlEmpty.Visible = false;
        }
        else
        {
            pnlApplications.Visible = false;
            pnlEmpty.Visible = true;
        }
    }

    protected void rptApplications_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int applicationID = Convert.ToInt32(e.CommandArgument);

        // Fetch selected application from DB
        ApplicationViewModel selectedApp = GetApplicationsFromDatabase()
            .FirstOrDefault(app => app.ApplicationID == applicationID);

        if (selectedApp == null) return;

        switch (e.CommandName)
        {
            case "ViewProfile":
                ShowProfileModal(selectedApp);
                return;

            case "Shortlist":
                UpdateApplicationStatus(applicationID, "Shortlisted");
                ShowStatusMessage(string.Format("'{0}' has been shortlisted.", selectedApp.CandidateName), true);
                break;

            case "Reject":
                UpdateApplicationStatus(applicationID, "Rejected");
                ShowStatusMessage(string.Format("'{0}' has been rejected.", selectedApp.CandidateName), false);
                break;
        }

        BindData();
    }

    private void ShowProfileModal(ApplicationViewModel app)
    {
        litFullName.Text = app.CandidateName;
        litEmail.Text = app.Email;
        litPhone.Text = app.Phone;
        litExperience.Text = app.Experience;
        litQualification.Text = app.Qualification;
        litSkills.Text = app.Skills;

        if (!string.IsNullOrEmpty(app.ResumePath))
        {
            hlDownloadResume.NavigateUrl = app.ResumePath;
            hlDownloadResume.Visible = true;
        }
        else
        {
            hlDownloadResume.Visible = false;
        }

        Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowProfileModal", "showProfileModal();", true);
    }

    private void ShowStatusMessage(string message, bool isSuccess)
    {
        litStatusMessage.Text = message;
        pnlStatusMessage.CssClass = isSuccess
            ? "p-4 mb-6 rounded-lg text-center font-medium bg-green-100 text-green-800"
            : "p-4 mb-6 rounded-lg text-center font-medium bg-red-100 text-red-800";
        pnlStatusMessage.Visible = true;
    }

    protected void Filter_Changed(object sender, EventArgs e)
    {
        BindData();
    }

    private void PopulateJobFilter()
    {
        var jobTitles = GetApplicationsFromDatabase()
            .Select(a => a.Title)
            .Distinct()
            .OrderBy(title => title);

        ddlJobFilter.Items.Clear();
        ddlJobFilter.Items.Add(new ListItem("All Jobs", "All"));
        foreach (var title in jobTitles)
        {
            ddlJobFilter.Items.Add(new ListItem(title));
        }
    }

    /// <summary>
    /// Pulls applications from the database (Applications + Jobs + Candidates tables).
    /// </summary>
    private List<ApplicationViewModel> GetApplicationsFromDatabase()
    {
        List<ApplicationViewModel> applications = new List<ApplicationViewModel>();

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = @"
                SELECT a.ApplicationID, a.AppliedDate, a.Status,
                       c.FullName, c.Email, c.Phone, c.Experience, c.Qualification,
                       j.Title, j.Company, j.Location
                FROM Applications a
                INNER JOIN Candidates c ON a.CandidateID = c.CandidateID
                INNER JOIN Jobs j ON a.JobID = j.JobID";

            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                conn.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        applications.Add(new ApplicationViewModel
                        {
                            ApplicationID = Convert.ToInt32(reader["ApplicationID"]),
                            AppliedDate = Convert.ToDateTime(reader["AppliedDate"]),
                            Status = reader["Status"].ToString(),
                            CandidateName = reader["FullName"].ToString(),
                            Email = reader["Email"].ToString(),
                            Phone = reader["Phone"].ToString(),
                            Experience = reader["Experience"].ToString(),
                            Qualification = reader["Qualification"].ToString(),
                            Skills = "", // you can extend your DB with skills if needed
                            ResumePath = "#", // add if stored in DB
                            Title = reader["Title"].ToString()
                        });
                    }
                }
            }
        }

        return applications;
    }

    private void UpdateApplicationStatus(int applicationId, string newStatus)
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = "UPDATE Applications SET Status = @Status WHERE ApplicationID = @ApplicationID";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@Status", newStatus);
                cmd.Parameters.AddWithValue("@ApplicationID", applicationId);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}

// ViewModel
public class ApplicationViewModel
{
    public int ApplicationID { get; set; }
    public string Title { get; set; }
    public DateTime AppliedDate { get; set; }
    public string Status { get; set; }
    public string CandidateName { get; set; }
    public string Email { get; set; }
    public string Phone { get; set; }
    public string Experience { get; set; }
    public string Qualification { get; set; }
    public string Skills { get; set; }
    public string ResumePath { get; set; }
}
