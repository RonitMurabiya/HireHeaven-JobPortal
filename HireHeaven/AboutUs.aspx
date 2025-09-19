<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AboutUs.aspx.cs" Inherits="AboutUs" %>
<%@ Register Src="~/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/Footer.ascx" TagPrefix="uc" TagName="Footer" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>About Us - HireHeaven</title>
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
            --text-on-dark: #343a40;
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
            --text-on-dark: #FFFFFF;
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
            --text-on-dark: #EAEAEA;
            --accent-blue: #4A90E2;
            --border-color: #424242;
        }

        /* Semantic classes */
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
        .text-accent { color: var(--accent-blue); }
        
        .border-themed { border-color: var(--border-color); }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc:Header runat="server" ID="Header" />

        <main class="container mx-auto p-6">
            <!-- Page Header -->
            <div class="text-center my-12">
                <h1 class="text-4xl md:text-5xl font-extrabold mb-2 text-accent">About Us</h1>
                <p class="text-lg text-secondary">Connecting Talent with Opportunity</p>
            </div>

            <div class="max-w-4xl mx-auto space-y-12">
                <!-- Introduction Section -->
                <div class="card-bg p-8 rounded-lg shadow-md border border-themed">
                    <p class="text-lg leading-relaxed text-secondary">
                        Welcome to <strong class="text-primary">HireHeaven</strong>, a modern job portal designed to bridge the gap between Job Seekers and Employers.
                        Our mission is simple: to make hiring and job hunting easier, faster, and smarter.
                    </p>
                </div>

                <!-- Our Mission Section -->
                <div class="card-bg p-8 rounded-lg shadow-md border border-themed">
                    <h2 class="text-2xl font-bold text-primary mb-4">Our Mission</h2>
                    <ul class="list-disc list-inside space-y-2 text-secondary">
                        <li>Help Job Seekers find the right opportunities that match their skills and career goals.</li>
                        <li>Provide Employers with a reliable platform to post jobs and connect with qualified candidates.</li>
                        <li>Create a transparent, user-friendly, and efficient recruitment process.</li>
                    </ul>
                </div>

                <!-- Who We Serve Section -->
                <div class="card-bg p-8 rounded-lg shadow-md border border-themed">
                    <h2 class="text-2xl font-bold text-primary mb-4">Who We Serve</h2>
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                        <div class="card-secondary-bg p-4 rounded-lg">
                            <h3 class="font-semibold text-primary">Job Seekers</h3>
                            <p class="text-sm text-secondary">Freshers & experienced professionals looking for career opportunities.</p>
                        </div>
                        <div class="card-secondary-bg p-4 rounded-lg">
                            <h3 class="font-semibold text-primary">Employers</h3>
                            <p class="text-sm text-secondary">Companies, startups, and organizations searching for top talent.</p>
                        </div>
                        <div class="card-secondary-bg p-4 rounded-lg">
                            <h3 class="font-semibold text-primary">Administrators</h3>
                            <p class="text-sm text-secondary">Who ensure fair usage, manage data, and maintain platform quality.</p>
                        </div>
                    </div>
                </div>

                <!-- Key Features Section -->
                <div class="card-bg p-8 rounded-lg shadow-md border border-themed">
                    <h2 class="text-2xl font-bold text-primary mb-4">Key Features of Our Portal</h2>
                    <ul class="list-disc list-inside space-y-2 text-secondary">
                        <li>Easy Job Search & Apply process for candidates.</li>
                        <li>Simple Job Posting & Application Tracking for employers.</li>
                        <li>Dashboards tailored for Job Seekers, Employers, and Admin.</li>
                        <li>Secure Login & Registration system.</li>
                        <li>Resume upload and job application tracking.</li>
                    </ul>
                </div>
                
                <!-- Our Vision Section -->
                <div class="text-center card-bg p-8 rounded-lg shadow-md border border-themed">
                     <h2 class="text-2xl font-bold text-primary mb-4">Our Vision</h2>
                     <p class="text-lg text-secondary italic">
                         "To become the most trusted career platform, where every employer finds the right candidate, and every job seeker finds their dream job."
                     </p>
                </div>
            </div>
        </main>

        <uc:Footer runat="server" ID="Footer" />
    </form>
</body>
</html>
