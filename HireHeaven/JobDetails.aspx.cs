using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

public partial class JobDetails : System.Web.UI.Page
{
    public class Job
    {
        public int JobID { get; set; }
        public string Title { get; set; }
        public string Company { get; set; }
        public string Location { get; set; }
        public string JobType { get; set; }
        public string Category { get; set; }
        public string Description { get; set; }
        public string Requirements { get; set; }
        public DateTime PostedDate { get; set; }
    }

    private readonly string connectionString =
        ConfigurationManager.ConnectionStrings["HireBaseConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int jobId;
            if (int.TryParse(Request.QueryString["JobID"], out jobId))
            {
                LoadJobDetails(jobId);
            }
            else
            {
                ShowError("Job not found. The job ID is missing or invalid.");
            }
        }
    }

    private void LoadJobDetails(int jobId)
    {
        Job job = GetJobById(jobId);

        if (job != null)
        {
            litTitle.Text = job.Title;
            litJobTitle.Text = job.Title;
            litCompany.Text = job.Company;
            litLocation.Text = job.Location;
            litJobType.Text = job.JobType;
            litPostedDate.Text = job.PostedDate.ToString("dd MMM yyyy");
            litDescription.Text = job.Description;

            if (!string.IsNullOrEmpty(job.Requirements))
            {
                var requirementsList = job.Requirements.Split(';');
                litRequirements.Text = string.Join("", Array.ConvertAll(requirementsList, r => string.Format("<li>{0}</li>", r.Trim())));
            }
        }
        else
        {
            ShowError(string.Format("Job with ID {0} could not be found.", jobId));
        }
    }

    protected void btnApply_Click(object sender, EventArgs e)
    {
        btnApply.Enabled = false;
        btnApply.Text = "Applied Successfully";
        litApplyMessage.Text = "<div class='mt-4 p-4 text-green-800 bg-green-100 rounded-lg'>Your application has been submitted! The employer will contact you if you are a good fit.</div>";
        litApplyMessage.Visible = true;
    }

    private void ShowError(string message)
    {
        var mainContent = this.FindControl("form1").FindControl("mainContent");
        if (mainContent != null)
        {
            mainContent.Visible = false;
        }

        litTitle.Text = "Error";
        litJobTitle.Text = "Error";
        litDescription.Text = message;
    }

    private Job GetJobById(int jobId)
    {
        Job job = null;

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = "SELECT JobID, Title, Company, Location, JobType, Category, Description, Requirements, PostedDate FROM Jobs WHERE JobID = @JobID";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@JobID", jobId);

            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                job = new Job
                {
                    JobID = (int)reader["JobID"],
                    Title = reader["Title"].ToString(),
                    Company = reader["Company"].ToString(),
                    Location = reader["Location"].ToString(),
                    JobType = reader["JobType"].ToString(),
                    Category = reader["Category"].ToString(),
                    Description = reader["Description"].ToString(),
                    Requirements = reader["Requirements"].ToString(),
                    PostedDate = Convert.ToDateTime(reader["PostedDate"])
                };
            }
            conn.Close();
        }

        return job;
    }
}
