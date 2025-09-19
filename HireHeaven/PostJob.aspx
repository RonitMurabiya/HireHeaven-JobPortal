<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PostJob.aspx.cs" Inherits="PostJob" %>
<%@ Register Src="~/Footer.ascx" TagPrefix="uc" TagName="Footer" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Post a New Job</title>
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
            --text-heading: #2C2C2C;
            --text-on-dark: #343a40;
            --text-on-accent: #FFFFFF;
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
            --text-heading: #f9fafb;
            --text-on-dark: #FFFFFF;
            --text-on-accent: #FFFFFF;
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
            --text-heading: #e0e0e0;
            --text-on-dark: #EAEAEA;
            --text-on-accent: #FFFFFF;
            --accent-blue: #4A90E2;
            --border-color: #424242;
        }

        /* --- SEMANTIC CLASSES FROM MAIN PAGE --- */
        body { font-family: 'Inter', sans-serif; transition: background-color 0.3s ease, color 0.3s ease; background-color: var(--bg-primary); }
        .card-bg { background-color: var(--bg-card); transition: background-color 0.3s ease; }
        .card-secondary-bg { background-color: var(--bg-card-secondary); transition: background-color 0.3s ease; }
        .text-primary { color: var(--text-primary); }
        .text-secondary { color: var(--text-secondary); }
        .text-accent { color: var(--accent-blue); }
        .btn-primary { background-color: var(--accent-blue); color: white; transition: background-color 0.3s ease; }
        .btn-secondary-themed { background-color: var(--bg-card-secondary); color: var(--text-primary); transition: background-color 0.3s ease, color 0.3s ease; }
        .form-input { background-color: var(--bg-card-secondary); border-color: var(--border-color); color: var(--text-primary); transition: background-color 0.3s ease, border-color 0.3s ease, color 0.3s ease; }
        .border-themed { border-color: var(--border-color); }
        .modal { display: none; }
        .modal.flex { display: flex; }

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
<body>
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
                <h1 class="text-4xl md:text-5xl font-extrabold mb-2 text-accent">Post a New Job</h1>
                <p class="text-lg text-secondary">Fill in the details below to reach thousands of qualified job seekers.</p>
            </div>

            <div class="max-w-4xl mx-auto card-bg p-8 rounded-lg shadow-md border border-themed">
                <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mb-6 text-center">
                    ✅ Your job has been posted successfully. You can track applications in your Employer Dashboard.
                </asp:Panel>

                <asp:Panel ID="pnlForm" runat="server">
                    <div class="space-y-6">
                        <!-- Basic Job Details -->
                        <div class="border-b border-themed pb-6">
                            <h2 class="text-xl font-bold text-primary">Basic Job Details</h2>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-4">
                                <div>
                                    <asp:Label For="txtJobTitle" runat="server" Text="Job Title" CssClass="block text-sm font-medium mb-1 text-secondary" />
                                    <asp:TextBox ID="txtJobTitle" runat="server" CssClass="form-input w-full border rounded-lg p-2.5 focus:outline-none focus:ring-2 focus:ring-indigo-500"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtJobTitle" ErrorMessage="Job Title is required." ForeColor="Red" Display="Dynamic" runat="server" CssClass="text-xs mt-1" />
                                </div>
                                <div>
                                    <asp:Label For="ddlJobCategory" runat="server" Text="Job Category" CssClass="block text-sm font-medium mb-1 text-secondary" />
                                    <asp:DropDownList ID="ddlJobCategory" runat="server" CssClass="form-input w-full border rounded-lg p-2.5 focus:outline-none focus:ring-2 focus:ring-indigo-500">
                                        <asp:ListItem Text="Information Technology" Value="IT" />
                                        <asp:ListItem Text="Finance" Value="Finance" />
                                        <asp:ListItem Text="Marketing" Value="Marketing" />
                                        <asp:ListItem Text="Human Resources" Value="HR" />
                                    </asp:DropDownList>
                                </div>
                                <div class="md:col-span-2">
                                    <asp:Label For="txtJobDescription" runat="server" Text="Job Description" CssClass="block text-sm font-medium mb-1 text-secondary" />
                                    <asp:TextBox ID="txtJobDescription" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-input w-full border rounded-lg p-2.5 focus:outline-none focus:ring-2 focus:ring-indigo-500"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtJobDescription" ErrorMessage="Description is required." ForeColor="Red" Display="Dynamic" runat="server" CssClass="text-xs mt-1" />
                                </div>
                                <div>
                                    <asp:Label For="ddlJobType" runat="server" Text="Job Type" CssClass="block text-sm font-medium mb-1 text-secondary" />
                                    <asp:DropDownList ID="ddlJobType" runat="server" CssClass="form-input w-full border rounded-lg p-2.5 focus:outline-none focus:ring-2 focus:ring-indigo-500">
                                        <asp:ListItem>Full-time</asp:ListItem>
                                        <asp:ListItem>Part-time</asp:ListItem>
                                        <asp:ListItem>Internship</asp:ListItem>
                                        <asp:ListItem>Contract</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div>
                                    <asp:Label For="txtDeadline" runat="server" Text="Application Deadline" CssClass="block text-sm font-medium mb-1 text-secondary" />
                                    <asp:TextBox ID="txtDeadline" runat="server" TextMode="Date" CssClass="form-input w-full border rounded-lg p-2.5 focus:outline-none focus:ring-2 focus:ring-indigo-500"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <!-- Requirements -->
                        <div class="border-b border-themed pb-6">
                            <h2 class="text-xl font-bold text-primary">Requirements</h2>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-4">
                                <div>
                                    <asp:Label For="ddlQualification" runat="server" Text="Required Qualification" CssClass="block text-sm font-medium mb-1 text-secondary" />
                                    <asp:DropDownList ID="ddlQualification" runat="server" CssClass="form-input w-full border rounded-lg p-2.5 focus:outline-none focus:ring-2 focus:ring-indigo-500">
                                        <asp:ListItem>B.Tech</asp:ListItem>
                                        <asp:ListItem>MBA</asp:ListItem>
                                        <asp:ListItem>MCA</asp:ListItem>
                                        <asp:ListItem>Any Graduate</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div>
                                    <asp:Label For="ddlExperience" runat="server" Text="Experience Level" CssClass="block text-sm font-medium mb-1 text-secondary" />
                                    <asp:DropDownList ID="ddlExperience" runat="server" CssClass="form-input w-full border rounded-lg p-2.5 focus:outline-none focus:ring-2 focus:ring-indigo-500">
                                        <asp:ListItem>0-1 year (Fresher)</asp:ListItem>
                                        <asp:ListItem>2-5 years</asp:ListItem>
                                        <asp:ListItem>5+ years</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="md:col-span-2">
                                    <asp:Label runat="server" Text="Skills Required" CssClass="block text-sm font-medium mb-2 text-secondary" />
                                    <asp:CheckBoxList ID="cblSkills" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" CssClass="flex flex-wrap gap-x-6 gap-y-2 text-sm text-primary">
                                        <asp:ListItem>C#</asp:ListItem>
                                        <asp:ListItem>ASP.NET</asp:ListItem>
                                        <asp:ListItem>SQL</asp:ListItem>
                                        <asp:ListItem>Java</asp:ListItem>
                                        <asp:ListItem>Python</asp:ListItem>
                                        <asp:ListItem>React</asp:ListItem>
                                        <asp:ListItem>Angular</asp:ListItem>
                                        <asp:ListItem>Cloud (AWS/Azure)</asp:ListItem>
                                    </asp:CheckBoxList>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Location & Salary -->
                        <div class="border-b border-themed pb-6">
                            <h2 class="text-xl font-bold text-primary">Location & Salary</h2>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-4">
                                <div>
                                    <asp:Label For="txtLocation" runat="server" Text="Job Location" CssClass="block text-sm font-medium mb-1 text-secondary" />
                                    <asp:TextBox ID="txtLocation" runat="server" CssClass="form-input w-full border rounded-lg p-2.5 focus:outline-none focus:ring-2 focus:ring-indigo-500" placeholder="e.g., Bengaluru, Karnataka"></asp:TextBox>
                                </div>
                                <div>
                                    <asp:Label For="txtSalary" runat="server" Text="Salary Range (LPA)" CssClass="block text-sm font-medium mb-1 text-secondary" />
                                    <asp:TextBox ID="txtSalary" runat="server" CssClass="form-input w-full border rounded-lg p-2.5 focus:outline-none focus:ring-2 focus:ring-indigo-500" placeholder="e.g., 8-12"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <!-- Action Buttons -->
                        <div class="flex justify-end gap-4 pt-4">
                            
                            <asp:Button ID="btnSaveDraft" runat="server" Text="Save as Draft" OnClick="btnSaveDraft_Click" CssClass="px-6 py-2 btn-secondary-themed hover:opacity-80 rounded-lg font-semibold transition-colors" />
                            <asp:Button ID="btnPublish" runat="server" Text="Publish Job" OnClick="btnPublish_Click" CssClass="px-6 py-2 btn-primary hover:opacity-90 rounded-lg font-semibold transition-colors" />
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </main>

        <!-- Preview Modal -->
        <div id="previewModal" class="modal fixed inset-0 bg-black bg-opacity-70 items-center justify-center p-4">
            <div class="card-bg rounded-lg shadow-xl p-8 max-w-2xl w-full space-y-4 border border-themed">
                <div class="flex justify-between items-center">
                    <h3 class="text-2xl font-bold text-primary">Job Posting Preview</h3>
                    <button type="button" onclick="hidePreviewModal()" class="text-secondary hover:text-primary">&times;</button>
                </div>
                <div class="card-secondary-bg p-6 rounded-lg border border-themed space-y-2">
                    <h4 class="text-xl font-bold text-accent"><asp:Literal ID="litPreviewTitle" runat="server" /></h4>
                    <p class="text-primary">
                        <asp:Literal ID="litPreviewCompany" runat="server" /> | 
                        <asp:Literal ID="litPreviewLocation" runat="server" /> | 
                        <asp:Literal ID="litPreviewJobType" runat="server" /> | 
                        <asp:Literal ID="litPreviewCategory" runat="server" /> | 
                        <asp:Literal ID="litPreviewSalary" runat="server" />
                    </p>
                    <p class="text-sm text-secondary mt-1"><asp:Literal ID="litPreviewSkills" runat="server" /></p>
                    <p class="text-sm text-secondary mt-1"><asp:Literal ID="litPreviewQualification" runat="server" /> | <asp:Literal ID="litPreviewExperience" runat="server" /></p>
                    <p class="text-sm text-secondary mt-2"><asp:Literal ID="litPreviewDescription" runat="server" /></p>
                    <p class="text-xs text-secondary mt-3"><asp:Literal ID="litPreviewPostedDate" runat="server" /> | <asp:Literal ID="litPreviewDeadline" runat="server" /></p>
                    <div class="mt-4">
                        <button type="button" class="px-6 py-2 btn-primary rounded-lg font-semibold">Apply Now</button>
                    </div>
                </div>
                <div class="text-right">
                    <button type="button" onclick="hidePreviewModal()" class="px-6 py-2 btn-secondary-themed hover:opacity-80 rounded-lg font-semibold transition-colors">Close</button>
                </div>
            </div>
        </div>

        <uc:Footer runat="server" ID="Footer" />
    </form>
    
    <script>
        function showPreviewModal() {
            document.getElementById('previewModal').classList.add('flex');
        }
        function hidePreviewModal() {
            document.getElementById('previewModal').classList.remove('flex');
        }

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
