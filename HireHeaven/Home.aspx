<%@ Register Src="Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="Footer.ascx" TagPrefix="uc" TagName="Footer" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Portal</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap');
        
        /* --- THEME DEFINITIONS --- */

        /* Light Theme (Default) */
        body.theme-light {
            --bg-primary: #f8f9fa;
            --bg-secondary: #FFFFFF;
            --bg-card: #FFFFFF;
            --text-heading: #111827; /* Darker for strong headlines */
            --text-primary: #374151; /* Main paragraph text */
            --text-secondary: #6b7280; /* Lighter, secondary text */
            --text-on-accent: #FFFFFF; /* Text on colored buttons */
            --accent-blue: #0d6efd;
            --accent-blue-light: #e0e7ff;
            --border-color: #e5e7eb;
        }

        /* Balanced Theme */
        body.theme-balanced {
            --bg-primary: #e7e9eb;
            --bg-secondary: #2E3B4E;
            --bg-card: #f3f4f6;
            --text-heading: #1f2937;
            --text-primary: #2c3a4e;
            --text-secondary: #4b5563;
            --text-on-accent: #FFFFFF;
            --accent-blue: #4f46e5;
            --accent-blue-light: #e2e8f0;
            --border-color: #cbd5e1;
        }

        /* Dark Theme */
        body.theme-dark {
            --bg-primary: #111827;
            --bg-secondary: #1f2937;
            --bg-card: #1f2937;
            --text-heading: #f9fafb;
            --text-primary: #d1d5db;
            --text-secondary: #9ca3af;
            --text-on-accent: #FFFFFF;
            --accent-blue: #4A90E2;
            --accent-blue-light: #374151;
            --border-color: #4b5563;
        }

        /* --- SEMANTIC CLASSES USING VARIABLES --- */
        body {
            background-color: var(--bg-primary);
            color: var(--text-primary); /* Default text color */
            font-family: 'Inter', sans-serif;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .section-bg { background-color: var(--bg-primary); }
        .card-bg { background-color: var(--bg-card); }
        .text-heading { color: var(--text-heading); }
        .text-primary { color: var(--text-primary); }
        .text-secondary { color: var(--text-secondary); }
        .text-accent { color: var(--accent-blue); }
        .border-base { border-color: var(--border-color); }
        
        .btn-primary {
            background-color: var(--accent-blue);
            color: var(--text-on-accent);
        }

        .btn-secondary {
            background-color: var(--accent-blue-light);
            color: var(--accent-blue);
        }
        
        .btn-secondary-border {
            border: 2px solid var(--accent-blue);
            color: var(--accent-blue);
        }
        
        .btn-secondary-border:hover {
            background-color: var(--accent-blue);
            color: var(--text-on-accent);
        }
        
        /* Dark mode specific input styles */
        body.theme-dark input {
            background-color: #374151;
            border-color: var(--border-color);
            color: var(--text-primary);
        }
        body.theme-dark input {
            color: var(--text-secondary);
        }
    </style>
</head>
<body class="theme-light">
    <uc:Header runat="server" />
    
    <section class="section-bg py-16 md:py-24">
        <div class="container mx-auto px-6 grid md:grid-cols-2 gap-8 items-center">
            <div class="text-center md:text-left">
                <h1 class="text-4xl md:text-5xl lg:text-6xl font-extrabold text-heading leading-tight mb-4">
                    Find Your Dream Job or <span class="text-accent">Hire the Best Talent</span>
                </h1>
                <p class="lg:text-xl md:text-lg text-secondary mb-8">
                    Join thousands of job seekers and employers on one powerful platform.
                </p>
                <div class="flex flex-col md:flex-row gap-4 justify-center md:justify-start">
                    <a href="Jobs.aspx" class="px-8 py-4 btn-primary font-semibold rounded-lg shadow-lg transition-transform transform hover:scale-105">Search Jobs</a>
                    <a href="PostJob.aspx" class="px-8 py-4 btn-secondary-border font-semibold rounded-lg transition-colors duration-300 transform hover:scale-105">Post a Job</a>
                </div>
            </div>
            
            <div class="hidden md:flex justify-center">
                <img src="Image\istockphoto-1252679603-612x612.jpg" alt="People working together" class="rounded-3xl shadow-xl">
            </div>
        </div>
    </section>

    <section class="bg-transparent py-12 -mt-24 relative z-20">
        <div class="container mx-auto px-6">
            <div class="card-bg rounded-2xl shadow-xl p-6 md:p-8 flex flex-col md:flex-row gap-4 items-center border border-base">
                <input type="text" placeholder="Job Title, Keyword, or Company" class="flex-1 w-full md:w-auto px-4 py-3 rounded-lg border border-base focus:outline-none focus:ring-2 focus:ring-accent transition-all duration-300">
                <input type="text" placeholder="City, State, or Zip Code" class="flex-1 w-full md:w-auto px-4 py-3 rounded-lg border border-base focus:outline-none focus:ring-2 focus:ring-accent transition-all duration-300">
                <button class="w-full md:w-auto px-8 py-3 btn-primary font-semibold rounded-lg transition-colors duration-300">Search</button>
            </div>
        </div>
    </section>

    <section class="py-16 md:py-24">

        <div class="container mx-auto px-6 grid md:grid-cols-2 gap-12 items-center">
            <div class="order-2 md:order-1">
                <h2 class="text-3xl md:text-4xl font-bold text-heading mb-6">
                    Looking for Your Next Career Opportunity?
                </h2>
                <ul class="space-y-4 text-secondary text-lg mb-8">
                    <li class="flex items-start">
                        <svg class="h-6 w-6 text-accent mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path></svg>
                        Search jobs by location and skills
                    </li>
                    <li class="flex items-start">
                        <svg class="h-6 w-6 text-accent mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path></svg>
                        Apply directly to top companies
                    </li>
                    <li class="flex items-start">
                        <svg class="h-6 w-6 text-accent mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path></svg>
                        Get job alerts via email
                    </li>
                </ul>
                <a href="Registration.aspx" class="inline-block px-6 py-3 btn-primary font-semibold rounded-lg transition-colors duration-300">Register as Job Seeker</a>
            </div>
            <div class="order-1 md:order-2">
                <img src="Image\job-seeker-illustration-concept_225067-151 (1).jpg" alt="Job seeker illustration" class="rounded-2xl shadow-lg">
            </div>
        </div>
    </section>

    <section class="card-bg py-16 md:py-24">
        <div class="container mx-auto px-6 grid md:grid-cols-2 gap-12 items-center">
            <div>
                <img src="Image\brand-vector-text-isometric-logo-brand-vector-text-employers-working-branding-design-flat-isometric-people-illustration-114545232 (1).jpg" alt="Employer illustration" class="rounded-2xl shadow-lg">
            </div>
            <div>
                <h2 class="text-3xl md:text-4xl font-bold text-heading mb-6">
                    Hire the Right Talent Faster
                </h2>
                <ul class="space-y-4 text-secondary text-lg mb-8">
                    <li class="flex items-start">
                        <svg class="h-6 w-6 text-accent mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path></svg>
                        Post jobs in minutes
                    </li>
                    <li class="flex items-start">
                        <svg class="h-6 w-6 text-accent mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path></svg>
                        Access our talent database
                    </li>
                    <li class="flex items-start">
                        <svg class="h-6 w-6 text-accent mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path></svg>
                        Manage applications easily
                    </li>
                </ul>
                <a href="Registration.aspx" class="inline-block px-6 py-3 btn-primary font-semibold rounded-lg transition-colors duration-300">Register as Employer</a>
            </div>
        </div>
    </section>

    <section class="py-16 md:py-24">
        <div class="container mx-auto px-6 text-center">
            <h2 class="text-3xl md:text-4xl font-bold text-heading mb-12">
                Featured Jobs
            </h2>
            <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
                <div class="card-bg rounded-xl shadow-lg p-6 border border-base text-left transition-transform duration-300 hover:-translate-y-1">
                    <h3 class="text-xl font-bold text-accent">Senior Software Engineer</h3>
                    <p class="text-primary mt-2">Tech Solutions Inc.</p>
                    <p class="text-secondary">San Francisco, CA</p>
                    <button class="mt-6 w-full py-3 btn-secondary font-semibold rounded-lg transition-colors duration-300">Apply Now</button>
                </div>
                <div class="card-bg rounded-xl shadow-lg p-6 border border-base text-left transition-transform duration-300 hover:-translate-y-1">
                    <h3 class="text-xl font-bold text-accent">Marketing Manager</h3>
                    <p class="text-primary mt-2">Creative Hub Agency</p>
                    <p class="text-secondary">New York, NY</p>
                    <button class="mt-6 w-full py-3 btn-secondary font-semibold rounded-lg transition-colors duration-300">Apply Now</button>
                </div>
                <div class="card-bg rounded-xl shadow-lg p-6 border border-base text-left transition-transform duration-300 hover:-translate-y-1">
                    <h3 class="text-xl font-bold text-accent">UX/UI Designer</h3>
                    <p class="text-primary mt-2">Design Collective</p>
                    <p class="text-secondary">Austin, TX</p>
                    <button class="mt-6 w-full py-3 btn-secondary font-semibold rounded-lg transition-colors duration-300">Apply Now</button>
                </div>
                <div class="card-bg rounded-xl shadow-lg p-6 border border-base text-left transition-transform duration-300 hover:-translate-y-1">
                    <h3 class="text-xl font-bold text-accent">Data Scientist</h3>
                    <p class="text-primary mt-2">Data Insights Co.</p>
                    <p class="text-secondary">Seattle, WA</p>
                    <button class="mt-6 w-full py-3 btn-secondary font-semibold rounded-lg transition-colors duration-300">Apply Now</button>
                </div>
                <div class="card-bg rounded-xl shadow-lg p-6 border border-base text-left transition-transform duration-300 hover:-translate-y-1">
                    <h3 class="text-xl font-bold text-accent">Product Manager</h3>
                    <p class="text-primary mt-2">Innovate Solutions</p>
                    <p class="text-secondary">Boston, MA</p>
                    <button class="mt-6 w-full py-3 btn-secondary font-semibold rounded-lg transition-colors duration-300">Apply Now</button>
                </div>
                </div>
        </div>
    </section>

    <section class="section-bg py-16 md:py-24">
        <div class="container mx-auto px-6 text-center">
            <h2 class="text-3xl md:text-4xl font-bold text-heading mb-12">
                Why Choose Us
            </h2>
            <div class="grid sm:grid-cols-2 lg:grid-cols-3 gap-8">
                <div class="card-bg rounded-xl shadow-md p-8 flex flex-col items-center">
                    <div class="p-4 btn-secondary rounded-full mb-4">
                        <svg class="h-10 w-10 text-accent" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.104A9 9 0 110 12a9 9 0 012.618-7.104z"></path></svg>
                    </div>
                    <p class="font-bold text-xl text-primary">Trusted by 500+ companies</p>
                </div>
                <div class="card-bg rounded-xl shadow-md p-8 flex flex-col items-center">
                    <div class="p-4 btn-secondary rounded-full mb-4">
                        <svg class="h-10 w-10 text-accent" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H2v-2a4 4 0 014-4h2a4 4 0 014 4v2zM12 10a6 6 0 100-12 6 6 0 000 12zm0 0a6 6 0 100-12 6 6 0 000 12z"></path></svg>
                    </div>
                    <p class="font-bold text-xl text-primary">10,000+ active job seekers</p>
                </div>
                <div class="card-bg rounded-xl shadow-md p-8 flex flex-col items-center">
                    <div class="p-4 btn-secondary rounded-full mb-4">
                        <svg class="h-10 w-10 text-accent" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path></svg>
                    </div>
                    <p class="font-bold text-xl text-primary">Secure & easy to use</p>
                </div>
            </div>
        </div>
    </section>
    
    <uc:Footer runat="server" />
</body>
</html>