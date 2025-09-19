using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI.WebControls;

public partial class MyApplications : System.Web.UI.Page
{
    public class JobApplication
    {
        public int JobID { get; set; }
        public string JobTitle { get; set; }
        public string Company { get; set; }
        public string Location { get; set; }
        public DateTime AppliedDate { get; set; }
        public string Status { get; set; }
    }

    private readonly string connectionString = ConfigurationManager.ConnectionStrings["HireBaseConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindApplications();
        }
    }

    private void BindApplications()
    {
        // ✅ Fixed user ID (no login/session)
        int userId = 5;

        List<JobApplication> allApplications = GetApplicationsFromDatabase(userId);

        IEnumerable<JobApplication> filteredApplications = allApplications;

        // search filter
        if (!string.IsNullOrWhiteSpace(txtSearch.Text))
        {
            string keyword = txtSearch.Text.Trim().ToLower();
            filteredApplications = filteredApplications.Where(app =>
                app.JobTitle.ToLower().Contains(keyword) ||
                app.Company.ToLower().Contains(keyword)
            );
        }

        // status filter
        if (ddlStatus.SelectedValue != "All")
        {
            filteredApplications = filteredApplications.Where(app => app.Status == ddlStatus.SelectedValue);
        }

        // sort by latest applied
        filteredApplications = filteredApplications.OrderByDescending(app => app.AppliedDate);

        var finalList = filteredApplications.ToList();

        if (finalList.Count > 0)
        {
            rptApplications.DataSource = finalList;
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

    private List<JobApplication> GetApplicationsFromDatabase(int userId)
    {
        List<JobApplication> applications = new List<JobApplication>();

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = @"
                SELECT a.JobID, j.Title AS JobTitle, j.Company, j.Location, a.AppliedDate, a.Status
                FROM Applications a
                INNER JOIN Jobs j ON a.JobID = j.JobID
                WHERE a.UserID = @UserID";

            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@UserID", userId);
                conn.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        applications.Add(new JobApplication
                        {
                            JobID = Convert.ToInt32(reader["JobID"]),
                            JobTitle = reader["JobTitle"].ToString(),
                            Company = reader["Company"].ToString(),
                            Location = reader["Location"].ToString(),
                            AppliedDate = Convert.ToDateTime(reader["AppliedDate"]),
                            Status = reader["Status"].ToString()
                        });
                    }
                }
            }
        }
        return applications;
    }

    protected void rptApplications_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lblStatus = (Label)e.Item.FindControl("lblStatus");
            if (lblStatus != null)
            {
                string status = lblStatus.Text;
                string statusColorClass = "bg-gray-700 text-gray-300";

                switch (status)
                {
                    case "Pending":
                        statusColorClass = "bg-yellow-900 text-yellow-300";
                        break;
                    case "Under Review":
                        statusColorClass = "bg-blue-900 text-blue-300";
                        break;
                    case "Shortlisted":
                        statusColorClass = "bg-green-900 text-green-300";
                        break;
                    case "Rejected":
                        statusColorClass = "bg-red-900 text-red-300";
                        break;
                    case "Hired":
                        statusColorClass = "bg-purple-900 text-purple-300";
                        break;
                }
                lblStatus.CssClass += " " + statusColorClass;
            }
        }
    }

    protected void Filter_Changed(object sender, EventArgs e)
    {
        BindApplications();
    }

    protected void btnBrowseJobs_Click(object sender, EventArgs e)
    {
        Response.Redirect("Jobs.aspx");
    }
}
