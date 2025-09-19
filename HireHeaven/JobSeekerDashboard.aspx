<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JobSeekerDashboard.aspx.cs" Inherits="JobSeekerDashboard" %>
<%@ Register Src="Footer.ascx" TagPrefix="uc" TagName="Footer" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Job Seeker Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />
   <style>
        /* CSS variables and semantic classes for a consistent, site-wide theming system. */
        
        /* Default variables for Light theme */
        body.theme-light, body {
            --bg-primary: #f8f9fa;
            --bg-secondary: #FFFFFF;
            --bg-card: #FFFFFF;
            --bg-card-secondary: #f1f5f9;
            --text-primary: #2C2C2C;
            --text-secondary: #6c757d;
            --text-heading: #2C2C2C; /* Added for header consistency */
            --text-on-dark: #343a40;
            --text-on-accent: #FFFFFF; /* Added for header consistency */
            --accent-blue: #0d6efd;
            --border-color: #ced4da;
        }

        /* Overrides for Balanced theme */
        body.theme-balanced {
            --bg-primary: #e7e9eb;
            --bg-secondary: #2E3B4E;
            --bg-card: #d7d9db;
            --bg-card-secondary: #e2e8f0;
            --text-primary: #1f2937;
            --text-secondary: #4b5563;
            --text-heading: #f9fafb; /* Added for header consistency */
            --text-on-dark: #FFFFFF;
            --text-on-accent: #FFFFFF; /* Added for header consistency */
            --accent-blue: #4f46e5;
            --border-color: #cbd5e1;
        }

        /* Overrides for Dark theme */
        body.theme-dark {
            --bg-primary: #121212;
            --bg-secondary: #2A2A40;
            --bg-card: #1e1e1e;
            --bg-card-secondary: #374151;
            --text-primary: #e0e0e0;
            --text-secondary: #b0b0b0;
            --text-heading: #e0e0e0; /* Added for header consistency */
            --text-on-dark: #EAEAEA;
            --text-on-accent: #FFFFFF; /* Added for header consistency */
            --accent-blue: #4A90E2;
            --border-color: #424242;
        }

        /* --- SEMANTIC CLASSES FROM MAIN PAGE --- */
        body {
            font-family: 'Inter', sans-serif;
            transition: background-color 0.3s ease, color 0.3s ease;
            background-color: var(--bg-primary);
        }

        .card-bg { background-color: var(--bg-card); transition: background-color 0.3s ease; }
        .card-secondary-bg { background-color: var(--bg-card-secondary); transition: background-color 0.3s ease; }
        .text-primary { color: var(--text-primary); }
        .text-secondary { color: var(--text-secondary); }
        .text-accent { color: var(--accent-blue); }
        .btn-primary { background-color: var(--accent-blue); color: white; transition: background-color 0.3s ease; }
        .btn-secondary-themed { background-color: var(--bg-card-secondary); color: var(--text-primary); transition: background-color 0.3s ease, color 0.3s ease; }
        .border-themed { border-color: var(--border-color); }
        
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
        .mobile-menu-button { color: var(--text-primary); transition: color 0.3s ease; }
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
<body>
    <form id="form1" runat="server">
        
        <!-- HEADER MARKUP START -->
        <header class="header">
            <nav class="nav">
                <div class="logo">
                    <a href="Home.aspx" class="logo-text">HireHeaven</a>
                </div>

                <div class="nav-controls-mobile">
                   
                     <button id="theme-toggle" class="theme-toggle-btn-new">
                        <svg id="theme-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12 2.25a.75.75 0 01.75.75v2.25a.75.75 0 01-1.5 0V3a.75.75 0 01.75-.75zM7.5 12a4.5 4.5 0 119 0 4.5 4.5 0 01-9 0zM18.75 5.75a.75.75 0 01.53.22l1.5 1.5a.75.75 0 01-1.06 1.06l-1.5-1.5a.75.75 0 01.53-1.28zM12 18a.75.75 0 01.75.75v2.25a.75.75 0 01-1.5 0V18a.75.75 0 01.75-.75zM5.75 18.75a.75.75 0 01.53-.22l1.5 1.5a.75.75 0 01-1.06 1.06l-1.5-1.5a.75.75 0 01-.53-1.28zM3 12a.75.75 0 01.75-.75h2.25a.75.75 0 010 1.5H3.75A.75.75 0 013 12zM18 12a.75.75 0 01.75-.75h2.25a.75.75 0 010 1.5H18.75A.75.75 0 0118 12zM5.75 5.25a.75.75 0 011.06 0l1.5 1.5a.75.75 0 01-1.06 1.06l-1.5-1.5a.75.75 0 010-1.06z" /></svg>
                    </button>
                    <button id="mobile-menu-button" class="mobile-menu-button">
                        <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" /></svg>
                    </button>
                </div>
            </nav>

            <div id="mobile-menu" class="mobile-menu">
               
            </div>
        </header>
        <!-- HEADER MARKUP END -->

        <main class="container mx-auto p-6">
            <div class="mb-8">
                <h1 class="text-3xl font-bold text-primary">Welcome back, Ronit!</h1>
                <div class="mt-2">
                    <p class="text-secondary mb-1">Profile Completion: 60%</p>
                    <div class="w-full progress-bar-bg rounded-full h-2.5">
                        <div class="progress-bar-fill h-2.5 rounded-full" style="width: 60%"></div>
                    </div>
                    <p class="text-sm text-accent mt-1">Add more skills to get better job recommendations.</p>
                </div>
            </div>

            <div class="grid grid-cols-1 lg:grid-cols-4 gap-8">
                <aside class="lg:col-span-1 space-y-6">
                    <div class="card-bg p-5 rounded-lg shadow-md text-center border">
    <asp:Image ID="imgProfile" runat="server" CssClass="w-24 h-24 rounded-full mx-auto mb-4 border-4" />
    <asp:Label ID="lblUserName" runat="server" CssClass="text-xl font-bold text-primary"></asp:Label>
    <br />
    <asp:Label ID="lblFullName" runat="server" CssClass="text-secondary"></asp:Label>
    <br />
    <asp:Label ID="lblQualification" runat="server" CssClass="text-sm text-accent"></asp:Label>
    <div class="mt-2 text-xs">
        <span class="card-secondary-bg text-secondary px-2 py-1 rounded-full">C#</span>
        <span class="card-secondary-bg text-secondary px-2 py-1 rounded-full">ASP.NET</span>
        <span class="card-secondary-bg text-secondary px-2 py-1 rounded-full">SQL</span>
    </div>
    <p class="text-sm mt-3 text-green-400">Resume Uploaded</p>
</div>


                    <div class="card-bg p-5 rounded-lg shadow-md space-y-3 border">
                        <asp:HyperLink NavigateUrl="~/Jobs.aspx" Text="🔎 Find Jobs" runat="server" CssClass="block w-full text-center py-2.5 btn-primary hover:opacity-90 rounded-lg font-semibold transition-colors" />
                        <asp:HyperLink NavigateUrl="~/MyApplications.aspx" Text="📄 My Applications" runat="server" CssClass="block w-full text-center py-2.5 btn-secondary-themed hover:opacity-80 rounded-lg font-medium transition-colors" />
                    </div>
                </aside>

                <div class="lg:col-span-3 space-y-8">
                    <div class="card-bg p-6 rounded-lg shadow-md border">
                        <h3 class="text-2xl font-bold text-primary mb-4">Recommended For You</h3>
                        <div class="space-y-4">
                            <asp:Repeater ID="rptRecommendedJobs" runat="server">
                                <ItemTemplate>
                                    <div class="p-4 card-secondary-bg rounded-lg flex items-center justify-between gap-4">
                                        <div class="flex items-center gap-4">
                                            
                                            <div>
                                                <h4 class="font-bold text-primary"><%# Eval("JobTitle") %></h4>
                                                <p class="text-sm text-secondary"><%# Eval("Company") %> • <%# Eval("Location") %></p>
                                            </div>
                                        </div>
                                        <asp:HyperLink NavigateUrl='<%# "JobDetails.aspx?JobID=" + Eval("JobID") %>' Text="Apply" runat="server" CssClass="px-4 py-2 btn-primary hover:opacity-90 rounded-lg text-sm font-semibold transition-colors" />
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                    <div class="card-bg p-6 rounded-lg shadow-md border">
                        <div class="flex justify-between items-center mb-4">
                            <h3 class="text-2xl font-bold text-primary">Recent Applications</h3>
                            <asp:HyperLink NavigateUrl="~/MyApplications.aspx" Text="View All" runat="server" CssClass="text-sm text-accent hover:underline" />
                        </div>
                        <div class="overflow-x-auto">
                            <asp:Repeater ID="rptRecentApplications" runat="server" OnItemDataBound="rptRecentApplications_ItemDataBound">
                                <HeaderTemplate>
                                    <table class="w-full text-sm text-left">
                                        <thead class="text-xs text-secondary uppercase card-secondary-bg">
                                            <tr>
                                                <th scope="col" class="px-6 py-3">Job Title</th>
                                                <th scope="col" class="px-6 py-3">Company</th>
                                                <th scope="col" class="px-6 py-3">Applied Date</th>
                                                <th scope="col" class="px-6 py-3">Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr class="border-b" style="border-color: var(--border-color);">
                                        <th scope="row" class="px-6 py-4 font-medium text-primary whitespace-nowrap"><%# Eval("JobTitle") %></th>
                                        <td class="px-6 py-4 text-secondary"><%# Eval("Company") %></td>
                                        <td class="px-6 py-4 text-secondary"><%# Eval("AppliedDate", "{0:dd MMM yyyy}") %></td>
                                        <td class="px-6 py-4">
                                            <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>' CssClass="px-2 py-1 rounded text-xs font-medium"></asp:Label>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                        </tbody>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                    <div class="card-bg p-6 rounded-lg shadow-md border">
                        <h3 class="text-2xl font-bold text-primary mb-4">Career Insights</h3>
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                            <a href="#" class="block p-4 card-secondary-bg rounded-lg hover:opacity-80 transition-opacity">
                                <h4 class="font-semibold text-primary">Top 5 Interview Tips</h4>
                                <p class="text-sm text-secondary mt-1">Ace your next interview with these expert tips.</p>
                            </a>
                            <a href="#" class="block p-4 card-secondary-bg rounded-lg hover:opacity-80 transition-opacity">
                                <h4 class="font-semibold text-primary">In-Demand Skills for 2025</h4>
                                <p class="text-sm text-secondary mt-1">Stay ahead of the curve by learning what employers want.</p>
                            </a>
                            <a href="#" class="block p-4 card-secondary-bg rounded-lg hover:opacity-80 transition-opacity">
                                <h4 class="font-semibold text-primary">How to Build a Great Resume</h4>
                                <p class="text-sm text-secondary mt-1">Craft a resume that gets noticed by recruiters.</p>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <uc:Footer runat="server" ID="Footer" />
    </form>

    <script>
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
                body.className = theme; // This replaces all classes, which is what we want for themes
                localStorage.setItem('theme', theme);
                if (theme === 'theme-dark') {
                    themeIcon.innerHTML = sunIcon; // Show sun icon in dark mode to switch to light
                } else {
                    themeIcon.innerHTML = moonIcon; // Show moon icon in light/balanced mode to switch to dark
                }
            };

            // Load theme from localStorage or default to balanced
            const savedTheme = localStorage.getItem('theme') || 'theme-balanced';
            setTheme(savedTheme);

            // Toggle theme on button click
            themeToggleBtn.addEventListener('click', () => {
                let currentTheme = body.className;
                if (currentTheme === 'theme-balanced') {
                    setTheme('theme-dark');
                } else if (currentTheme === 'theme-dark') {
                    setTheme('theme-light');
                } else {
                    // Default back to balanced after light
                    setTheme('theme-balanced');
                }
            });

            // Toggle mobile menu on button click
            mobileMenuBtn.addEventListener('click', () => {
                mobileMenu.classList.toggle('open');
            });
        })
    </script>
</body>
</html>
