using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

public partial class Reports : System.Web.UI.Page
{
    private string connectionString = ConfigurationManager.ConnectionStrings["HireBaseConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                BindAllReports();
            }
            catch (Exception ex)
            {
                // Log the error or display a friendly message
                Response.Write("<script>alert('Database connection error: " + ex.Message + "');</script>");
            }
        }
    }

    private void BindAllReports()
    {
        litTotalSeekers.Text = GetTotalUsers("Job Seeker").ToString();
        litTotalEmployers.Text = GetTotalUsers("Company").ToString();
        litTotalJobs.Text = GetTotalJobs().ToString();
        litTotalApplications.Text = GetTotalApplications().ToString();

        rptJobDistribution.DataSource = GetJobDistributionData();
        rptJobDistribution.DataBind();

        rptEmployerActivity.DataSource = GetEmployerActivityData();
        rptEmployerActivity.DataBind();

        rptApplicationReport.DataSource = GetApplicationReportData();
        rptApplicationReport.DataBind();
    }

    private int GetTotalUsers(string userType)
    {
        int count = 0;
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string query = "SELECT COUNT(*) FROM Users WHERE UserType = @UserType";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@UserType", userType);
                con.Open();
                count = Convert.ToInt32(cmd.ExecuteScalar());
            }
        }
        return count;
    }

    private int GetTotalJobs()
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string query = "SELECT COUNT(*) FROM Jobs";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }
    }

    private int GetTotalApplications()
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string query = "SELECT COUNT(*) FROM Applications";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }
    }

    private DataTable GetJobDistributionData()
    {
        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string query = "SELECT Category, COUNT(*) AS JobsPosted FROM Jobs GROUP BY Category";
            using (SqlDataAdapter da = new SqlDataAdapter(query, con))
            {
                da.Fill(dt);
            }
        }
        return dt;
    }

    private DataTable GetEmployerActivityData()
    {
        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string query = @"
                SELECT TOP 5 Company AS EmployerName, COUNT(*) AS JobsPosted
                FROM Jobs
                GROUP BY Company
                ORDER BY JobsPosted DESC";
            using (SqlDataAdapter da = new SqlDataAdapter(query, con))
            {
                da.Fill(dt);
            }
        }
        return dt;
    }

    private DataTable GetApplicationReportData()
    {
        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string query = @"
                SELECT j.Title AS JobTitle, j.Company AS Employer, COUNT(a.ApplicationID) AS ApplicationCount
                FROM Jobs j
                LEFT JOIN Applications a ON j.JobID = a.JobID
                GROUP BY j.Title, j.Company
                ORDER BY ApplicationCount DESC";
            using (SqlDataAdapter da = new SqlDataAdapter(query, con))
            {
                da.Fill(dt);
            }
        }
        return dt;
    }
}
