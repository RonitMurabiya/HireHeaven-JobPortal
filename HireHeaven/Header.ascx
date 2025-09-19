<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Header.ascx.cs" Inherits="HeaderControl" %>

<header class="header">
    <nav class="nav">
        <!-- Logo -->
        <div class="logo">
            <a href="Home.aspx" class="logo-text">HireHeaven</a>
        </div>

        <!-- Desktop Navigation -->
        <div class="nav-links-desktop">
            <a href="Home.aspx" class="nav-link">Home</a>
            <asp:PlaceHolder ID="phDefaultLinksDesktop" runat="server">
                <a href="Jobs.aspx" class="nav-link">Jobs</a>
            </asp:PlaceHolder>
            <asp:PlaceHolder ID="phEmployerLinksDesktop" runat="server" Visible="false">
                <a href="PostJob.aspx" class="nav-link">Post a Job</a>
                <a href="ApplicationReceived.aspx" class="nav-link">Applications</a>
            </asp:PlaceHolder>
            <asp:PlaceHolder ID="phAdminLinksDesktop" runat="server" Visible="false">
                <a href="AdminDashboard.aspx" class="nav-link">Dashboard</a>
                <a href="#" class="nav-link">Reports</a>
            </asp:PlaceHolder>
            <a href="AboutUs.aspx" class="nav-link">About Us</a>
            <a href="#" class="nav-link">Contact Us</a>
        </div>

        <!-- Desktop Auth Buttons -->
        <div class="auth-buttons-desktop">
            <asp:PlaceHolder ID="phLoggedOutDesktop" runat="server">
                <a href="Login.aspx" class="btn-login">Login</a>
                <a href="Registration.aspx" class="btn-register">Register</a>
            </asp:PlaceHolder>
            <asp:PlaceHolder ID="phJobSeekerDesktop" runat="server" Visible="false">
                <a href="JobSeekerDashboard.aspx" class="nav-link">My Dashboard</a>
                <asp:LinkButton ID="btnLogoutSeeker" runat="server" OnClick="btnLogout_Click" CssClass="btn-login">Logout</asp:LinkButton>
            </asp:PlaceHolder>
            <asp:PlaceHolder ID="phEmployerDesktop" runat="server" Visible="false">
                <a href="EmployerDashboard.aspx" class="nav-link">My Dashboard</a>
                <asp:LinkButton ID="btnLogoutEmployer" runat="server" OnClick="btnLogout_Click" CssClass="btn-login">Logout</asp:LinkButton>
            </asp:PlaceHolder>
            <asp:PlaceHolder ID="phAdminDesktop" runat="server" Visible="false">
                <a href="AdminDashboard.aspx" class="nav-link">Admin Panel</a>
                <asp:LinkButton ID="btnLogoutAdmin" runat="server" OnClick="btnLogout_Click" CssClass="btn-login">Logout</asp:LinkButton>
            </asp:PlaceHolder>
        </div>

        <!-- Theme Toggle & Mobile Menu -->
        <div class="nav-controls-mobile">
            <button id="theme-toggle" class="theme-toggle-btn-new">
                <svg id="theme-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"></svg>
            </button>
            <button id="mobile-menu-button" class="mobile-menu-button">
                <svg fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"/></svg>
            </button>
        </div>
    </nav>

    <!-- Mobile Menu -->
    <div id="mobile-menu" class="mobile-menu">
        <div class="mobile-menu-links">
            <a href="Home.aspx" class="mobile-link">Home</a>
            <asp:PlaceHolder ID="phDefaultLinksMobile" runat="server">
                <a href="Jobs.aspx" class="mobile-link">Jobs</a>
            </asp:PlaceHolder>
            <asp:PlaceHolder ID="phEmployerLinksMobile" runat="server" Visible="false">
                <a href="PostJob.aspx" class="mobile-link">Post a Job</a>
                <a href="ApplicationReceived.aspx" class="mobile-link">Applications</a>
            </asp:PlaceHolder>
            <asp:PlaceHolder ID="phAdminLinksMobile" runat="server" Visible="false">
                <a href="AdminDashboard.aspx" class="mobile-link">Dashboard</a>
                <a href="#" class="mobile-link">Reports</a>
            </asp:PlaceHolder>
            <a href="AboutUs.aspx" class="mobile-link">About Us</a>
            <a href="#" class="mobile-link">Contact Us</a>
            <asp:PlaceHolder ID="phLoggedOutMobile" runat="server">
                <a href="Login.aspx" class="mobile-link">Login</a>
                <a href="Registration.aspx" class="mobile-register">Register</a>
            </asp:PlaceHolder>
            <asp:PlaceHolder ID="phJobSeekerMobile" runat="server" Visible="false">
                <a href="JobSeekerDashboard.aspx" class="mobile-link">My Dashboard</a>
                <asp:LinkButton ID="btnLogoutSeekerMobile" runat="server" OnClick="btnLogout_Click" CssClass="mobile-link">Logout</asp:LinkButton>
            </asp:PlaceHolder>
            <asp:PlaceHolder ID="phEmployerMobile" runat="server" Visible="false">
                <a href="EmployerDashboard.aspx" class="mobile-link">My Dashboard</a>
                <asp:LinkButton ID="btnLogoutEmployerMobile" runat="server" OnClick="btnLogout_Click" CssClass="mobile-link">Logout</asp:LinkButton>
            </asp:PlaceHolder>
            <asp:PlaceHolder ID="phAdminMobile" runat="server" Visible="false">
                <a href="AdminDashboard.aspx" class="mobile-link">Admin Panel</a>
                <asp:LinkButton ID="btnLogoutAdminMobile" runat="server" OnClick="btnLogout_Click" CssClass="mobile-link">Logout</asp:LinkButton>
            </asp:PlaceHolder>
        </div>
    </div>
</header>

<!-- Minimal CSS & JS kept -->
<style>
    .header{background-color:var(--bg-secondary);box-shadow:0 4px 6px -1px rgba(0,0,0,.1),0 2px 4px -1px rgba(0,0,0,.06);transition:background-color .3s}
    .nav{max-width:80rem;margin:0 auto;padding:1rem;display:flex;align-items:center;justify-content:space-between;flex-wrap:wrap}
    .logo-text{font-size:1.5rem;font-weight:700;color:var(--text-heading);transition:color .3s}
    .nav-links-desktop{display:none}@media(min-width:768px){.nav-links-desktop{display:flex;flex-grow:1;align-items:center;justify-content:center;gap:1rem}}
    .nav-link,.btn-login{color:var(--text-primary);padding:.5rem .75rem;border-radius:.375rem;font-weight:500;transition:color .2s}
    .nav-link:hover,.btn-login:hover{color:var(--accent-blue)}
    .btn-register{padding:.5rem 1rem;border:2px solid var(--accent-blue);font-size:.875rem;font-weight:500;border-radius:.375rem;color:var(--accent-blue);background:transparent;transition:all .2s}
    .btn-register:hover{background-color:var(--accent-blue);color:var(--text-on-accent)}
    .auth-buttons-desktop{display:none;align-items:center;gap:1rem}@media(min-width:768px){.auth-buttons-desktop{display:flex}}
    .nav-controls-mobile{display:flex;align-items:center;gap:1rem}
    .mobile-menu-button{color:var(--text-primary);transition:color .3s}@media(min-width:768px){.nav-controls-mobile .mobile-menu-button{display:none}}
    .mobile-menu{display:none}.mobile-menu.open{display:block}
    .mobile-menu-links{padding:.5rem;display:flex;flex-direction:column;gap:.25rem;background-color:var(--bg-secondary);transition:background-color .3s}
    .mobile-link{display:block;padding:.5rem .75rem;border-radius:.375rem;font-size:1rem;font-weight:500;color:var(--text-primary);transition:all .3s}
    .mobile-link:hover{color:var(--accent-blue);background-color:var(--bg-primary)}
    .mobile-register{display:block;width:100%;text-align:center;padding:.5rem .75rem;border-radius:.375rem;font-size:1rem;font-weight:500;color:var(--text-on-accent);background-color:var(--accent-blue);transition:background-color .3s}
    .mobile-register:hover{opacity:.9}
    .theme-toggle-btn-new{display:flex;align-items:center;justify-content:center;padding:.5rem;border-radius:9999px;cursor:pointer;color:var(--text-primary);background:transparent;border:none;transition:color .2s}
    .theme-toggle-btn-new:hover{color:var(--accent-blue)}.theme-toggle-btn-new svg{fill:currentColor;width:1.5rem;height:1.5rem}
</style>

<script>
    document.addEventListener('DOMContentLoaded', () => {
        const themeToggle = document.getElementById('theme-toggle'),
            mobileBtn = document.getElementById('mobile-menu-button'),
            mobileMenu = document.getElementById('mobile-menu'),
            body = document.body,
            themeIcon = document.getElementById('theme-icon');
        const sun = `<path d="M12 2.25a.75.75 0 01.75.75v2.25a.75.75 0 01-1.5 0V3a.75.75 0 01.75-.75zM7.5 12a4.5 4.5 0 119 0 4.5 4.5 0 01-9 0zM18.75 5.75a.75.75 0 01.53.22l1.5 1.5a.75.75 0 01-1.06 1.06l-1.5-1.5a.75.75 0 01.53-1.28zM12 18a.75.75 0 01.75.75v2.25a.75.75 0 01-1.5 0V18a.75.75 0 01.75-.75zM5.75 18.75a.75.75 0 01.53-.22l1.5 1.5a.75.75 0 01-1.06 1.06l-1.5-1.5a.75.75 0 01-.53-1.28zM3 12a.75.75 0 01.75-.75h2.25a.75.75 0 010 1.5H3.75A.75.75 0 013 12zM18 12a.75.75 0 01.75-.75h2.25a.75.75 0 010 1.5H18.75A.75.75 0 0118 12zM5.75 5.25a.75.75 0 011.06 0l1.5 1.5a.75.75 0 01-1.06 1.06l-1.5-1.5a.75.75 0 010-1.06z"/>`,
            moon = `<path d="M9.54 11.07a6.25 6.25 0 01-1.5-3.83c0-.18.06-.35.15-.5A8.25 8.25 0 0013 18.25a8.25 8.25 0 007.82-5.75c.09-.15.15-.32.15-.5a6.25 6.25 0 01-3.83 1.5c-.32 0-.64-.06-.94-.17-2.6-.97-4.2-3.65-4.2-6.55 0-.18.06-.35.15-.5z"/>`;

        const setTheme = theme => {
            body.className = theme;
            localStorage.setItem('theme', theme);
            themeIcon.innerHTML = theme === 'theme-dark' ? sun : moon;
        };

        setTheme(localStorage.getItem('theme') || 'theme-balanced');

        themeToggle.addEventListener('click', () => {
            let t = body.className;
            setTheme(t === 'theme-balanced' ? 'theme-dark' : t === 'theme-dark' ? 'theme-light' : 'theme-balanced');
        });

        mobileBtn.addEventListener('click', () => mobileMenu.classList.toggle('open'));
    });
</script>
