<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Job Portal Login</title>

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
            background-color: #0f172a;
            background-image: radial-gradient(circle at 1px 1px, rgba(255,255,255,0.05) 1px, transparent 0);
            background-size: 2rem 2rem;
        }
    </style>
</head>
<body class="main-bg flex items-center justify-center min-h-screen p-4">

    <form id="form1" runat="server">
        <div class="relative w-full max-w-md bg-slate-800/80 backdrop-blur-sm border border-slate-700 rounded-2xl shadow-2xl p-8 space-y-6">
            
            <!-- Logo and Header -->
            <div class="text-center">
                <div class="flex justify-center mx-auto mb-4">
                     <svg xmlns="http://www.w3.org/2000/svg" viewBox="60 35 80 80" class="w-20 h-20" role="img" aria-label="Job Finder logo">
                        <rect x="72" y="50" width="56" height="30" rx="4" fill="#1e293b"/>
                        <rect x="82" y="40" width="36" height="12" rx="3" fill="#1e293b"/>
                        <path d="M82 46h36" stroke="#4f46e5" stroke-width="3" stroke-linecap="round"/>
                        <g transform="translate(72,80)">
                            <rect x="0" y="0" width="56" height="6" rx="3" fill="#0f172a" opacity="0.65"/>
                        </g>
                        <g transform="translate(100,65)">
                            <path d="M0 -10a10 10 0 0 1 10 10c0 6-10 18-10 18S-10 6-10 0a10 10 0 0 1 10-10z" fill="#4f46e5"/>
                            <circle cx="0" cy="0" r="4" fill="#0f172a"/>
                        </g>
                    </svg>
                </div>

                <h1 class="text-3xl font-extrabold bg-gradient-to-r from-indigo-400 via-purple-500 to-pink-500 bg-clip-text text-transparent">
                    Welcome Back
                </h1>
                <p class="mt-2 text-sm text-slate-400">
                    Don't have an account?
                    <a href="Registration.aspx" class="font-medium text-indigo-400 hover:text-indigo-300 transition-colors">
                        Register here
                    </a>
                </p>
            </div>
            
            <!-- Login Form Fields -->
            <div class="space-y-4">
                <!-- Username Input -->
                <div class="relative">
                    <div class="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-3">
                         <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-slate-500" viewBox="0 0 20 20" fill="currentColor">
                           <path fill-rule="evenodd" d="M10 2a6 6 0 100 12A6 6 0 0010 2zM2 18a8 8 0 0116 0H2z" clip-rule="evenodd" />
                         </svg>
                    </div>
                    <asp:TextBox ID="UsernameTextBox" runat="server" CssClass="w-full pl-10 pr-3 py-2.5 border border-slate-600 rounded-lg shadow-sm placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm bg-slate-700 text-white transition-all" placeholder="Enter your username"></asp:TextBox>
                </div>

                <!-- Password Input -->
                <div class="relative">
                     <div class="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-3">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-slate-500" viewBox="0 0 20 20" fill="currentColor">
                           <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd" />
                        </svg>
                    </div>
                    <asp:TextBox ID="PasswordTextBox" runat="server" CssClass="w-full pl-10 pr-3 py-2.5 border border-slate-600 rounded-lg shadow-sm placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm bg-slate-700 text-white transition-all" TextMode="Password" placeholder="••••••••"></asp:TextBox>
                </div>
            </div>
            
            <!-- Remember Me & Forgot Password -->
            <div class="flex items-center justify-between">
                <div class="flex items-center">
                    <asp:CheckBox ID="RememberMeCheckBox" runat="server" CssClass="h-4 w-4 text-indigo-500 focus:ring-indigo-500 border-slate-500 bg-slate-700 rounded" />
                    <label for="RememberMeCheckBox" class="ml-2 block text-sm text-slate-300 select-none">
                        Remember me
                    </label>
                </div>
                <a href="#" class="text-sm font-medium text-indigo-400 hover:text-indigo-300 transition-colors">
                    Forgot password?
                </a>
            </div>
            
            <!-- Login Button and Message -->
            <div>
                <asp:Button ID="LoginButton" runat="server" Text="Log In" OnClick="LoginButton_Click" CssClass="w-full flex justify-center py-3 px-4 border border-transparent rounded-lg shadow-sm text-sm font-medium text-white bg-gradient-to-r from-indigo-600 to-purple-600 hover:from-indigo-700 hover:to-purple-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 focus:ring-offset-slate-800 transition-all transform hover:scale-105 hover:shadow-lg hover:shadow-indigo-500/30" />
                <asp:Label ID="LoginMessageLabel" runat="server" CssClass="block mt-4 text-sm text-red-400 text-center"></asp:Label>
            </div>

            <!-- Back to Home Link -->
             <div class="text-center mt-4">
                <a href="Home.aspx" class="text-sm text-slate-400 hover:text-white transition-colors">
                    &larr; Back to Home
                </a>
            </div>
        </div>
    </form>

</body>
</html>