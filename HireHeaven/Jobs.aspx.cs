using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Jobs : System.Web.UI.Page
{
    private readonly string connectionString = ConfigurationManager.ConnectionStrings["HireBaseConnectionString"].ConnectionString;

    // A class to represent a job listing
    public class Job
    {
        public int JobID { get; set; }
        public string Title { get; set; }
        public string Company { get; set; }
        public string Location { get; set; }
        public string JobType { get; set; }
        public string Category { get; set; }
        public string Description { get; set; }
        public DateTime PostedDate { get; set; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindJobs();
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindJobs();
    }

    protected void ddlJobType_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindJobs();
    }

    protected void ddlDatePosted_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindJobs();
    }

    private void BindJobs()
    {
        List<Job> allJobs = GetJobsFromDatabase();

        string keyword = txtKeyword.Text.Trim().ToLower();
        string location = ddlLocation.SelectedValue;
        string category = ddlCategory.SelectedValue;
        string jobType = ddlJobType.SelectedValue;
        string datePosted = ddlDatePosted.SelectedValue;

        IEnumerable<Job> filteredJobs = allJobs;

        if (!string.IsNullOrEmpty(keyword))
        {
            filteredJobs = filteredJobs.Where(j =>
                j.Title.ToLower().Contains(keyword) ||
                j.Company.ToLower().Contains(keyword) ||
                j.Description.ToLower().Contains(keyword)
            );
        }

        if (location != "All")
        {
            filteredJobs = filteredJobs.Where(j => j.Location == location);
        }

        if (category != "All")
        {
            filteredJobs = filteredJobs.Where(j => j.Category == category);
        }

        if (jobType != "All")
        {
            filteredJobs = filteredJobs.Where(j => j.JobType == jobType);
        }

        if (datePosted != "All")
        {
            int days = Convert.ToInt32(datePosted);
            DateTime dateFilter = DateTime.Now.AddDays(-days);
            filteredJobs = filteredJobs.Where(j => j.PostedDate >= dateFilter);
        }

        rptJobListings.DataSource = filteredJobs.ToList();
        rptJobListings.DataBind();
    }

    public string FormatDescription(object descriptionObj)
    {
        string description = (descriptionObj != null) ? descriptionObj.ToString() : "";
        int maxLength = 150;
        return description.Length <= maxLength ? description : description.Substring(0, maxLength) + "...";
    }

    protected void rptJobListings_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            // Additional logic per job (optional)
        }
    }

    /// <summary>
    /// Fetch jobs from database
    /// </summary>
    private List<Job> GetJobsFromDatabase()
    {
        List<Job> jobs = new List<Job>();

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = @"SELECT JobID, Title, Company, Location, JobType, Category, Description, PostedDate 
                             FROM Jobs
                             ORDER BY PostedDate DESC";

            SqlCommand cmd = new SqlCommand(query, conn);
            conn.Open();

            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                jobs.Add(new Job
                {
                    JobID = Convert.ToInt32(reader["JobID"]),
                    Title = reader["Title"].ToString(),
                    Company = reader["Company"].ToString(),
                    Location = reader["Location"].ToString(),
                    JobType = reader["JobType"].ToString(),
                    Category = reader["Category"].ToString(),
                    Description = reader["Description"].ToString(),
                    PostedDate = reader["PostedDate"] != DBNull.Value
                        ? Convert.ToDateTime(reader["PostedDate"])
                        : DateTime.Now
                });
            }
        }

        return jobs;
    }
}
