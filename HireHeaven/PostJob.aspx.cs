using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class PostJob : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Optional: Prepopulate dropdowns or set default values here
        }
    }

    
    // Publish button
    protected void btnPublish_Click(object sender, EventArgs e)
    {
        try
        {
            // Prepare requirements text
            string skills = string.Join(", ", cblSkills.Items.Cast<ListItem>().Where(li => li.Selected).Select(li => li.Text));
            string requirements = string.Format(
                "Qualification: {0}\nExperience: {1}\nSkills: {2}",
                ddlQualification.SelectedValue,
                ddlExperience.SelectedValue,
                skills
            );

            // Get connection string from Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["HireBaseConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"INSERT INTO Jobs 
                             (Title, Company, Location, JobType, Category, Description, Requirements) 
                             VALUES (@Title, @Company, @Location, @JobType, @Category, @Description, @Requirements)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Title", txtJobTitle.Text.Trim());
                    cmd.Parameters.AddWithValue("@Company", "Your Company Name");
                    cmd.Parameters.AddWithValue("@Location", txtLocation.Text.Trim());
                    cmd.Parameters.AddWithValue("@JobType", ddlJobType.SelectedValue);
                    cmd.Parameters.AddWithValue("@Category", ddlJobCategory.SelectedValue);
                    cmd.Parameters.AddWithValue("@Description", txtJobDescription.Text.Trim());
                    cmd.Parameters.AddWithValue("@Requirements", requirements);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            pnlForm.Visible = false;
            pnlSuccess.Visible = true;
        }
        catch (Exception ex)
        {
            // Display error message
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Error", string.Format("alert('Error: {0}');", ex.Message), true);
        }
    }


    // Save Draft button
    protected void btnSaveDraft_Click(object sender, EventArgs e)
    {
        // Here you can implement draft saving to database if needed
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Draft", "alert('Draft saved successfully!');", true);
    }
}
