using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminDashboard : System.Web.UI.Page
{
    private string connectionString = ConfigurationManager.ConnectionStrings["HireBaseConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlJobStatusFilter.SelectedValue = "All";
            BindDashboardData();
        }
    }

    private void BindDashboardData()
    {
        if (HasData())
        {
            BindStats();
            BindJobs();
            BindUsers();
            pnlData.Visible = true;
            pnlEmpty.Visible = false;
        }
        else
        {
            pnlData.Visible = false;
            pnlEmpty.Visible = true;
        }
    }

    private bool HasData()
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();

            SqlCommand cmdJobs = new SqlCommand("SELECT COUNT(*) FROM Jobs", con);
            SqlCommand cmdUsers = new SqlCommand("SELECT COUNT(*) FROM Users", con);

            int jobsCount = (int)cmdJobs.ExecuteScalar();
            int usersCount = (int)cmdUsers.ExecuteScalar();

            return jobsCount > 0 || usersCount > 0;
        }
    }

    private void BindStats()
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();

            // Total Employers
            SqlCommand cmdEmployers = new SqlCommand("SELECT COUNT(*) FROM Users WHERE UserType='Company'", con);
            litTotalEmployers.Text = cmdEmployers.ExecuteScalar().ToString();

            // Total Job Seekers
            SqlCommand cmdSeekers = new SqlCommand("SELECT COUNT(*) FROM Users WHERE UserType='Job Seeker'", con);
            litTotalSeekers.Text = cmdSeekers.ExecuteScalar().ToString();

            // Total Jobs
            SqlCommand cmdJobs = new SqlCommand("SELECT COUNT(*) FROM Jobs", con);
            litTotalJobs.Text = cmdJobs.ExecuteScalar().ToString();

            // Total Applications
            SqlCommand cmdApplications = new SqlCommand("SELECT COUNT(*) FROM Applications", con);
            litTotalApplications.Text = cmdApplications.ExecuteScalar().ToString();
        }
    }

    private void BindJobs()
    {
        List<AdminJob> jobs = new List<AdminJob>();
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();

            string query = "SELECT JobID, Title, Company, Status FROM Jobs";
            if (ddlJobStatusFilter.SelectedValue != "All")
            {
                query += " WHERE Status=@Status";
            }

            SqlCommand cmd = new SqlCommand(query, con);
            if (ddlJobStatusFilter.SelectedValue != "All")
            {
                cmd.Parameters.AddWithValue("@Status", ddlJobStatusFilter.SelectedValue);
            }

            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                jobs.Add(new AdminJob
                {
                    JobID = Convert.ToInt32(reader["JobID"]),
                    JobTitle = reader["Title"].ToString(),
                    Company = reader["Company"].ToString(),
                    Status = reader["Status"].ToString()
                });
            }
        }

        rptJobs.DataSource = jobs;
        rptJobs.DataBind();
    }

    private void BindUsers()
    {
        List<AdminUser> users = new List<AdminUser>();
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();

            string query = "SELECT UserID, Name, UserType, IsActive FROM Users";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                string status = (bool)reader["IsActive"] ? "Active" : "Blocked";
                users.Add(new AdminUser
                {
                    UserID = Convert.ToInt32(reader["UserID"]),
                    Name = reader["Name"].ToString(),
                    Role = reader["UserType"].ToString() == "Company" ? "Employer" : "Job Seeker",
                    Status = status
                });
            }
        }

        rptUsers.DataSource = users;
        rptUsers.DataBind();
    }

    protected void rptJobs_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int jobId = Convert.ToInt32(e.CommandArgument);
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();
            string newStatus = e.CommandName == "ApproveJob" ? "Active" : "Closed";
            SqlCommand cmd = new SqlCommand("UPDATE Jobs SET Status=@Status WHERE JobID=@JobID", con);
            cmd.Parameters.AddWithValue("@Status", newStatus);
            cmd.Parameters.AddWithValue("@JobID", jobId);
            cmd.ExecuteNonQuery();
        }
        BindDashboardData();
    }

    protected void rptUsers_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int userId = Convert.ToInt32(e.CommandArgument);
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();
            bool isActive = e.CommandName == "BlockUser" ? false : true;
            SqlCommand cmd = new SqlCommand("UPDATE Users SET IsActive=@IsActive WHERE UserID=@UserID", con);
            cmd.Parameters.AddWithValue("@IsActive", isActive);
            cmd.Parameters.AddWithValue("@UserID", userId);
            cmd.ExecuteNonQuery();
        }
        BindDashboardData();
    }

    protected void Filter_Changed(object sender, EventArgs e)
    {
        BindJobs();
    }

    public string GetStatusCssClass(object statusObj)
    {
        string status = statusObj.ToString();
        string baseClass = "px-2 py-1 rounded-full text-xs font-medium";

        switch (status)
        {
            case "Active":
                return baseClass + " bg-green-900 text-green-300";
            case "Closed":
                return baseClass + " bg-red-900 text-red-300";
            case "Pending Approval":
                return baseClass + " bg-yellow-900 text-yellow-300";
            case "Blocked":
                return baseClass + " bg-gray-700 text-gray-300";
            default:
                return baseClass;
        }
    }

}

public class AdminJob
{
    public int JobID { get; set; }
    public string JobTitle { get; set; }
    public string Company { get; set; }
    public string Status { get; set; }
}

public class AdminUser
{
    public int UserID { get; set; }
    public string Name { get; set; }
    public string Role { get; set; }
    public string Status { get; set; }
}
