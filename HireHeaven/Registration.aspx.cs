using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            RegisterMessageLabel.Text = "";
        }
    }

    protected void RegisterButton_Click(object sender, EventArgs e)
    {
        string userType = JobSeekerRadioButton.Checked ? "Job Seeker" : "Company";
        string name = NameTextBox.Text.Trim();
        string username = UsernameTextBox.Text.Trim(); // Added to get username
        string email = EmailTextBox.Text.Trim();
        string password = PasswordTextBox.Text;
        string confirmPassword = ConfirmPasswordTextBox.Text;

        // Validate fields
        if (string.IsNullOrWhiteSpace(name) ||
            string.IsNullOrWhiteSpace(username) || // Check for username
            string.IsNullOrWhiteSpace(email) ||
            string.IsNullOrWhiteSpace(password) ||
            string.IsNullOrWhiteSpace(confirmPassword))
        {
            RegisterMessageLabel.Text = "All fields are required.";
            return;
        }

        if (password != confirmPassword)
        {
            RegisterMessageLabel.Text = "Passwords do not match.";
            return;
        }

        try
        {
            string connectionString = ConfigurationManager.ConnectionStrings["HireBaseConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Check if email already exists
                string checkEmailQuery = "SELECT COUNT(1) FROM Users WHERE Email = @Email";
                using (SqlCommand checkCmd = new SqlCommand(checkEmailQuery, connection))
                {
                    checkCmd.Parameters.AddWithValue("@Email", email);
                    int exists = Convert.ToInt32(checkCmd.ExecuteScalar());
                    if (exists > 0)
                    {
                        RegisterMessageLabel.Text = "Email already registered.";
                        return;
                    }
                }

                // Check if username already exists
                string checkUsernameQuery = "SELECT COUNT(1) FROM Users WHERE Username = @Username";
                using (SqlCommand checkCmd = new SqlCommand(checkUsernameQuery, connection))
                {
                    checkCmd.Parameters.AddWithValue("@Username", username);
                    int exists = Convert.ToInt32(checkCmd.ExecuteScalar());
                    if (exists > 0)
                    {
                        RegisterMessageLabel.Text = "Username already taken.";
                        return;
                    }
                }

                // Hash the password
                string hashedPassword = ComputeHash(password);

                // Insert the new user including the Username field
                string insertQuery = @"
                    INSERT INTO Users (UserType, Name, Username, Email, PasswordHash, CreatedAt, IsActive, RememberMe)
                    VALUES (@UserType, @Name, @Username, @Email, @PasswordHash, GETDATE(), 1, @RememberMe)";

                using (SqlCommand insertCmd = new SqlCommand(insertQuery, connection))
                {
                    insertCmd.Parameters.AddWithValue("@UserType", userType);
                    insertCmd.Parameters.AddWithValue("@Name", name);
                    insertCmd.Parameters.AddWithValue("@Username", username); // Add username here
                    insertCmd.Parameters.AddWithValue("@Email", email);
                    insertCmd.Parameters.AddWithValue("@PasswordHash", hashedPassword);
                    insertCmd.Parameters.AddWithValue("@RememberMe", RememberMeCheckBox.Checked ? 1 : 0);

                    insertCmd.ExecuteNonQuery();

                    RegisterMessageLabel.CssClass = "block mt-4 text-sm text-green-400 text-center";
                    RegisterMessageLabel.Text = "Registration successful!";
                    ClearForm();
                }
            }
        }
        catch (Exception ex)
        {
            RegisterMessageLabel.CssClass = "block mt-4 text-sm text-red-500 text-center";
            RegisterMessageLabel.Text = "Error: " + ex.Message;
        }
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

    private void ClearForm()
    {
        NameTextBox.Text = "";
        UsernameTextBox.Text = ""; // Clear username
        EmailTextBox.Text = "";
        PasswordTextBox.Text = "";
        ConfirmPasswordTextBox.Text = "";
        RememberMeCheckBox.Checked = false;
        JobSeekerRadioButton.Checked = true;
        CompanyRadioButton.Checked = false;
    }
}
