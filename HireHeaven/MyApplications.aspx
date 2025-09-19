<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyApplications.aspx.cs" Inherits="MyApplications" %>
<%@ Register Src="Footer.ascx" TagPrefix="uc" TagName="Footer" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-g" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>My Applications - HireHeaven</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />
    <style>
        /* CSS variables and semantic classes for a consistent, site-wide theming system. */
        
        /* Default variables for Light theme */
        body.theme-light, body {
            --bg-primary: #f8f9fa;
            --bg-secondary: #FFFFFF;
            --bg-card: #FFFFFF;
            --text-primary: #2C2C2C;
            --text-secondary: #6c757d;
            --text-heading: #2C2C2C; /* For header logo */
            --text-on-dark: #343a40;
            --text-on-accent: #FFFFFF; /* For buttons */
            --accent-blue: #0d6efd;
            --accent-blue-light: #e0e7ff;
            --border-color: #e5e7eb; /* Lighter border for light theme */
        }

        /* Overrides for Balanced theme */
        body.theme-balanced {
            --bg-primary: #e7e9eb;
            --bg-secondary: #2E3B4E;
            --bg-card: #f0f2f4;
            --text-primary: #1f2937;
            --text-secondary: #4b5563;
            --text-heading: #f9fafb; /* For header logo */
            --text-on-dark: #FFFFFF;
            --text-on-accent: #FFFFFF; /* For buttons */
            --accent-blue: #4f46e5;
            --accent-blue-light: #e2e8f0;
            --border-color: #cbd5e1;
        }

        /* Overrides for Dark theme */
        body.theme-dark {
            --bg-primary: #121212;
            --bg-secondary: #1e1e1e; /* Darker secondary for header */
            --bg-card: #2a2a2a; /* Card background for dark theme */
            --text-primary: #e0e0e0;
            --text-secondary: #b0b0b0;
            --text-heading: #e0e0e0; /* For header logo */
            --text-on-dark: #EAEAEA;
            --text-on-accent: #FFFFFF; /* For buttons */
            --accent-blue: #4A90E2;
            --accent-blue-light: #1f2937;
            --border-color: #424242;
        }

        /* --- SEMANTIC CLASSES --- */
        body {
            font-family: 'Inter', sans-serif;
            transition: background-color 0.3s ease, color 0.3s ease;
            background-color: var(--bg-primary);
            color: var(--text-primary);
        }
        .card-bg { background-color: var(--bg-card); border: 1px solid var(--border-color); transition: background-color 0.3s ease, border-color 0.3s ease; }
        .text-primary { color: var(--text-primary); }
        .text-secondary { color: var(--text-secondary); }
        .text-accent { color: var(--accent-blue); }
        .btn-primary { background-color: var(--accent-blue); color: var(--text-on-accent); transition: background-color 0.3s ease; }
        .btn-secondary-themed { background-color: var(--bg-secondary); color: var(--text-primary); border: 1px solid var(--border-color); transition: background-color 0.3s ease, color 0.3s ease, border-color 0.3s ease; }
        .form-input { background-color: var(--bg-card); border: 1px solid var(--border-color); color: var(--text-primary); transition: background-color 0.3s ease, border-color 0.3s ease, color 0.3s ease; }
        
        /* --- HEADER STYLES --- */
        .header { background-color: var(--bg-secondary); box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06); transition: background-color 0.3s ease; }
        .nav { max-width: 80rem; margin: 0 auto; padding: 1rem 1rem; display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; }
        .logo-text { font-size: 1.5rem; font-weight: 700; color: var(--text-heading); transition: color 0.3s ease; text-decoration: none; }
        .nav-links-desktop { display: none; }
        @media (min-width: 768px) { .nav-links-desktop { display: flex; flex-grow: 1; align-items: center; justify-content: center; gap: 1rem; } }
        .nav-link { color: var(--text-primary); padding: 0.5rem 0.75rem; border-radius: 0.375rem; font-weight: 500; transition: color 0.2s ease-in-out; text-decoration: none; }
        .nav-link:hover { color: var(--accent-blue); }
        .auth-buttons-desktop { display: none; align-items: center; gap: 1rem; }
        @media (min-width: 768px) { .auth-buttons-desktop { display: flex; } }
        .btn-login { color: var(--text-primary); padding: 0.5rem 0.75rem; border-radius: 0.375rem; font-weight: 500; transition: color 0.2s ease-in-out; text-decoration: none; }
        .btn-login:hover { color: var(--accent-blue); }
        .btn-register { padding: 0.5rem 1rem; border: 2px solid var(--accent-blue); font-size: 0.875rem; font-weight: 500; border-radius: 0.375rem; color: var(--accent-blue); background-color: transparent; transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out; text-decoration: none; }
        .btn-register:hover { background-color: var(--accent-blue); color: var(--text-on-accent); }
        .nav-controls-mobile { display: flex; align-items: center; gap: 1rem; }
        .mobile-menu-button { color: var(--text-primary); transition: color 0.3s ease; background: transparent; border: none; cursor: pointer; }
        @media (min-width: 768px) { .nav-controls-mobile .mobile-menu-button { display: none; } }
        .mobile-menu { display: none; }
        .mobile-menu.open { display: block; }
        .mobile-menu-links { padding: 0.5rem 0.5rem; display: flex; flex-direction: column; gap: 0.25rem; background-color: var(--bg-secondary); transition: background-color 0.3s ease; }
        .mobile-link { display: block; padding: 0.5rem 0.75rem; border-radius: 0.375rem; font-size: 1rem; font-weight: 500; color: var(--text-primary); transition: color 0.3s ease, background-color 0.3s ease; text-decoration: none; }
        .mobile-link:hover { color: var(--accent-blue); background-color: var(--bg-primary); }
        .mobile-register { display: block; width: 100%; text-align: center; padding: 0.5rem 0.75rem; border-radius: 0.375rem; font-size: 1rem; font-weight: 500; color: var(--text-on-accent); background-color: var(--accent-blue); transition: background-color 0.3s ease; text-decoration: none; }
        .mobile-register:hover { opacity: 0.9; }
        .theme-toggle-btn-new { display: flex; align-items: center; justify-content: center; padding: 0.5rem; border-radius: 9999px; cursor: pointer; color: var(--text-primary); background: transparent; border: none; transition: color 0.2s ease-in-out; }
        .theme-toggle-btn-new:hover { color: var(--accent-blue); }
        .theme-toggle-btn-new svg { fill: currentColor; width: 1.5rem; height: 1.5rem; }

        /* Theme Overrides for Header */
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

        <div>
            <a href="Home.aspx" class="text-secondary hover:text-primary text-2xl font-bold">&times;</a>
        </div>
    </nav>
</header>
        <!-- HEADER MARKUP END -->

        <main class="container mx-auto p-4 md:p-6">
            <div class="text-center my-8 md:my-12">
                <h1 class="text-4xl md:text-5xl font-extrabold mb-2 text-accent">My Applications</h1>
                <p class="text-lg text-secondary max-w-2xl mx-auto">Track the jobs you have applied for and check their status here.</p>
            </div>

            <div class="card-bg p-4 md:p-6 rounded-lg shadow-md mb-8">
                <div class="grid grid-cols-1 md:grid-cols-3 gap-4 items-center">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-input w-full p-3 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500" placeholder="Search job title or company..."></asp:TextBox>
                    
                    <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Filter_Changed" CssClass="form-input w-full p-3 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500">
                        <asp:ListItem Text="All Statuses" Value="All" />
                        <asp:ListItem Text="Pending" Value="Pending" />
                        <asp:ListItem Text="Under Review" Value="Under Review" />
                        <asp:ListItem Text="Shortlisted" Value="Shortlisted" />
                        <asp:ListItem Text="Rejected" Value="Rejected" />
                        <asp:ListItem Text="Hired" Value="Hired" />
                    </asp:DropDownList>
                    
                    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="Filter_Changed" CssClass="btn-primary w-full p-3 font-bold rounded-lg hover:opacity-90 transition-colors duration-200" />
                </div>
            </div>

            <asp:Panel ID="pnlApplications" runat="server">
                <div class="space-y-4">
                    <asp:Repeater ID="rptApplications" runat="server" OnItemDataBound="rptApplications_ItemDataBound">
                        <ItemTemplate>
                            <div class="card-bg p-5 rounded-lg shadow-md flex flex-col md:flex-row items-start md:items-center justify-between gap-4">
                                <div class="flex-grow">
                                    <h3 class="text-xl font-bold text-accent">
                                        <asp:HyperLink ID="hlJobTitle" runat="server" Text='<%# Eval("JobTitle") %>' NavigateUrl='<%# "JobDetails.aspx?JobID=" + Eval("JobID") %>' CssClass="hover:underline"></asp:HyperLink>
                                    </h3>
                                    <p class="text-secondary"><%# Eval("Company") %> &bull; <%# Eval("Location") %></p>
                                    <p class="text-sm text-secondary mt-1">Applied on: <%# Eval("AppliedDate", "{0:dd MMM yyyy}") %></p>
                                </div>
                                <div class="flex items-center gap-4 mt-3 md:mt-0 w-full md:w-auto">
                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>' CssClass="font-semibold px-3 py-1 rounded-full text-sm w-full text-center md:w-auto"></asp:Label>
                                    <asp:HyperLink ID="hlViewJob" runat="server" Text="View Job" NavigateUrl='<%# "JobDetails.aspx?JobID=" + Eval("JobID") %>' CssClass="btn-secondary-themed px-4 py-2 hover:opacity-80 rounded-lg text-sm font-medium transition-colors hidden md:inline-block"></asp:HyperLink>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </asp:Panel>

            <asp:Panel ID="pnlEmpty" runat="server" Visible="false" CssClass="text-center card-bg p-10 rounded-lg shadow-md">
                <h3 class="text-2xl font-bold text-primary">You haven’t applied for any jobs yet.</h3>
                <p class="text-secondary mt-2 mb-6">Start your job search today and find your dream career!</p>
                <asp:Button ID="btnBrowseJobs" runat="server" Text="Browse Jobs" OnClick="btnBrowseJobs_Click" CssClass="btn-primary px-8 py-3 font-bold rounded-lg hover:opacity-90 transition-colors duration-200" />
            </asp:Panel>

            <div class="card-bg p-6 rounded-lg shadow-md mt-8">
                <h4 class="text-lg font-bold text-primary mb-3">Status Legend</h4>
                <ul class="text-sm text-secondary space-y-2">
                    <li><span class="inline-block w-3 h-3 rounded-full mr-2 bg-yellow-900"></span><span class="font-semibold text-primary">Pending:</span> Your application has been received and is awaiting review.</li>
                    <li><span class="inline-block w-3 h-3 rounded-full mr-2 bg-blue-900"></span><span class="font-semibold text-primary">Under Review:</span> An employer is currently reviewing your application.</li>
                    <li><span class="inline-block w-3 h-3 rounded-full mr-2 bg-green-900"></span><span class="font-semibold text-primary">Shortlisted:</span> Congratulations! You've been selected for the next step.</li>
                    <li><span class="inline-block w-3 h-3 rounded-full mr-2 bg-red-900"></span><span class="font-semibold text-primary">Rejected:</span> You were not selected for this position.</li>
                    <li><span class="inline-block w-3 h-3 rounded-full mr-2 bg-purple-900"></span><span class="font-semibold text-primary">Hired:</span> You got the job!</li>
                </ul>
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

            const sunIcon = `<path d="M12 2.25a.75.75 0 01.75.75v2.25a.75.75 0 01-1.5 0V3a.75.75 0 01.75-.75zM7.5 12a4.5 4.5 0 119 0 4.5 4.5 0 01-9 0zM18.75 5.75a.75.75 0 01.53.22l1.5 1.5a.75.75 0 01-1.06 1.06l-1.5-1.5a.75.75 0 01.53-1.28zM12 18a.75.75 0 01.75.75v2.25a.75.75 0 01-1.5 0V18a.75.75 0 01.75-.75zM5.75 18.75a.75.75 0 01.53-.22l1.5 1.5a.75.75 0 01-1.06 1.06l-1.5-1.5a.75.75 0 01-.53-1.28zM3 12a.75.75 0 01.75-.75h2.25a.75.75 0 010 1.5H3.75A.75.75 0 013 12zM18 12a.75.75 0 01.75-.75h2.25a.75.75 0 010 1.5H18.75A.75.75 0 0118 12zM5.75 5.25a.75.75 0 011.06 0l1.5 1.5a.75.75 0 01-1.06 1.06l-1.5-1.5a.75.75 0 010-1.06z" />`;
            const moonIcon = `<path fill-rule="evenodd" d="M9.528 1.718a.75.75 0 01.162.819A8.97 8.97 0 009 6a9 9 0 009 9 8.97 8.97 0 003.463-.69.75.75 0 01.981.98 10.503 10.503 0 01-9.694 6.46c-5.799 0-10.5-4.701-10.5-10.5 0-3.833 2.067-7.172 5.168-9.002a.75.75 0 01.819.162z" clip-rule="evenodd" />`;

            const setTheme = (theme) => {
                body.className = theme;
                localStorage.setItem('theme', theme);
                if (themeIcon) {
                    if (theme === 'theme-dark') {
                        themeIcon.innerHTML = sunIcon;
                    } else {
                        themeIcon.innerHTML = moonIcon;
                    }
                }
            };

            const savedTheme = localStorage.getItem('theme') || 'theme-balanced';
            setTheme(savedTheme);

            if (themeToggleBtn) {
                themeToggleBtn.addEventListener('click', () => {
                    let currentTheme = body.className;
                    if (currentTheme === 'theme-balanced') {
                        setTheme('theme-dark');
                    } else if (currentTheme === 'theme-dark') {
                        setTheme('theme-light');
                    } else {
                        setTheme('theme-balanced');
                    }
                });
            }

            if (mobileMenuBtn) {
                mobileMenuBtn.addEventListener('click', () => {
                    if (mobileMenu) {
                        mobileMenu.classList.toggle('open');
                    }
                });
            }
        });
    </script>
</body>
</html>
