using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JobSeekerDashboard : System.Web.UI.Page
{
    private readonly string connectionString = ConfigurationManager.ConnectionStrings["HireBaseConnectionString"].ConnectionString;

    // --- Data Models ---
    public class RecommendedJob
    {
        public int JobID { get; set; }
        public string JobTitle { get; set; }
        public string Company { get; set; }
        public string Location { get; set; }
    }

    public class RecentApplication
    {
        public int JobID { get; set; }
        public string JobTitle { get; set; }
        public string Company { get; set; }
        public string Status { get; set; }
        public DateTime AppliedDate { get; set; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDashboardData();
            LoadUserProfile();
        }
    }

    private void BindDashboardData()
    {
        BindRecommendedJobs();
        BindRecentApplications();
    }

    private void LoadUserProfile()
    {
        if (Session["UserID"] == null) return;

        int userId = Convert.ToInt32(Session["UserID"]);

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = @"SELECT FullName, Qualification, ProfileImage
                         FROM Users
                         WHERE UserID=@UserID";

            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@UserID", userId);
                conn.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        // Full Name
                        if (reader["FullName"] != DBNull.Value)
                            lblUserName.Text = reader["FullName"].ToString();
                        else
                            lblUserName.Text = "User";

                        if (reader["FullName"] != DBNull.Value)
                            lblFullName.Text = reader["FullName"].ToString();
                        else
                            lblFullName.Text = "Full Name";

                        // Qualification
                        if (reader["Qualification"] != DBNull.Value)
                            lblQualification.Text = reader["Qualification"].ToString();
                        else
                            lblQualification.Text = "-";

                        // Profile Image
                        if (reader["ProfileImage"] != DBNull.Value)
                            imgProfile.ImageUrl = reader["ProfileImage"].ToString();
                        else
                            imgProfile.ImageUrl = "https://placehold.co/96x96/cccccc/FFFFFF?text=Profile";
                    }
                }
            }
        }
    }


    private void BindRecommendedJobs()
    {
        List<RecommendedJob> recommendedJobs = new List<RecommendedJob>();

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = @"SELECT TOP 10 JobID, Title AS JobTitle, Company, Location
                             FROM Jobs
                             ORDER BY PostedDate DESC";

            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                conn.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        RecommendedJob job = new RecommendedJob();
                        job.JobID = reader.GetInt32(reader.GetOrdinal("JobID"));
                        job.JobTitle = reader["JobTitle"] != DBNull.Value ? reader["JobTitle"].ToString() : "-";
                        job.Company = reader["Company"] != DBNull.Value ? reader["Company"].ToString() : "-";
                        job.Location = reader["Location"] != DBNull.Value ? reader["Location"].ToString() : "-";
                        recommendedJobs.Add(job);
                    }
                }
            }
        }

        rptRecommendedJobs.DataSource = recommendedJobs;
        rptRecommendedJobs.DataBind();
    }

    private void BindRecentApplications()
    {
        if (Session["UserID"] == null) return;
        int userId = Convert.ToInt32(Session["UserID"]);

        List<RecentApplication> recentApplications = new List<RecentApplication>();

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = @"SELECT TOP 10 a.JobID, j.Title AS JobTitle, j.Company, a.Status, a.AppliedDate
                             FROM Applications a
                             INNER JOIN Jobs j ON a.JobID = j.JobID
                             WHERE a.UserID=@UserID
                             ORDER BY a.AppliedDate DESC";

            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@UserID", userId);
                conn.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        RecentApplication app = new RecentApplication();
                        app.JobID = reader.GetInt32(reader.GetOrdinal("JobID"));
                        app.JobTitle = reader["JobTitle"] != DBNull.Value ? reader["JobTitle"].ToString() : "-";
                        app.Company = reader["Company"] != DBNull.Value ? reader["Company"].ToString() : "-";
                        app.Status = reader["Status"] != DBNull.Value ? reader["Status"].ToString() : "Under Review";
                        app.AppliedDate = reader.GetDateTime(reader.GetOrdinal("AppliedDate"));
                        recentApplications.Add(app);
                    }
                }
            }
        }

        rptRecentApplications.DataSource = recentApplications;
        rptRecentApplications.DataBind();
    }

    protected void rptRecentApplications_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType != ListItemType.Item && e.Item.ItemType != ListItemType.AlternatingItem) return;

        Label lblStatus = (Label)e.Item.FindControl("lblStatus");
        if (lblStatus == null) return;

        string status = lblStatus.Text;
        string statusColorClass = "bg-yellow-100 text-yellow-800";

        switch (status)
        {
            case "Shortlisted":
                statusColorClass = "bg-green-100 text-green-800";
                break;
            case "Under Review":
                statusColorClass = "bg-blue-100 text-blue-800";
                break;
            case "Rejected":
                statusColorClass = "bg-red-100 text-red-800";
                break;
        }

        lblStatus.CssClass += " " + statusColorClass;
    }
}
