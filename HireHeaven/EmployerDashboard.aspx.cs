using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EmployerDashboard : System.Web.UI.Page
{
    private readonly string connectionString = ConfigurationManager.ConnectionStrings["HireBaseConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDashboardData();
        }
    }

    /// <summary>
    /// Binds job data and statistics to UI controls from the database.
    /// </summary>
    private void BindDashboardData()
    {
        List<PostedJob> jobs = new List<PostedJob>();

        // Get current employer ID from session
        int employerId = Convert.ToInt32(Session["EmployerID"] ?? "0");
        if (employerId == 0) return; // No valid employer

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            // Join Jobs and Applications to get counts dynamically
            string query = @"
                SELECT j.JobID, j.Title, j.Company, j.Location, j.JobType, j.Category, 
                       j.Description, j.PostedDate, j.Requirements, j.Status,
                       COUNT(a.ApplicationID) AS ApplicationCount
                FROM Jobs j
                LEFT JOIN Applications a ON j.JobID = a.JobID
                WHERE j.EmployerID = @EmployerID
                GROUP BY j.JobID, j.Title, j.Company, j.Location, j.JobType, j.Category, 
                         j.Description, j.PostedDate, j.Requirements, j.Status
                ORDER BY j.PostedDate DESC";

            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@EmployerID", employerId);
                conn.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        jobs.Add(new PostedJob
                        {
                            JobID = reader.GetInt32(reader.GetOrdinal("JobID")),
                            Title = reader["Title"] == DBNull.Value ? "" : reader["Title"].ToString(),
                            Company = reader["Company"] == DBNull.Value ? "" : reader["Company"].ToString(),
                            Location = reader["Location"] == DBNull.Value ? "" : reader["Location"].ToString(),
                            JobType = reader["JobType"] == DBNull.Value ? "" : reader["JobType"].ToString(),
                            Category = reader["Category"] == DBNull.Value ? "" : reader["Category"].ToString(),
                            Description = reader["Description"] == DBNull.Value ? "" : reader["Description"].ToString(),
                            PostedDate = reader["PostedDate"] == DBNull.Value ? DateTime.MinValue : Convert.ToDateTime(reader["PostedDate"]),
                            Requirements = reader["Requirements"] == DBNull.Value ? "" : reader["Requirements"].ToString(),
                            Status = reader["Status"] == DBNull.Value ? "Draft" : reader["Status"].ToString(),
                            ApplicationCount = reader["ApplicationCount"] == DBNull.Value ? 0 : Convert.ToInt32(reader["ApplicationCount"])
                        });
                    }
                }
            }
        }

        // Bind to repeater and dashboard stats
        if (jobs.Any())
        {
            rptPostedJobs.DataSource = jobs;
            rptPostedJobs.DataBind();

            litTotalJobs.Text = jobs.Count.ToString();
            litActiveJobs.Text = jobs.Count(j => j.Status == "Active").ToString();
            litApplicationsReceived.Text = jobs.Sum(j => j.ApplicationCount).ToString();
            litShortlisted.Text = GetShortlistedCount(employerId).ToString();

            pnlJobsPosted.Visible = true;
            pnlEmpty.Visible = false;
        }
        else
        {
            pnlJobsPosted.Visible = false;
            pnlEmpty.Visible = true;
        }
    }

    /// <summary>
    /// Returns a CSS class for styling job status labels.
    /// </summary>
    public string GetStatusCssClass(object statusObj)
    {
        string status = statusObj == null || statusObj == DBNull.Value ? "Draft" : statusObj.ToString();
        string baseClass = "px-2 py-1 rounded-full text-xs font-medium";

        switch (status)
        {
            case "Active":
                return baseClass + " bg-green-900 text-green-300";
            case "Closed":
                return baseClass + " bg-red-900 text-red-300";
            case "Draft":
                return baseClass + " bg-yellow-900 text-yellow-300";
            default:
                return baseClass + " bg-gray-700 text-gray-300";
        }
    }


    /// <summary>
    /// Get total shortlisted candidates for this employer.
    /// </summary>
    private int GetShortlistedCount(int employerId)
    {
        int count = 0;
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = @"
                SELECT COUNT(*) 
                FROM Applications a
                INNER JOIN Jobs j ON a.JobID = j.JobID
                WHERE j.EmployerID = @EmployerID AND a.Status = 'Shortlisted'";

            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@EmployerID", employerId);
                conn.Open();
                count = (int)cmd.ExecuteScalar();
            }
        }
        return count;
    }
}

// --- Helper class ---
public class PostedJob
{
    public int JobID { get; set; }
    public string JobTitle { get { return Title; } } // Wrapper for Repeater
    public string Title { get; set; }
    public string Company { get; set; }
    public string Location { get; set; }
    public string JobType { get; set; }
    public string Category { get; set; }
    public string Description { get; set; }
    public DateTime PostedDate { get; set; }
    public string Requirements { get; set; }
    public string Status { get; set; }
    public int ApplicationCount { get; set; }
}
