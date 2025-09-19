<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Job Portal Registration</title>

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Google Fonts: Inter -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
        .main-bg {
            background-color: #0f172a; /* slate-900 */
            background-image: radial-gradient(circle at 1px 1px, rgba(255,255,255,0.05) 1px, transparent 0);
            background-size: 2rem 2rem;
        }
    </style>
</head>
<body class="main-bg flex items-center justify-center min-h-screen p-4">

    <form id="form1" runat="server" class="w-full max-w-md">
        <div class="bg-slate-800/95 backdrop-blur-sm border border-slate-700 rounded-2xl shadow-2xl p-8 space-y-6">

            <!-- Header -->
            <div class="text-center">
                <div class="flex justify-center mx-auto mb-4">
                    <!-- Logo SVG -->
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="60 35 80 80" class="w-20 h-20" role="img" aria-label="Job Finder logo">
                        <rect x="72" y="50" width="56" height="30" rx="4" fill="#1e293b"/>
                        <rect x="82" y="40" width="36" height="12" rx="3" fill="#1e293b"/>
                        <path d="M82 46h36" stroke="#4f46e5" stroke-width="3" stroke-linecap="round"/>
                    </svg>
                </div>

                <h1 class="text-3xl font-extrabold bg-gradient-to-r from-indigo-400 via-purple-500 to-pink-500 bg-clip-text text-transparent">
                    Create Account
                </h1>
                <p class="mt-2 text-sm text-slate-400">
                    Already have an account? 
                    <a href="Login.aspx" class="font-medium text-indigo-400 hover:text-indigo-300 transition-colors">Log in here</a>
                </p>
            </div>

            <!-- User Type Selection -->
            <div class="space-y-4">
                <div class="flex border border-slate-600 rounded-full bg-slate-700 p-1">
                    <asp:RadioButton ID="JobSeekerRadioButton" runat="server" GroupName="UserType" CssClass="hidden peer" Checked="true" />
                    <label for="JobSeekerRadioButton" class="flex-1 text-center py-2 text-sm font-medium text-slate-300 cursor-pointer rounded-full hover:bg-indigo-700 hover:text-white transition-all peer-checked:bg-gradient-to-r peer-checked:from-indigo-600 peer-checked:to-indigo-700 peer-checked:text-white">
                        Job Seeker
                    </label>

                    <asp:RadioButton ID="CompanyRadioButton" runat="server" GroupName="UserType" CssClass="hidden peer" />
                    <label for="CompanyRadioButton" class="flex-1 text-center py-2 text-sm font-medium text-slate-300 cursor-pointer rounded-full hover:bg-pink-600 hover:text-white transition-all peer-checked:bg-gradient-to-r peer-checked:from-pink-500 peer-checked:to-purple-600 peer-checked:text-white">
                        Company
                    </label>
                </div>

                <!-- Name -->
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-slate-500" viewBox="0 0 20 20" fill="currentColor">
                            <path fill-rule="evenodd" d="M10 12a5 5 0 100-10 5 5 0 000 10zm-7 8a7 7 0 0114 0H3z" clip-rule="evenodd"/>
                        </svg>
                    </div>
                    <asp:TextBox ID="NameTextBox" runat="server" CssClass="w-full pl-10 pr-3 py-2.5 border border-slate-600 rounded-lg shadow-sm placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 bg-slate-700 text-white sm:text-sm" placeholder="Full Name"></asp:TextBox>
                </div>

                <!-- Username -->
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-slate-500" viewBox="0 0 20 20" fill="currentColor">
                            <path d="M8 9a3 3 0 100-6 3 3 0 000 6z"/>
                            <path fill-rule="evenodd" d="M4 14s1-1 4-1 4 1 4 1v2H4v-2z" clip-rule="evenodd"/>
                        </svg>
                    </div>
                    <asp:TextBox ID="UsernameTextBox" runat="server" CssClass="w-full pl-10 pr-3 py-2.5 border border-slate-600 rounded-lg shadow-sm placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 bg-slate-700 text-white sm:text-sm" placeholder="Username"></asp:TextBox>
                </div>

                <!-- Email -->
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-slate-500" viewBox="0 0 20 20" fill="currentColor">
                            <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z" />
                            <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z" />
                        </svg>
                    </div>
                    <asp:TextBox ID="EmailTextBox" runat="server" CssClass="w-full pl-10 pr-3 py-2.5 border border-slate-600 rounded-lg shadow-sm placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 bg-slate-700 text-white sm:text-sm" placeholder="you@example.com" type="email"></asp:TextBox>
                </div>

                <!-- Password -->
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-slate-500" viewBox="0 0 20 20" fill="currentColor">
                            <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"/>
                        </svg>
                    </div>
                    <asp:TextBox ID="PasswordTextBox" runat="server" CssClass="w-full pl-10 pr-12 py-2.5 border border-slate-600 rounded-lg shadow-sm placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 bg-slate-700 text-white sm:text-sm" TextMode="Password" placeholder="Password"></asp:TextBox>
                    <button type="button" id="password-toggle-button" class="absolute inset-y-0 right-0 flex items-center px-3 text-slate-500 hover:text-slate-300 transition-colors focus:outline-none" aria-label="Toggle password visibility">
                        <svg id="eye-icon" xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                            <path stroke-linecap="round" stroke-linejoin="round" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                        </svg>
                        <svg id="eye-slash-icon" xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 hidden" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.542-7 1.274-4.057 5.064-7 9.542-7 .847 0 1.673.124 2.468.352M10.5 10.5c.253-1.442 1.54-2.5 3-2.5 1.657 0 3 1.343 3 3 0 .19-.018.375-.052.556M16.5 5.5L5.5 16.5" />
                        </svg>
                    </button>
                </div>

                <!-- Confirm Password -->
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-slate-500" viewBox="0 0 20 20" fill="currentColor">
                            <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"/>
                        </svg>
                    </div>
                    <asp:TextBox ID="ConfirmPasswordTextBox" runat="server" CssClass="w-full pl-10 pr-12 py-2.5 border border-slate-600 rounded-lg shadow-sm placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 bg-slate-700 text-white sm:text-sm" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
                    <button type="button" id="confirm-password-toggle-button" class="absolute inset-y-0 right-0 flex items-center px-3 text-slate-500 hover:text-slate-300 transition-colors focus:outline-none" aria-label="Toggle confirm password visibility">
                        <svg id="confirm-eye-icon" xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                            <path stroke-linecap="round" stroke-linejoin="round" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                        </svg>
                        <svg id="confirm-eye-slash-icon" xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 hidden" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.542-7 1.274-4.057 5.064-7 9.542-7 .847 0 1.673.124 2.468.352M10.5 10.5c.253-1.442 1.54-2.5 3-2.5 1.657 0 3 1.343 3 3 0 .19-.018.375-.052.556M16.5 5.5L5.5 16.5" />
                        </svg>
                    </button>
                </div>
            </div>

            <!-- Remember Me -->
            <div class="flex items-center">
                <asp:CheckBox ID="RememberMeCheckBox" runat="server" CssClass="h-4 w-4 text-indigo-500 focus:ring-indigo-500 bg-slate-700 rounded" AssociatedControlID="RememberMeLabel"/>
                <asp:Label ID="RememberMeLabel" runat="server" Text="Remember me" CssClass="ml-2 block text-sm text-slate-300 select-none"></asp:Label>
            </div>

            <!-- Register Button -->
            <div>
                <asp:Button ID="RegisterButton" runat="server" Text="Register" CssClass="w-full py-3 px-4 bg-gradient-to-r from-indigo-600 to-purple-600 hover:from-indigo-700 hover:to-purple-700 text-white font-medium rounded-lg shadow-md hover:shadow-lg transition-transform transform hover:scale-105 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500" OnClick="RegisterButton_Click"/>
                <asp:Label ID="RegisterMessageLabel" runat="server" CssClass="block mt-4 text-sm text-red-400 text-center"></asp:Label>
            </div>

            <!-- Back to Home Link -->
            <div class="text-center mt-4">
                <a href="Home.aspx" class="text-sm text-slate-400 hover:text-white transition-colors">
                    &larr; Back to Home
                </a>
            </div>

        </div>
    </form>
    
    <script type="text/javascript">
        // Wait for the DOM to be fully loaded
        document.addEventListener('DOMContentLoaded', function () {
            // Helper function to set up a password toggle, making the code reusable
            function setupPasswordToggle(buttonId, inputId, eyeIconId, eyeSlashIconId) {
                const toggleButton = document.getElementById(buttonId);
                // Use the ClientID to get the unique ID rendered by ASP.NET
                const passwordInput = document.getElementById(inputId);
                const eyeIcon = document.getElementById(eyeIconId);
                const eyeSlashIcon = document.getElementById(eyeSlashIconId);

                // Ensure all elements exist before adding the event listener
                if (toggleButton && passwordInput && eyeIcon && eyeSlashIcon) {
                    toggleButton.addEventListener('click', function () {
                        // Check if the input is currently of type 'password'
                        const isPassword = passwordInput.getAttribute('type') === 'password';
                        // Toggle the input type to show/hide the text
                        passwordInput.setAttribute('type', isPassword ? 'text' : 'password');
                        // Toggle the visibility of the corresponding eye icons
                        eyeIcon.classList.toggle('hidden', isPassword);
                        eyeSlashIcon.classList.toggle('hidden', !isPassword);
                    });
                }
            }

            // Setup for the main password field
            setupPasswordToggle(
                'password-toggle-button',
                '<%= PasswordTextBox.ClientID %>',
                'eye-icon',
                'eye-slash-icon'
            );

            // Setup for the confirm password field
            setupPasswordToggle(
                'confirm-password-toggle-button',
                '<%= ConfirmPasswordTextBox.ClientID %>',
                'confirm-eye-icon',
                'confirm-eye-slash-icon'
            );
        });
    </script>

</body>
</html>
