<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JobDetails.aspx.cs" Inherits="JobDetails" %>
<%@ Register Src="Footer.ascx" TagPrefix="uc" TagName="Footer" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><asp:Literal ID="litTitle" runat="server"></asp:Literal> - Job Details</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
    <style>
         /* CSS variables for consistent theming. */
        
        /* Light theme (default) */
        body.theme-light, body {
            --bg-primary: #f8f9fa;
            --bg-secondary: #FFFFFF;
            --bg-card: #FFFFFF;
            --text-primary: #2C2C2C;
            --text-secondary: #6c757d;
            --text-heading: #2C2C2C;
            --text-on-dark: #343a40;
            --text-on-accent: #FFFFFF;
            --accent-blue: #0d6efd;
            --accent-blue-light: #e0e7ff;
            --border-color: #ced4da;
        }

        /* Balanced theme */
        body.theme-balanced {
            --bg-primary: #e7e9eb;
            --bg-secondary: #2E3B4E;
            --bg-card: #d7d9db;
            --text-primary: #1f2937;
            --text-secondary: #4b5563;
            --text-heading: #f9fafb;
            --text-on-dark: #1f2937; 
            --text-on-accent: #FFFFFF;
            --accent-blue: #4f46e5;
            --accent-blue-light: #e2e8f0;
            --border-color: #cbd5e1;
        }

        /* Dark theme */
        body.theme-dark {
            --bg-primary: #121212;
            --bg-secondary: #2A2A40;
            --bg-card: #2A2A40;
            --text-primary: #EAEAEA;
            --text-secondary: #B0B0B0;
            --text-heading: #e0e0e0;
            --text-on-dark: #EAEAEA;
            --text-on-accent: #FFFFFF;
            --accent-blue: #4A90E2;
            --accent-blue-light: #1f2937;
            --border-color: #3A3A50;
        }

        /* --- SEMANTIC CLASSES FROM MAIN PAGE --- */
        body {
            font-family: 'Inter', sans-serif;
            transition: background-color 0.3s ease, color 0.3s ease;
            background-color: var(--bg-primary);
        }

        .card-bg { background-color: var(--bg-card); }
        .text-primary { color: var(--text-primary); }
        .text-secondary { color: var(--text-secondary); }
        .text-on-dark { color: var(--text-on-dark); }
        .text-accent { color: var(--accent-blue); }
        .btn-primary { background-color: var(--accent-blue); color: var(--text-on-accent); }
        .btn-secondary { background-color: var(--accent-blue-light); color: var(--accent-blue); }
        .border-base { border-color: var(--border-color); }

        /* --- STYLES FROM HEADER CONTROL --- */
        .header { background-color: var(--bg-secondary); box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06); transition: background-color 0.3s ease; }
        .nav { max-width: 80rem; margin: 0 auto; padding: 1rem 1rem; display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; }
        .logo-text { font-size: 1.5rem; font-weight: 700; color: var(--text-heading); transition: color 0.3s ease; }
        .nav-links-desktop { display: none; }
        @media (min-width: 768px) { .nav-links-desktop { display: flex; flex-grow: 1; align-items: center; justify-content: center; gap: 1rem; } }
        .nav-link { color: var(--text-primary); padding: 0.5rem 0.75rem; border-radius: 0.375rem; font-weight: 500; transition: color 0.2s ease-in-out; }
        .nav-link:hover { color: var(--accent-blue); }
        .auth-buttons-desktop { display: none; align-items: center; gap: 1rem; }
        @media (min-width: 768px) { .auth-buttons-desktop { display: flex; } }
        .btn-login { color: var(--text-primary); padding: 0.5rem 0.75rem; border-radius: 0.375rem; font-weight: 500; transition: color 0.2s ease-in-out; }
        .btn-login:hover { color: var(--accent-blue); }
        .btn-register { padding: 0.5rem 1rem; border: 2px solid var(--accent-blue); font-size: 0.875rem; font-weight: 500; border-radius: 0.375rem; color: var(--accent-blue); background-color: transparent; transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out; }
        .btn-register:hover { background-color: var(--accent-blue); color: var(--text-on-accent); }
        .nav-controls-mobile { display: flex; align-items: center; gap: 1rem; }
        .mobile-menu-button { color: var(--text-primary); transition: color 0.3s ease; background: transparent; border: none; cursor: pointer;}
        @media (min-width: 768px) { .nav-controls-mobile .mobile-menu-button { display: none; } }
        .mobile-menu { display: none; }
        .mobile-menu.open { display: block; }
        .mobile-menu-links { padding: 0.5rem 0.5rem; display: flex; flex-direction: column; gap: 0.25rem; background-color: var(--bg-secondary); transition: background-color 0.3s ease; }
        .mobile-link { display: block; padding: 0.5rem 0.75rem; border-radius: 0.375rem; font-size: 1rem; font-weight: 500; color: var(--text-primary); transition: color 0.3s ease, background-color 0.3s ease; }
        .mobile-link:hover { color: var(--accent-blue); background-color: var(--bg-primary); }
        .mobile-register { display: block; width: 100%; text-align: center; padding: 0.5rem 0.75rem; border-radius: 0.375rem; font-size: 1rem; font-weight: 500; color: var(--text-on-accent); background-color: var(--accent-blue); transition: background-color 0.3s ease; }
        .mobile-register:hover { opacity: 0.9; }
        .theme-toggle-btn-new { display: flex; align-items: center; justify-content: center; padding: 0.5rem; border-radius: 9999px; cursor: pointer; color: var(--text-primary); background: transparent; border: none; transition: color 0.2s ease-in-out; }
        .theme-toggle-btn-new:hover { color: var(--accent-blue); }
        .theme-toggle-btn-new svg { fill: currentColor; width: 1.5rem; height: 1.5rem; }
        body.theme-balanced .header .logo-text,
        body.theme-balanced .header .nav-link,
        body.theme-balanced .header .btn-login,
        body.theme-balanced .header .mobile-menu-button,
        body.theme-balanced .header .theme-toggle-btn-new { color: #f9fafb; }
        body.theme-balanced .header .nav-link:hover,
        body.theme-balanced .header .btn-login:hover { color: #a5b4fc; }
        body.theme-balanced .header .btn-register { color: #f9fafb; border-color: #f9fafb; }
        body.theme-balanced .header .btn-register:hover { background-color: #f9fafb; color: var(--bg-secondary); }
    </style>
</head>
<body class="text-gray-800">
    <form id="form1" runat="server">
        
        <!-- HEADER MARKUP START -->
        <header class="header">
            <nav class="nav">
                <div class="logo">
                    <a href="Home.aspx" class="logo-text">HireHeaven</a>
                </div>
                
                <div class="nav-controls-mobile">
                    <button id="theme-toggle" class="theme-toggle-btn-new">
                        <svg id="theme-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"></svg>
                    </button>
                    <button id="mobile-menu-button" class="mobile-menu-button">
                        <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" /></svg>
                    </button>
                </div>
            </nav>
            <div id="mobile-menu" class="mobile-menu">
                <div class="mobile-menu-links">
                    <a href="Home.aspx" class="mobile-link">Home</a>
                    <a href="Jobs.aspx" class="mobile-link">Jobs</a>
                    <a href="AboutUs.aspx" class="mobile-link">About Us</a>
                    <a href="Login.aspx" class="mobile-link">Login</a>
                    <a href="Registration.aspx" class="mobile-register">Register</a>
                </div>
            </div>
        </header>
        <!-- HEADER MARKUP END -->
        
        <%-- Main Content Section for Job Details --%>
        <asp:Panel ID="mainContent" runat="server">
            <main class="container mx-auto p-6">
                <%-- Job Details Page Header --%>
                <div class="text-center my-12">
                    <h1 class="text-4xl md:text-5xl font-extrabold mb-2 text-accent">Job Details</h1>
                    <p class="text-lg text-secondary">View the complete job description and apply if it matches your skills.</p>
                </div>
                
                <%-- Job Information Section --%>
                <div class="card-bg p-6 md:p-10 rounded-lg shadow-lg">
                    <div class="mb-6 border-b border-base pb-4">
                        <h2 class="text-3xl font-bold mb-1 text-primary ">
                            <asp:Literal ID="litJobTitle" runat="server"></asp:Literal>
                        </h2>
                        <p class="text-secondary">
                            <asp:Literal ID="litCompany" runat="server"></asp:Literal> • 
                            <asp:Literal ID="litLocation" runat="server"></asp:Literal>
                        </p>
                    </div>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-6">
                        <div class="flex items-center gap-2">
                            <span class="font-semibold text-primary ">Job Type:</span>
                            <span class="text-primary"><asp:Literal ID="litJobType" runat="server"></asp:Literal></span>
                        </div>
                       
                        <div class="flex items-center gap-2">
                            <span class="font-semibold text-primary">Posted Date:</span>
                            <span class="text-primary"><asp:Literal ID="litPostedDate" runat="server"></asp:Literal></span>
                        </div>
                    </div>
                    
                    <div class="mb-6">
                        <h3 class="text-xl font-bold mb-2 text-primary">Job Description</h3>
                        <p class="text-primary leading-relaxed"><asp:Literal ID="litDescription" runat="server"></asp:Literal></p>
                    </div>

                    <div class="mb-6">
                        <h3 class="text-xl font-bold mb-2 text-primary">Requirements</h3>
                        <ul class="list-disc list-inside space-y-2 text-primary">
                            <asp:Literal ID="litRequirements" runat="server"></asp:Literal>
                        </ul>
                    </div>
                    
                    <%-- Apply Button Section --%>
                    <div class="mt-8 text-center">
                        <asp:Button ID="btnApply" runat="server" Text="Apply Now" OnClick="btnApply_Click"
                            CssClass="w-full md:w-auto px-12 py-4 btn-primary font-bold rounded-lg hover:opacity-90 transition-colors duration-200" />
                        <asp:Literal ID="litApplyMessage" runat="server" Visible="false" />
                    </div>
                </div>
            </main>
        </asp:Panel>

        <uc:Footer runat="server" />
    </form>
    
    <script>
        /* keep your existing JavaScript here (unchanged) */
        document.addEventListener('DOMContentLoaded', () => {
            const themeToggleBtn = document.getElementById('theme-toggle');
            const mobileMenuBtn = document.getElementById('mobile-menu-button');
            const mobileMenu = document.getElementById('mobile-menu');
            const body = document.body;
            const themeIcon = document.getElementById('theme-icon');

            // Define the SVG paths for sun and moon icons
            const sunIcon = `<path d="M12 2.25a.75.75 0 01.75.75v2.25a.75.75 0 01-1.5 0V3a.75.75 0 01.75-.75zM7.5 12a4.5 4.5 0 119 0 4.5 4.5 0 01-9 0zM18.75 5.75a.75.75 0 01.53.22l1.5 1.5a.75.75 0 01-1.06 1.06l-1.5-1.5a.75.75 0 01.53-1.28zM12 18a.75.75 0 01.75.75v2.25a.75.75 0 01-1.5 0V18a.75.75 0 01.75-.75zM5.75 18.75a.75.75 0 01.53-.22l1.5 1.5a.75.75 0 01-1.06 1.06l-1.5-1.5a.75.75 0 01-.53-1.28zM3 12a.75.75 0 01.75-.75h2.25a.75.75 0 010 1.5H3.75A.75.75 0 013 12zM18 12a.75.75 0 01.75-.75h2.25a.75.75 0 010 1.5H18.75A.75.75 0 0118 12zM5.75 5.25a.75.75 0 011.06 0l1.5 1.5a.75.75 0 01-1.06 1.06l-1.5-1.5a.75.75 0 010-1.06z" />`;
            const moonIcon = `<path d="M9.54 11.07a6.25 6.25 0 01-1.5-3.83c0-.18.06-.35.15-.5A8.25 8.25 0 0013 18.25a8.25 8.25 0 007.82-5.75c.09-.15.15-.32.15-.5a6.25 6.25 0 01-3.83 1.5c-.32 0-.64-.06-.94-.17-2.6-.97-4.2-3.65-4.2-6.55 0-.18.06-.35.15-.5z" />`;

            // Function to set the theme class on the body and update the icon
            const setTheme = (theme) => {
                // This replaces all classes on the body, which is what we want for themes
                document.body.className = theme;
                localStorage.setItem('theme', theme);
                if (themeIcon) { // Check if themeIcon exists
                    if (theme === 'theme-dark') {
                        themeIcon.innerHTML = sunIcon; // Show sun icon in dark mode to switch to light
                    } else {
                        themeIcon.innerHTML = moonIcon; // Show moon icon in light/balanced mode to switch to dark
                    }
                }
            };

            // Load theme from localStorage or default to balanced
            const savedTheme = localStorage.getItem('theme') || 'theme-balanced';
            setTheme(savedTheme);

            if (themeToggleBtn) {
                // Toggle theme on button click
                themeToggleBtn.addEventListener('click', () => {
                    let currentTheme = document.body.className;
                    if (currentTheme === 'theme-balanced') {
                        setTheme('theme-dark');
                    } else if (currentTheme === 'theme-dark') {
                        setTheme('theme-light');
                    } else {
                        // Default back to balanced after light
                        setTheme('theme-balanced');
                    }
                });
            }

            if (mobileMenuBtn) {
                // Toggle mobile menu on button click
                mobileMenuBtn.addEventListener('click', () => {
                    mobileMenu.classList.toggle('open');
                });
            }
        });
    </script>
</body>
</html>
