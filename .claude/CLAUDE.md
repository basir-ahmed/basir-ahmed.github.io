# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a GitHub Pages personal profile website for Basir Ahmed (`basir-ahmed.github.io`). It is a static site with no build step, no framework, and no package manager.

## File Structure

```
index.html              — Main HTML (single-page, all sections)
css/styles.css          — All styles (CSS custom properties, responsive, dark/light theme)
js/main.js              — Theme toggle, mobile menu, navbar scroll, scroll-reveal, active nav, back-to-top
images/profile_photo.jpeg — Profile photo
images/favicon.svg      — SVG favicon (initials "BA" in brand blue)
images/apple-touch-icon.png — Apple touch icon for PWA
images/og-image.svg     — Open Graph social card template (needs PNG conversion for production)
images/certs/           — Certification badge images (PNG/SVG per cert)
  badge-anthropic-ccar.png
  badge-aws-sa-associate.png
  badge-oci-genai.png
  badge-aws-ai-practitioner.png
  badge-azure-fundamentals.svg
  badge-oracle-java-ocp.png
  badge-scrum-psm1.png
404.html                — Custom 404 error page
manifest.json           — PWA manifest
data/CV_Basir_Ahmed.pdf — Resume PDF (git-ignored; not linked in the site)
.gitignore              — Ignores /data/* and /*.ps1
```

## Serving the Site Locally

Open `index.html` directly in a browser, or use any static file server:

```bash
python -m http.server 8080
```

Then visit `http://localhost:8080`.

## Architecture & Conventions

- **No build toolchain** — plain HTML/CSS/JS, Google Fonts loaded via CDN (Inter).
- **Dark/light mode** — CSS custom properties (`--color-*`) switched by `data-theme="light|dark"` on `<html>`. Defaults to system preference via `prefers-color-scheme`; manual toggle persists to `localStorage`.
- **Responsive** — mobile-first breakpoints at 480px and 900px. Hamburger menu on mobile with slide transition.
- **Scroll animations** — elements with class `.reveal` fade in via `IntersectionObserver` (adds `.visible`), then unobserved for performance.
- **Navbar** — fixed with glassmorphism (semi-transparent + backdrop-filter), adds `.scrolled` class on scroll > 50px for shadow effect. Active nav link highlighted based on scroll position.
- **Accessibility** — `:focus-visible` styles, `prefers-reduced-motion` support, skip-to-content link, `<main>` landmark, `aria-expanded` on mobile menu, `aria-hidden` on decorative icons, proper heading hierarchy (h1 > h2 > h3), touch targets >= 44px.
- **SEO** — Open Graph + Twitter Card meta tags, JSON-LD structured data (Person schema), canonical URL, theme-color.
- **Performance** — passive scroll listeners, specific CSS transitions (not `all`), hover guards (`@media (hover: hover)`) to prevent sticky hover on touch devices.
- **Print styles** — `@media print` hides UI chrome and normalizes colors.

## Current Site Sections

1. **Hero** — photo, name, tagline ("Applied AI Architect & AWS Solution Architect"), summary, hero-stats row (21 yrs experience / 18+ yrs at TCS / 7 certifications), badge pills, CTA buttons (Get in Touch, LinkedIn)
2. **AI Focus Areas** (`#ai-focus`) — 4 cards: Agentic AI Systems, RAG Pipelines, LLM Solution Design, Cloud-Native AI on AWS
3. **Skills** (`#skills`, heading "Technical Expertise") — 6 cards: AI Architecture & Agentic AI, AWS Cloud, Languages & Frameworks, DevOps & IaC, Data & Middleware, Architecture
4. **Career** (`#career`) — role-progression list with TCS sub-roles (Applied AI Architect 2025–Present, AWS Solution Architect 2021–2025, Solution Architect 2017–2021, JEE Technical Architect 2013–2017, Technical Lead / Developer 2007–2013), netGuru, Karshan
5. **Certifications** (`#certifications`) — 7 badge-image cards: Claude Certified Architect CCAR-F, AWS SA Associate, OCI Generative AI Professional, AWS AI Practitioner, Azure Fundamentals, Oracle Java OCP, PSM I
6. **Awards** (`#awards`) — 3 award cards: Star Team Performer (2018), Best Team Performer (2008/2011/2017/2018), On the Spot Award (2008)
7. **Education** (`#education`) — two cards (ME Jadavpur University, B.Tech RCCIT)
8. **Contact** (`#contact`) — email, LinkedIn, phone
9. **Back-to-top** — fixed button appears after 300px scroll

Sections not yet added: **Testimonials/Recommendations**.

---

## Profile: Basir Ahmed

### Contact

- **Email:** mail2basir@gmail.com
- **Mobile:** +91 9836835357
- **LinkedIn:** https://www.linkedin.com/in/basir-ahmed
- **Photo:** `images/profile_photo.jpeg`

### Summary

21 years of software development experience. Currently a **Solution Architect at TCS** (since Oct 2007) specialising in **AWS Cloud, Generative AI / Agentic AI, React JS, Go, Java, Spring Boot, Docker, DevOps**. Designing enterprise-grade LLM solutions, agentic workflows, and RAG systems.

### Key Roles (chronological, most recent first)

- **Applied AI Architect** — current focus (LLM solutions, multi-agent systems, RAG pipelines on AWS)
- **AWS Solution Architect** — 2+ years (Hallmark Cards: Mainframe-to-AWS migration, CCDB/NCOA batch processing in Go)
- **Solution Architect** — 3+ years (various digital domains)
- **JEE Technical Architect** — 3+ years (MetLife, SunLife)
- **Java/JEE & ESB Technical Lead** — 4+ years (Marsh UK, Farmers Hawaii)
- **Java / React JS / Go Developer** — 4+ years

### Employment History

| Period              | Company                                  | Role               |
| ------------------- | ---------------------------------------- | ------------------ |
| Oct 2007 – present  | Tata Consultancy Services (TCS), Kolkata | Solution Architect |
| Jan 2006 – Oct 2007 | netGuru Ltd., Kolkata                    | Software Developer |
| Aug 2005 – Jan 2006 | Karshan Technologies, Kolkata            | Consultant         |

### Certifications

- Claude Certified Architect – Foundation (CCAR-F)
- AWS Certified Solutions Architect – Associate (score 834)
- Oracle Cloud Infrastructure Generative AI Professional
- AWS Certified AI Practitioner (score 776)
- Microsoft Azure Fundamentals (score 820)
- Oracle Certified Professional Java 6 Programmer – OCJP (score 98%)
- Scrum.org Professional Scrum Master I – PSM I (score 86.3%)

### Awards

- Star Team Performer — TCS 2018
- Best Team Performer — TCS 2008, 2011, 2017, 2018
- On the Spot Award — Insurance vertical, TCS 2008

### IT Skills

| Category            | Technologies                                                                                                                                 |
| ------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| AI / Agentic AI     | LLMs, RAG, Prompt Engineering, Multi-agent Systems, AI Orchestration Frameworks, Agent Communication Protocols, Claude / Bedrock             |
| Languages           | Java 8, Go 1.17, Python 3                                                                                                                    |
| Cloud               | AWS (VPC, ELB, EC2, Fargate, IAM, Lambda, Batch, API Gateway, ECS, S3, RDS, SQS, SNS, Kinesis, EventBridge, CloudWatch, Athena, ECR, Aurora) |
| IaC                 | Terraform                                                                                                                                    |
| Frameworks          | Spring Boot 2.1, Spring 5.2, Struts 1.3                                                                                                      |
| Web                 | React JS, Angular JS, jQuery, HTML5, JSP, Servlet, JSTL                                                                                      |
| Web Services        | SOAP, REST                                                                                                                                   |
| ORM                 | JPA with Hibernate                                                                                                                           |
| EAI/Middleware      | WebSphere ESB 7.5, Spring Integration 5.0, IBM MQ 6, MuleSoft                                                                                |
| App Servers         | WebSphere 8.5, Tomcat 9.0, JBoss EAP 6.4                                                                                                     |
| Databases           | Oracle 11g, MySQL 5.0, IBM DB2, Amazon Aurora                                                                                                |
| Version Control     | Git, GitHub, GitLab, CVS                                                                                                                     |
| IDEs                | VS Code, Eclipse, RAD, IBM Integration Designer                                                                                              |

### Education

| Year | Qualification                                                |
| ---- | ------------------------------------------------------------ |
| 2021 | ME (Software Engineering) — Jadavpur University, 80.42%      |
| 2004 | B.Tech (IT) — RCC Institute of Information Technology, 74.6% |

### Notable Projects (recent highlights)

- **CCDB Decoupling on AWS** (Hallmark, Apr 2022–present): Mainframe-to-AWS modernisation — Go, Lambda, Batch, Athena, EventBridge, Terraform, GitLab CI/CD.
- **NCOA Batch Process on AWS** (Hallmark, Dec 2021–Mar 2022): AWS batch migration from Mainframe using Go, Lambda, Aurora MySQL, Terraform.
- **MPPS 2.0** (Hallmark, Jul–Nov 2021): Legacy app modernisation with React JS, Redux, AWS S3/ECS.
- **HGS International** (Hallmark, Jan 2020–Aug 2021): Salesforce B2C Commerce Cloud storefront.
- **MGE Sign & Send** (Hallmark, Nov 2018–Dec 2019): MuleSoft APIs on AnyPoint/CloudHub.
- **DMZ Segmentation & RSA Remediation** (Hallmark, Dec 2016–Oct 2018): Enterprise security with PicketLink, AES-256, RSA-2048 on JBoss EAP.
- **Global Sales / Servicing Platform** (MetLife, 2014–2016): Multi-tenant, multi-lingual JEE platform deployed across USA, China, Gulf, Vietnam.

---

## Website Design Goals

- **Dark / light mode toggle** — CSS custom properties switched by `data-theme` on `<html>`. Default to system preference, manual toggle persists to localStorage.
- Sections currently implemented: **Hero**, **AI Focus Areas**, **Skills**, **Career**, **Certifications**, **Awards**, **Education**, **Contact**.
- Sections not yet added: **Testimonials/Recommendations**.
- Photo at `./images/profile_photo.jpeg`, CV at `./data/CV_Basir_Ahmed.pdf` (git-ignored, not served).
- Smooth scroll, scroll-reveal animations, responsive (mobile-first with breakpoints at 480px and 900px).
- Font: Inter (Google Fonts CDN).
- PWA manifest for "Add to Home Screen" on mobile.
- Custom 404 page.
