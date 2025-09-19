<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminDashboard.aspx.cs" Inherits="AdminDashboard" %>
<%@ Register Src="Footer.ascx" TagPrefix="uc" TagName="Footer" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Dashboard</title>
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

        /* Semantic classes from Admin Page */
        body {
            font-family: 'Inter', sans-serif;
            transition: background-color 0.3s ease, color 0.3s ease;
            background-color: var(--bg-primary);
        }

        .card-bg {
            background-color: var(--bg-card);
            transition: background-color 0.3s ease;
        }
        
        .card-secondary-bg {
            background-color: var(--bg-card-secondary);
            transition: background-color 0.3s ease;
        }

        .text-primary { color: var(--text-primary); }
        .text-secondary { color: var(--text-secondary); }
        
        .form-input {
            background-color: var(--bg-card-secondary);
            border-color: var(--border-color);
            color: var(--text-primary);
            transition: background-color 0.3s ease, border-color 0.3s ease, color 0.3s ease;
        }

        .border-themed { border-color: var(--border-color); }

        /* --- STYLES FROM HEADER CONTROL --- */

        /* General Header Styling */
        .header {
            background-color: var(--bg-secondary);
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            transition: background-color 0.3s ease;
        }

        .nav {
            max-width: 80rem;
            margin: 0 auto;
            padding: 1rem 1rem;
            display: flex;
            align-items: center;
            justify-content:space-between;
            flex-wrap: wrap;
        }

        .logo-text {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--text-heading);
            transition: color 0.3s ease;
        }

        .nav-links-desktop {
            display: none;
        }

        @media (min-width: 768px) {
            .nav-links-desktop {
                display: flex;
                flex-grow: 1;
                align-items: center;
                justify-content: center;
                gap: 1rem;
            }
        }

        .nav-link {
            color: var(--text-primary);
            padding: 0.5rem 0.75rem;
            border-radius: 0.375rem;
            font-weight: 500;
            transition: color 0.2s ease-in-out;
        }

        .nav-link:hover {
            color: var(--accent-blue);
        }

        .auth-buttons-desktop {
            display: none;
            align-items: center;
            gap: 1rem;
        }

        @media (min-width: 768px) {
            .auth-buttons-desktop {
                display: flex;
            }
        }

        .btn-login {
            color: var(--text-primary);
            padding: 0.5rem 0.75rem;
            border-radius: 0.375rem;
            font-weight: 500;
            transition: color 0.2s ease-in-out;
        }

        .btn-login:hover {
            color: var(--accent-blue);
        }

        .btn-register {
            padding: 0.5rem 1rem;
            border: 2px solid var(--accent-blue);
            font-size: 0.875rem;
            font-weight: 500;
            border-radius: 0.375rem;
            color: var(--accent-blue);
            background-color: transparent;
            transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
        }

        .btn-register:hover {
            background-color: var(--accent-blue);
            color: var(--text-on-accent);
        }

        .nav-controls-mobile {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .mobile-menu-button {
            color: var(--text-primary);
            transition: color 0.3s ease;
        }

        @media (min-width: 768px) {
            .nav-controls-mobile .mobile-menu-button {
                display: none;
            }
        }

        .mobile-menu {
            display: none;
        }

        .mobile-menu.open {
            display: block;
        }

        .mobile-menu-links {
            padding: 0.5rem 0.5rem;
            display: flex;
            flex-direction: column;
            gap: 0.25rem;
            background-color: var(--bg-secondary);
            transition: background-color 0.3s ease;
        }

        .mobile-link {
            display: block;
            padding: 0.5rem 0.75rem;
            border-radius: 0.375rem;
            font-size: 1rem;
            font-weight: 500;
            color: var(--text-primary);
            transition: color 0.3s ease, background-color 0.3s ease;
        }

        .mobile-link:hover {
            color: var(--accent-blue);
            background-color: var(--bg-primary);
        }

        .mobile-register {
            display: block;
            width: 100%;
            text-align: center;
            padding: 0.5rem 0.75rem;
            border-radius: 0.375rem;
            font-size: 1rem;
            font-weight: 500;
            color: var(--text-on-accent);
            background-color: var(--accent-blue);
            transition: background-color 0.3s ease;
        }

        .mobile-register:hover {
            opacity: 0.9;
        }

        .theme-toggle-btn-new {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 0.5rem;
            border-radius: 9999px; /* Pill shape */
            cursor: pointer;
            color: var(--text-primary);
            background: transparent;
            border: none;
            transition: color 0.2s ease-in-out;
        }

        .theme-toggle-btn-new:hover {
            color: var(--accent-blue);
        }

        .theme-toggle-btn-new svg {
            fill: currentColor;
            width: 1.5rem;
            height: 1.5rem;
        }

        /* --- THEME OVERRIDES FOR HEADER --- */
        /* This ensures header elements are visible on dark backgrounds like in the balanced theme */
        body.theme-balanced .header .logo-text,
        body.theme-balanced .header .nav-link,
        body.theme-balanced .header .btn-login,
        body.theme-balanced .header .mobile-menu-button,
        body.theme-balanced .header .theme-toggle-btn-new {
            color: #f9fafb; /* A light, almost white color */
        }

        body.theme-balanced .header .nav-link:hover,
        body.theme-balanced .header .btn-login:hover {
            color: #a5b4fc; /* A lighter accent color for hover */
        }

        body.theme-balanced .header .btn-register {
            color: #f9fafb;
            border-color: #f9fafb;
        }
        
        body.theme-balanced .header .btn-register:hover {
            background-color: #f9fafb;
            color: var(--bg-secondary); /* Invert colors on hover */
        }
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
                <div class="mobile-menu-links">
                    
                </div>
            </div>
        </header>
        <!-- HEADER MARKUP END -->


        <main class="container mx-auto p-6">
            <!-- Page Header -->
            <div class="mb-8">
                <h1 class="text-3xl font-bold text-primary">Admin Dashboard</h1>
                <p class="text-secondary mt-1">Welcome, Admin! Monitor and manage the portal activities here.</p>
            </div>

            <!-- Quick Stats -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
                <div class="card-bg p-5 rounded-lg shadow-md border border-themed">
                    <h3 class="text-secondary text-sm font-medium">Total Employers</h3>
                    <p class="text-3xl font-bold text-primary mt-1"><asp:Literal ID="litTotalEmployers" runat="server">0</asp:Literal></p>
                </div>
                <div class="card-bg p-5 rounded-lg shadow-md border border-themed">
                    <h3 class="text-secondary text-sm font-medium">Total Job Seekers</h3>
                    <p class="text-3xl font-bold text-primary mt-1"><asp:Literal ID="litTotalSeekers" runat="server">0</asp:Literal></p>
                </div>
                <div class="card-bg p-5 rounded-lg shadow-md border border-themed">
                    <h3 class="text-secondary text-sm font-medium">Total Jobs Posted</h3>
                    <p class="text-3xl font-bold text-primary mt-1"><asp:Literal ID="litTotalJobs" runat="server">0</asp:Literal></p>
                </div>
                <div class="card-bg p-5 rounded-lg shadow-md border border-themed">
                    <h3 class="text-secondary text-sm font-medium">Total Applications</h3>
                    <p class="text-3xl font-bold text-primary mt-1"><asp:Literal ID="litTotalApplications" runat="server">0</asp:Literal></p>
                </div>
            </div>

            <asp:Panel ID="pnlData" runat="server">
                 <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
                    <!-- Main Content: Job & User Management -->
                    <div class="lg:col-span-2 space-y-8">
                        <!-- Job Management -->
                        <div class="card-bg p-6 rounded-lg shadow-md border border-themed">
                            <div class="flex justify-between items-center mb-4">
                                <h3 class="text-2xl font-bold text-primary">Job Management</h3>
                                <asp:DropDownList ID="ddlJobStatusFilter" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Filter_Changed" CssClass="form-input border rounded-lg p-2 text-sm">
                                    <asp:ListItem Text="All Jobs" Value="All" />
                                    <asp:ListItem Text="Pending Approval" Value="Pending Approval" />
                                    <asp:ListItem Text="Active" Value="Active" />
                                    <asp:ListItem Text="Closed" Value="Closed" />
                                </asp:DropDownList>
                            </div>
                            <div class="overflow-x-auto">
                                <asp:Repeater ID="rptJobs" runat="server" OnItemCommand="rptJobs_ItemCommand">
                                    <HeaderTemplate>
                                        <table class="w-full text-sm text-left"><thead class="text-xs text-secondary uppercase card-secondary-bg"><tr><th class="px-6 py-3">Job Title</th><th class="px-6 py-3">Company</th><th class="px-6 py-3">Status</th><th class="px-6 py-3 text-center">Actions</th></tr></thead><tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr class="border-b border-themed">
                                            <td class="px-6 py-4 font-medium text-primary"><%# Eval("JobTitle") %></td>
                                            <td class="px-6 py-4 text-secondary"><%# Eval("Company") %></td>
                                            <td class="px-6 py-4 text-secondary"><span class='<%# GetStatusCssClass(Eval("Status")) %>'><%# Eval("Status") %></span></td>
                                            <td class="px-6 py-4 text-center space-x-2">
                                                <asp:LinkButton Visible='<%# Eval("Status").ToString() == "Pending Approval" %>' ID="btnApproveJob" runat="server" Text="Approve" CommandName="ApproveJob" CommandArgument='<%# Eval("JobID") %>' CssClass="font-medium text-green-500 hover:underline" />
                                                <asp:LinkButton Visible='<%# Eval("Status").ToString() == "Pending Approval" %>' ID="btnRejectJob" runat="server" Text="Reject" CommandName="RejectJob" CommandArgument='<%# Eval("JobID") %>' CssClass="font-medium text-red-500 hover:underline" />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate></tbody></table></FooterTemplate>
                                </asp:Repeater>
                            </div>
                        </div>

                        <!-- User Management -->
                        <div class="card-bg p-6 rounded-lg shadow-md border border-themed">
                             <h3 class="text-2xl font-bold text-primary mb-4">User Management</h3>
                             <div class="overflow-x-auto">
                                <asp:Repeater ID="rptUsers" runat="server" OnItemCommand="rptUsers_ItemCommand">
                                    <HeaderTemplate>
                                        <table class="w-full text-sm text-left"><thead class="text-xs text-secondary uppercase card-secondary-bg"><tr><th class="px-6 py-3">User Name</th><th class="px-6 py-3">Role</th><th class="px-6 py-3">Status</th><th class="px-6 py-3 text-center">Actions</th></tr></thead><tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                         <tr class="border-b border-themed">
                                            <td class="px-6 py-4 font-medium text-primary"><%# Eval("Name") %></td>
                                            <td class="px-6 py-4 text-secondary"><%# Eval("Role") %></td>
                                            <td class="px-6 py-4 text-secondary"><span class='<%# GetStatusCssClass(Eval("Status")) %>'><%# Eval("Status") %></span></td>
                                            <td class="px-6 py-4 text-center space-x-2">
                                                <asp:LinkButton Visible='<%# Eval("Status").ToString() != "Blocked" %>' ID="btnBlockUser" runat="server" Text="Block" CommandName="BlockUser" CommandArgument='<%# Eval("UserID") %>' CssClass="font-medium text-red-500 hover:underline" />
                                                <asp:LinkButton Visible='<%# Eval("Status").ToString() == "Blocked" %>' ID="btnUnblockUser" runat="server" Text="Unblock" CommandName="UnblockUser" CommandArgument='<%# Eval("UserID") %>' CssClass="font-medium text-green-500 hover:underline" />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate></tbody></table></FooterTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                    <!-- Sidebar: Notifications & Settings -->
                    <aside class="lg:col-span-1 space-y-6">
                        <div class="card-bg p-5 rounded-lg shadow-md border border-themed">
                            <h3 class="text-lg font-bold text-primary mb-3">Notifications</h3>
                            <ul class="space-y-2 text-sm">
                                <li class="p-3 card-secondary-bg rounded-md text-secondary">5 new employers registered today.</li>
                                <li class="p-3 card-secondary-bg rounded-md text-secondary">10 jobs are pending your approval.</li>
                                <li class="p-3 card-secondary-bg rounded-md text-secondary">100 applications submitted this week.</li>
                            </ul>
                        </div>
                    </aside>
                </div>
            </asp:Panel>

            <!-- Empty State Panel -->
            <asp:Panel ID="pnlEmpty" runat="server" Visible="false" CssClass="text-center card-bg p-10 rounded-lg shadow-md border border-themed">
                <h3 class="text-2xl font-bold text-primary">No activity to display yet.</h3>
                <p class="text-secondary mt-2">Once users register and post jobs, their data will appear here for management.</p>
            </asp:Panel>
        </main>

        <uc:Footer runat="server" ID="Footer" />
        
        <!-- SCRIPT FROM HEADER CONTROL -->
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
    </form>
</body>
</html>
