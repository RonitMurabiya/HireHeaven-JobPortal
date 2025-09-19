using System;
using System.Web.Security;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoginMessageLabel.Text = "";
        }
    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        string usernameOrEmail = UsernameTextBox.Text.Trim();
        string password = PasswordTextBox.Text.Trim();
        bool rememberMe = RememberMeCheckBox.Checked;

        // First check if admin
        if (ValidateAdmin(usernameOrEmail, password))
        {
            FormsAuthentication.SetAuthCookie(usernameOrEmail, rememberMe);
            Response.Redirect("AdminDashboard.aspx");
            return;
        }

        // Check if user
        string userType = ValidateUser(usernameOrEmail, password);

        if (!string.IsNullOrEmpty(userType))
        {
            FormsAuthentication.SetAuthCookie(usernameOrEmail, rememberMe);

            if (userType == "Job Seeker")
            {
                Response.Redirect("JobSeekerDashboard.aspx");
            }
            else if (userType == "Company")
            {
                Response.Redirect("EmployerDashboard.aspx");
            }
            else
            {
                LoginMessageLabel.Text = "Unknown user type.";
                LoginMessageLabel.CssClass = "block mt-4 text-sm text-red-400 text-center";
            }
        }
        else
        {
            LoginMessageLabel.Text = "Invalid username or password.";
            LoginMessageLabel.CssClass = "block mt-4 text-sm text-red-400 text-center";
        }

        UsernameTextBox.Text = "";
        PasswordTextBox.Text = "";
        UsernameTextBox.Focus();
    }

    private bool ValidateAdmin(string username, string password)
    {
        bool isValid = false;

        try
        {
            string connectionString = ConfigurationManager.ConnectionStrings["HireBaseConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT COUNT(1) FROM Admins WHERE AdminUsername = @Username AND Password = @Password";
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password); // ⚠️ Hash in production!

                    int count = Convert.ToInt32(cmd.ExecuteScalar());
                    isValid = count == 1;
                }
            }
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine("Error during admin login: " + ex.Message);
        }

        return isValid;
    }

    private string ValidateUser(string username, string password)
    {
        string userType = null;

        try
        {
            string connectionString = ConfigurationManager.ConnectionStrings["HireBaseConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT UserType, PasswordHash FROM Users WHERE Username = @Username";
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@Username", username);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string storedHash = reader["PasswordHash"].ToString();
                            string computedHash = ComputeHash(password);

                            if (storedHash == computedHash)
                            {
                                userType = reader["UserType"].ToString();
                            }
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine("Error during user login: " + ex.Message);
        }

        return userType;
    }

    private string ComputeHash(string input)
    {
        using (SHA256 sha256 = SHA256.Create())
        {
            byte[] bytes = Encoding.UTF8.GetBytes(input);
            byte[] hash = sha256.ComputeHash(bytes);
            return Convert.ToBase64String(hash);
        }
    }
}
