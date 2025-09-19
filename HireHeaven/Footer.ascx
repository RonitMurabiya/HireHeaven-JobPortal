<%@ Control Language="C#" AutoEventWireup="true" %>

<!-- reusable_footer.ascx: This file contains the HTML for the reusable footer, styled with standard CSS. -->

<style>
    /* CSS for the footer component */
    .footer {
        background-color: var(--bg-secondary);
        box-shadow: 0 -4px 6px -1px rgba(0, 0, 0, 0.1); /* Shadow on top */
        margin-top: 3rem;
        padding: 2.5rem 0;
        transition: background-color 0.3s ease;
    }
    .footer-container {
        max-width: 80rem;
        margin: 0 auto;
        padding: 0 1.5rem;
        display: grid;
        grid-template-columns: repeat(1, minmax(0, 1fr));
        gap: 2.5rem;
        text-align: center;
    }
    @media (min-width: 768px) {
        .footer-container {
            grid-template-columns: repeat(2, minmax(0, 1fr));
            text-align: left;
        }
    }
    @media (min-width: 1024px) {
        .footer-container {
            grid-template-columns: repeat(4, minmax(0, 1fr));
        }
    }
    
    .footer-title {
        font-size: 1.125rem;
        font-weight: 700;
        color: var(--text-heading);
        margin-bottom: 1rem;
    }
    .footer-text, .footer-link {
        color: var(--text-primary);
        font-size: 0.9rem;
        line-height: 1.5;
    }
    .footer-list {
        list-style: none;
        padding: 0;
        margin: 0;
        display: flex;
        flex-direction: column;
        gap: 0.5rem;
    }
    .footer-link, .footer-social-link {
        transition: color 0.2s ease-in-out;
    }
    .footer-link:hover, .footer-social-link:hover {
        color: var(--accent-blue);
    }
    .footer-social-links {
        display: flex;
        justify-content: center;
        gap: 1.5rem;
        margin-top: 1rem;
    }
    @media (min-width: 768px) {
        .footer-social-links {
            justify-content: flex-start;
        }
    }
    .copyright {
        text-align: center;
        color: var(--text-secondary);
        font-size: 0.875rem;
        margin-top: 2.5rem;
        border-top: 1px solid var(--border-color);
        padding-top: 1.5rem;
    }

    /* --- THEME OVERRIDES FOR FOOTER --- */
    /* Ensures footer text is visible on dark backgrounds like in the balanced theme */
    body.theme-balanced .footer .footer-title,
    body.theme-balanced .footer .footer-text,
    body.theme-balanced .footer .footer-link,
    body.theme-balanced .footer .copyright {
        color: #d1d5db; /* A light grey color */
    }

    body.theme-balanced .footer .footer-link:hover,
    body.theme-balanced .footer .footer-social-link:hover {
        color: #a5b4fc; /* A lighter accent color for hover */
    }
</style>

<!-- Footer -->
<footer class="footer">
    <div class="footer-container">
        <!-- About Us Section -->
        <div>
            <h3 class="footer-title">About Us</h3>
            <p class="footer-text">
                HireHeaven is the fastest way to find your next career. We connect talented professionals with leading companies worldwide.
            </p>
        </div>

        <!-- Contact Section -->
        <div>
            <h3 class="footer-title">Contact</h3>
            <ul class="footer-list">
                <li><span class="footer-text">Email:</span> <a href="mailto:info@hireheaven.com" class="footer-link">info@hireheaven.com</a></li>
                <li><span class="footer-text">Phone:</span> <a href="tel:123-456-7890" class="footer-link">123-456-7890</a></li>
            </ul>
        </div>

        <!-- Quick Links Section -->
        <div>
            <h3 class="footer-title">Quick Links</h3>
            <ul class="footer-list">
                <li><a href="#" class="footer-link">Privacy Policy</a></li>
                <li><a href="#" class="footer-link">Terms & Conditions</a></li>
                <li><a href="AboutUs.aspx" class="footer-link">About Us</a></li>
            </ul>
        </div>

        <!-- Follow Us Section -->
        <div>
            <h3 class="footer-title">Follow Us</h3>
            <div class="footer-social-links">
                <a href="#" class="footer-social-link">Facebook</a>
                <a href="#" class="footer-social-link">Twitter</a>
                <a href="#" class="footer-social-link">LinkedIn</a>
            </div>
        </div>
    </div>
    <div class="copyright">
        &copy; 2025 HireHeaven. All Rights Reserved.
    </div>
</footer>
