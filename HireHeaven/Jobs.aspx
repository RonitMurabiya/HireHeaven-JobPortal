<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Jobs.aspx.cs" Inherits="Jobs" %>
<%@ Register Src="Footer.ascx" TagPrefix="uc" TagName="Footer" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Find Your Next Career Opportunity</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
    
    <style>
        /* CSS variables and semantic classes for consistent theming. */
        
        /* Default variables for Light theme */
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

        /* Overrides for Balanced theme */
        body.theme-balanced {
            --bg-primary: #e7e9eb;
            --bg-secondary: #2E3B4E;
            --bg-card: #d7d9db;
            --text-primary: #1f2937;
            --text-secondary: #4b5563;
            --text-heading: #f9fafb;
            --text-on-dark: #FFFFFF;
            --text-on-accent: #FFFFFF;
            --accent-blue: #4f46e5;
            --accent-blue-light: #e2e8f0;
            --border-color: #cbd5e1;
        }

        /* Overrides for Dark theme */
        body.theme-dark {
            --bg-primary: #121212;
            --bg-secondary: #2A2A40;
            --bg-card: #1e1e1e;
            --text-primary: #e0e0e0;
            --text-secondary: #b0b0b0;
            --text-heading: #e0e0e0;
            --text-on-dark: #EAEAEA;
            --text-on-accent: #FFFFFF;
            --accent-blue: #4A90E2;
            --accent-blue-light: #1f2937;
            --border-color: #424242;
        }

        /* --- SEMANTIC CLASSES FROM MAIN PAGE --- */
        body {
            font-family: 'Inter', sans-serif;
            transition: background-color 0.3s ease, color 0.3s ease;
            background-color: var(--bg-primary);
            color: var(--text-primary);
        }
        .card-bg { background-color: var(--bg-card); transition: background-color 0.3s ease; }
        .text-primary { color: var(--text-primary); transition: color 0.3s ease; }
        .text-secondary { color: var(--text-secondary); transition: color 0.3s ease; }
        .text-accent { color: var(--accent-blue); transition: color 0.3s ease; }
        .btn-primary { background-color: var(--accent-blue); color: var(--text-on-accent); transition: background-color 0.3s ease, color 0.3s ease; }
        .btn-secondary { background-color: var(--accent-blue-light); color: var(--accent-blue); transition: background-color 0.3s ease, color 0.3s ease; }
        .btn-secondary-border { border: 2px solid var(--accent-blue); color: var(--accent-blue); transition: border-color 0.3s ease, color 0.3s ease, background-color 0.3s ease; }
        .btn-secondary-border:hover { background-color: var(--accent-blue-light); }
        .border-base { border-color: var(--border-color); transition: border-color 0.3s ease; }

        input, select {
             background-color: var(--bg-card);
             border-color: var(--border-color);
             color: var(--text-primary);
             transition: background-color 0.3s ease, border-color 0.3s ease, color 0.3s ease;
        }
        
        /* --- STYLES FROM HEADER CONTROL --- */
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
<body class="text-gray-800">
    <form id="form1" runat="server">
        
        <!-- HEADER MARKUP START -->
        <header class="header">
            <nav class="nav">
                <div class="logo">
                    <a href="Home.aspx" class="logo-text">HireHeaven</a>
                </div>
                
                <div class="nav-controls-mobile">
                    <button id="theme-toggle" type="button" class="theme-toggle-btn-new">
                        <svg id="theme-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12 2.25a.75.75 0 01.75.75v2.25a.75.75 0 01-1.5 0V3a.75.75 0 01.75-.75zM7.5 12a4.5 4.5 0 119 0 4.5 4.5 0 01-9 0zM18.75 5.75a.75.75 0 01.53.22l1.5 1.5a.75.75 0 01-1.06 1.06l-1.5-1.5a.75.75 0 01.53-1.28zM12 18a.75.75 0 01.75.75v2.25a.75.75 0 01-1.5 0V18a.75.75 0 01.75-.75zM5.75 18.75a.75.75 0 01.53-.22l1.5 1.5a.75.75 0 01-1.06 1.06l-1.5-1.5a.75.75 0 01-.53-1.28zM3 12a.75.75 0 01.75-.75h2.25a.75.75 0 010 1.5H3.75A.75.75 0 013 12zM18 12a.75.75 0 01.75-.75h2.25a.75.75 0 010 1.5H18.75A.75.75 0 0118 12zM5.75 5.25a.75.75 0 011.06 0l1.5 1.5a.75.75 0 01-1.06 1.06l-1.5-1.5a.75.75 0 010-1.06z" /></svg>
                    </button>
                    <button id="mobile-menu-button" type="button" class="mobile-menu-button">
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

       <main class="container mx-auto p-6">
            <div class="text-center my-12">
                <h1 class="text-4xl md:text-5xl font-extrabold mb-2 text-accent">Find Your Next Career Opportunity</h1>
                <p class="text-lg text-secondary">Browse thousands of job openings and apply in just a few clicks.</p>
            </div>

            <!-- Search Box -->
            <div class="card-bg p-6 rounded-lg shadow-sm mb-8">
                <div class="flex flex-col md:flex-row gap-4 items-center">
                    <asp:TextBox ID="txtKeyword" runat="server" CssClass="flex-1 w-full md:w-auto p-3 border border-base rounded-lg" placeholder="Keyword (job title, company, skills)"></asp:TextBox>
                    <asp:DropDownList ID="ddlLocation" runat="server" CssClass="flex-1 w-full md:w-auto p-3 border border-base rounded-lg">
                        <asp:ListItem Text="All Locations" Value="All" />
                        <asp:ListItem Text="Ahmedabad, Gujarat" Value="Ahmedabad, Gujarat" />
                        <asp:ListItem Text="Mumbai, Maharashtra" Value="Mumbai, Maharashtra" />
                        <asp:ListItem Text="Delhi, NCR" Value="Delhi, NCR" />
                        <asp:ListItem Text="Bengaluru, Karnataka" Value="Bengaluru, Karnataka" />
                        <asp:ListItem Text="Remote" Value="Remote" />
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="flex-1 w-full md:w-auto p-3 border border-base rounded-lg">
                        <asp:ListItem Text="All Categories" Value="All" />
                        <asp:ListItem Text="IT" Value="IT" />
                        <asp:ListItem Text="Marketing" Value="Marketing" />
                        <asp:ListItem Text="Finance" Value="Finance" />
                        <asp:ListItem Text="HR" Value="HR" />
                    </asp:DropDownList>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="w-full md:w-auto px-6 py-3 btn-primary font-bold rounded-lg" />
                </div>
            </div>

            <!-- Layout with Sidebar & Jobs -->
            <div class="flex flex-col md:flex-row gap-8">
                <!-- Sidebar Filters -->
                <aside class="w-full md:w-1/4">
                    <div class="card-bg p-6 rounded-lg shadow-sm sticky top-6">
                        <h2 class="text-xl font-bold mb-4 border-b pb-2 text-primary">Filter Jobs</h2>
                        <div class="space-y-4">
                            <div>
                                <label class="font-semibold text-sm block mb-2 text-secondary">Job Type</label>
                                <asp:DropDownList ID="ddlJobType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlJobType_SelectedIndexChanged" CssClass="w-full p-2 border border-base rounded-md">
                                    <asp:ListItem Text="All" Value="All" />
                                    <asp:ListItem Text="Full-time" Value="Full-time" />
                                    <asp:ListItem Text="Part-time" Value="Part-time" />
                                    <asp:ListItem Text="Remote" Value="Remote" />
                                    <asp:ListItem Text="Internship" Value="Internship" />
                                </asp:DropDownList>
                            </div>
                            <div>
                                <label class="font-semibold text-sm block mb-2 text-secondary">Posted Date</label>
                                <asp:DropDownList ID="ddlDatePosted" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDatePosted_SelectedIndexChanged" CssClass="w-full p-2 border border-base rounded-md">
                                    <asp:ListItem Text="Anytime" Value="All" />
                                    <asp:ListItem Text="Today" Value="1" />
                                    <asp:ListItem Text="Last 7 days" Value="7" />
                                    <asp:ListItem Text="Last 30 days" Value="30" />
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </aside>

                <!-- Job Listings -->
                <section class="w-full md:w-3/4 space-y-6">
                    <asp:Repeater ID="rptJobListings" runat="server" OnItemDataBound="rptJobListings_ItemDataBound">
                        <ItemTemplate>
                            <div class="job-card card-bg p-6 rounded-lg shadow-sm border border-base">
                                <div class="flex flex-col sm:flex-row justify-between items-start">
                                    <div class="flex-grow">
                                        <h3 class="text-xl font-bold mb-1 text-accent"><%# Eval("Title") %></h3>
                                        <div class="flex items-center gap-2 text-sm text-secondary mb-2">
                                            <span><%# Eval("Company") %></span>
                                            <span>•</span>
                                            <span><%# Eval("Location") %></span>
                                        </div>
                                        <p class="text-sm text-primary mb-4"><%# FormatDescription(Eval("Description")) %></p>
                                        <div class="flex flex-wrap items-center gap-2 text-xs">
                                            <span class="bg-gray-100 text-gray-800 font-semibold px-2 py-1 rounded-full"><%# Eval("JobType") %></span>
                                            <span class="bg-gray-100 text-gray-800 font-semibold px-2 py-1 rounded-full"><%# Eval("Category") %></span>
                                            <span class="text-secondary">Posted: <%# Eval("PostedDate") %></span>
                                        </div>
                                    </div>
                                    <div class="w-full sm:w-auto flex flex-col sm:flex-row items-start sm:items-end gap-2 mt-4 sm:mt-0 sm:ml-4 flex-shrink-0">
                                        <a href='<%# "JobDetails.aspx?JobID=" + Eval("JobID") %>' class="w-full sm:w-auto px-6 py-3 text-center btn-secondary-border font-bold rounded-lg">View Details</a>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </section>
            </div>
        </main>

        <uc:Footer runat="server" />
    </form>
    
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const themeToggleBtn = document.getElementById('theme-toggle');
            const mobileMenuBtn = document.getElementById('mobile-menu-button');
            const mobileMenu = document.getElementById('mobile-menu');
            const body = document.body;
            const themeIcon = document.getElementById('theme-icon');

            const sunIcon = `<path d="M12 2.25a.75.75 0 01.75.75v2.25a.75.75 0 01-1.5 0V3a.75.75 0 01.75-.75zM7.5 12a4.5 4.5 0 119 0 4.5 4.5 0 01-9 0zM18.75 5.75a.75.75 0 01.53.22l1.5 1.5a.75.75 0 01-1.06 1.06l-1.5-1.5a.75.75 0 01.53-1.28zM12 18a.75.75 0 01.75.75v2.25a.75.75 0 01-1.5 0V18a.75.75 0 01.75-.75zM5.75 18.75a.75.75 0 01.53-.22l1.5 1.5a.75.75 0 01-1.06 1.06l-1.5-1.5a.75.75 0 01-.53-1.28zM3 12a.75.75 0 01.75-.75h2.25a.75.75 0 010 1.5H3.75A.75.75 0 013 12zM18 12a.75.75 0 01.75-.75h2.25a.75.75 0 010 1.5H18.75A.75.75 0 0118 12zM5.75 5.25a.75.75 0 011.06 0l1.5 1.5a.75.75 0 01-1.06 1.06l-1.5-1.5a.75.75 0 010-1.06z" />`;
            const moonIcon = `<path d="M9.54 11.07a6.25 6.25 0 01-1.5-3.83c0-.18.06-.35.15-.5A8.25 8.25 0 0013 18.25a8.25 8.25 0 007.82-5.75c.09-.15.15-.32.15-.5a6.25 6.25 0 01-3.83 1.5c-.32 0-.64-.06-.94-.17-2.6-.97-4.2-3.65-4.2-6.55 0-.18.06-.35.15-.5z" />`;

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
                    mobileMenu.classList.toggle('open');
                });
            }
        });
    </script>
</body>
</html>
