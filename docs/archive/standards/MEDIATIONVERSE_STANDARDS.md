# MediationVerse Documentation Standards

**Standardized pkgdown documentation for the MediationVerse R package ecosystem**

This document defines the pkgdown configuration standards for all MediationVerse packages, based on existing mediationverse, medfit, and other package configurations.

---

## 🎨 Established Design System

### Theme Configuration (All Packages)

**Consistent across entire ecosystem:**

```yaml
template:
  bootstrap: 5
  bootswatch: litera
  bslib:
    # Academic blue (consistent across ecosystem)
    primary: "#0054AD"
    bg: "#ffffff"
    fg: "#212529"
    # Modern, readable fonts
    base_font: { google: "Inter" }
    heading_font: { google: "Montserrat" }
    code_font: { google: "Fira Code" }
    font-size-base: 0.925rem
```

**For packages with mathematical notation:**
```yaml
template:
  math-rendering: mathjax
  includes:
    in_header: pkgdown/mathjax-config.html
```

### Color Scheme

- **Primary**: `#0054AD` (Academic Blue) - Used for all packages
- **Background**: `#ffffff` (White)
- **Foreground**: `#212529` (Dark Gray)
- **Fonts**: Inter (body), Montserrat (headings), Fira Code (code)

**Rationale**: Consistent professional academic appearance across all packages in ecosystem.

---

## 📋 Standard Navigation Structure

### Navbar Components (All Packages)

```yaml
navbar:
  structure:
    left:  [home, reference, articles, ecosystem, status, news]
    right: [search, github]

  components:
    home:
      icon: fas fa-home fa-lg
      href: index.html
      aria-label: Home

    reference:
      text: Reference
      href: reference/index.html

    articles:
      text: Articles
      menu:
      - text: "Getting Started"
        href: articles/getting-started.html
      - text: "─────────────"
      - text: "Detailed Guides"
      - text: "[Package-specific articles]"

    ecosystem:
      text: Ecosystem
      menu:
      - text: "Core Packages"
      - text: "mediationverse (Meta-package)"
        href: https://data-wise.github.io/mediationverse/
      - text: "medfit (Foundation)"
        href: https://data-wise.github.io/medfit/
      - text: "probmed (P_med Effect Size)"
        href: https://data-wise.github.io/probmed/
      - text: "RMediation (Confidence Intervals)"
        href: https://data-wise.github.io/rmediation/
      - text: "medrobust (Sensitivity Analysis)"
        href: https://data-wise.github.io/medrobust/
      - text: "─────────────"
      - text: "Support Packages"
      - text: "medsim (Simulation Infrastructure)"
        href: https://data-wise.github.io/medsim/

    status:
      icon: fas fa-chart-line
      text: Status
      menu:
      - text: "📊 Package Status Dashboard"
        href: https://github.com/Data-Wise/mediationverse/blob/main/STATUS.md
      - text: "🗺️ Development Roadmap"
        href: articles/roadmap.html
      - text: "🤝 Contributing Guide"
        href: articles/contributing.html
      - text: "─────────────"
      - text: "📋 Ecosystem Coordination"
        href: https://github.com/Data-Wise/medfit/blob/main/planning/ECOSYSTEM.md

    news:
      text: News
      href: news/index.html

    github:
      icon: fab fa-github fa-lg
      href: https://github.com/Data-Wise/[packagename]
      aria-label: GitHub
```

**Key Points:**
- **Ecosystem menu** - Links to all related packages
- **Status menu** - Development transparency
- **Consistent order** - Same navigation across all packages
- **Icons** - Font Awesome for visual clarity

---

## 🏠 Homepage Structure

### Standard home configuration:

```yaml
home:
  title: "[packagename]: [Tagline]"
  description: >
    Detailed description (2-3 sentences) explaining what the package does,
    how it fits in the ecosystem, and key features.

  sidebar:
    structure: [links, license, citation, authors, dev]

  links:
  - text: "Source Code"
    href: https://github.com/Data-Wise/[packagename]
  - text: "Report Issues"
    href: https://github.com/Data-Wise/[packagename]/issues
  - text: "Request Feature"
    href: https://github.com/Data-Wise/[packagename]/issues/new
```

### Logo Configuration

**All packages should have a logo:**

```yaml
logo:
  image: man/figures/logo.png
  align: right
  width: 350px
```

**Best practice**:
- Create logo with `hexSticker` package
- Store at `man/figures/logo.png`
- Consistent size: 350px width

---

## 📚 Articles Organization

### Required Articles (All Packages)

1. **getting-started.html** (Main introduction)
   - Installation
   - Quick example
   - Basic workflow
   - Links to other articles

2. **Package-specific guides** (varies by package)

### Standard Articles Structure

```yaml
articles:
  text: Articles
  menu:
  - text: "Getting Started"
    href: articles/getting-started.html
  - text: "─────────────"
  - text: "Detailed Guides"
  - text: "[Article 1 Name]"
    href: articles/[article-1].html
  - text: "[Article 2 Name]"
    href: articles/[article-2].html
```

**For mediationverse (meta-package):**
```yaml
articles:
  text: Articles
  menu:
  - text: "Getting Started"
    href: articles/getting-started.html
  - text: "─────────────"
  - text: "Ecosystem Overview"
  - text: "mediationverse Workflow"
    href: articles/mediationverse-workflow.html
```

---

## 🔗 Function Reference Organization

### Standard Organization Pattern

```yaml
reference:
  - title: "Main Functions"
    desc: "Core user-facing functions"
    contents:
      - has_concept("main")

  - title: "S7 Classes"
    desc: "S7 class definitions"
    contents:
      - has_concept("s7-classes")

  - title: "Methods"
    desc: "S7 methods for classes"
    contents:
      - has_concept("methods")

  - title: "Helper Functions"
    desc: "Supporting utilities"
    contents:
      - has_concept("helpers")

  - title: "Data"
    desc: "Included datasets"
    contents:
      - has_type("data")

  - title: "Package Documentation"
    desc: "Package-level documentation"
    contents:
      - "[packagename]-package"
```

**For mediationverse (meta-package):**
```yaml
reference:
  - title: "Package Management"
    desc: "Functions for managing the mediationverse ecosystem"
    contents:
      - mediationverse_packages
      - mediationverse_update
      - mediationverse_conflicts

  - title: "Package Documentation"
    desc: "Package-level documentation"
    contents:
      - mediationverse-package
```

---

## 👤 Author Configuration

### Standard Format

```yaml
authors:
  Davood Tofighi:
    href: "https://orcid.org/0000-0001-8523-7776"
    html: "<img src='https://orcid.org/sites/default/files/images/orcid_16x16.png' height='16' width='16' alt='ORCID iD icon'> Davood Tofighi"
```

**Include ORCID icon and link for all authors.**

---

## 🔧 Development Configuration

```yaml
development:
  mode: auto
  version_label: default
  version_tooltip: "Development version"
```

---

## 🦶 Footer Configuration

```yaml
footer:
  structure:
    left: [developed_by, built_with]
    right: [package_version]
  components:
    package_version: "Version {version}"
    developed_by: |
      Developed by [Davood Tofighi](https://orcid.org/0000-0001-8523-7776)
    built_with: |
      Built with [pkgdown](https://pkgdown.r-lib.org/)
```

---

## 📦 Package-Specific Templates

### Meta-Package (mediationverse)

**Purpose**: Load entire ecosystem with one `library()` call

**Key Features:**
- Links to all core packages
- Ecosystem workflow article
- Package management functions
- Status dashboard

**Navigation emphasis**: Ecosystem menu

### Foundation Package (medfit)

**Purpose**: Core infrastructure for mediation analysis

**Key Features:**
- S7 class system
- Model extraction
- Bootstrap inference
- Mathematical notation support

**Navigation emphasis**: Articles with detailed guides

### Specialized Packages (probmed, medrobust, etc.)

**Purpose**: Specific methodological contributions

**Key Features:**
- Links back to foundation (medfit)
- Links to meta-package (mediationverse)
- Specialized vignettes
- Integration examples

---

## 🔗 Cross-Package Integration

### Ecosystem Menu (Required for All Packages)

**All packages MUST include the complete ecosystem menu** linking to:

1. **mediationverse** - Meta-package (always first)
2. **Core packages**:
   - medfit (Foundation)
   - probmed (Effect sizes)
   - RMediation (Confidence intervals)
   - medrobust (Sensitivity)
3. **Support packages**:
   - medsim (Simulation)

**Rationale**: Users can easily navigate between related packages.

### Status Menu (Required for All Packages)

Links to:
- Package Status Dashboard
- Development Roadmap (if exists)
- Contributing Guide
- Ecosystem Coordination

---

## 📝 Roxygen Documentation Standards

### Function Documentation Template

```r
#' Brief title (one line, sentence case)
#'
#' @description
#' Detailed description. Can use markdown **formatting**.
#' Mathematical notation: \eqn{a + b} for inline, \deqn{...} for display.
#'
#' @param x Description of parameter. Reference other functions
#'   with [other_function()].
#' @param y Another parameter.
#'
#' @return
#' Description of return value. Be specific about S7 classes.
#'   For S7 objects, use `[S7_class]` to link to class documentation.
#'
#' @export
#'
#' @family mediation_models  # Groups related functions
#' @concept main             # For pkgdown reference organization
#'
#' @examples
#' # Basic usage
#' result <- my_function(x = 1, y = 2)
#'
#' # With S7 object
#' model <- medfit::mediate(...)
#' extract_result <- my_function(model)
#'
#' @references
#' MacKinnon, D. P. (2008). *Introduction to Statistical Mediation Analysis*.
#' Taylor & Francis.
```

### S7 Class Documentation

```r
#' S7 class for [purpose]
#'
#' @description
#' This S7 class represents [what it represents].
#'
#' @slot slot1 [type] Description
#' @slot slot2 [type] Description
#'
#' @export
#' @concept s7-classes
#'
#' @examples
#' # Create instance (if user-facing)
#' obj <- new_my_class(...)
```

### Concept Tags for Organization

Use these `@concept` tags consistently:

- `@concept main` - Main user-facing functions
- `@concept helpers` - Helper utilities
- `@concept s7-classes` - S7 class definitions
- `@concept methods` - S7 methods
- `@concept internal` - Internal functions (not exported)

---

## 📄 README Standards

### Structure

```markdown
# packagename <img src="man/figures/logo.png" align="right" height="139" alt="" />

> One-line tagline

<!-- badges: start -->
[![R-CMD-check](badge)](link)
[![Codecov](badge)](link)
[![CRAN status](badge)](link)
[![Lifecycle: [stage]](badge)](link)
[![License: MIT](badge)](link)
<!-- badges: end -->

## Overview

2-3 paragraph overview of package purpose and place in ecosystem.

## Installation

### Development version

```r
# install.packages("pak")
pak::pkg_install("Data-Wise/packagename")
```

## Quick Example

```r
library(packagename)

# Minimal working example
```

## Ecosystem

Part of the [mediationverse](https://data-wise.github.io/mediationverse/) ecosystem.

**Core packages:**
- [medfit](https://data-wise.github.io/medfit/) - Foundation
- [probmed](https://data-wise.github.io/probmed/) - Effect sizes
- [RMediation](https://data-wise.github.io/rmediation/) - Confidence intervals
- [medrobust](https://data-wise.github.io/medrobust/) - Sensitivity

## Documentation

- [Get Started](https://data-wise.github.io/packagename/articles/getting-started.html)
- [Function Reference](https://data-wise.github.io/packagename/reference/)
- [Changelog](https://data-wise.github.io/packagename/news/)

## Citation

```r
citation("packagename")
```

## License

MIT © Davood Tofighi
```

---

## 🚀 Integration with Development Workflow

### Using with Existing Aliases

The user has comprehensive R package development aliases (see `r-package-development.md` skill):

```bash
# Documentation
rdoc                    # Generate docs from roxygen
rpkgdown               # Build pkgdown site
rpkgpreview            # Preview site locally

# Development cycle
rdev                   # Full cycle: doc → test → check

# Git workflow with validation
rpkgcommit "message"   # Doc, test, style, commit
```

**Workflow:**
1. Update roxygen comments in R files
2. Run `rdoc` to regenerate documentation
3. Run `rpkgdown` to build site
4. Review with `rpkgpreview`
5. Commit with `rpkgcommit "Update documentation"`

---

## ✅ Checklist for Each Package

Before publishing package website:

- [ ] `_pkgdown.yml` uses standard template
- [ ] Academic blue color (`#0054AD`)
- [ ] Litera bootswatch theme
- [ ] Logo at `man/figures/logo.png`
- [ ] Complete ecosystem menu with all packages
- [ ] Status menu with roadmap/contributing
- [ ] getting-started.html article exists
- [ ] Function reference organized with @concept tags
- [ ] README follows standard structure
- [ ] All cross-package links working
- [ ] MathJax configured (if needed)
- [ ] ORCID in author section
- [ ] GitHub Actions for pkgdown deployment
- [ ] Site deployed to `https://data-wise.github.io/packagename/`

---

## 📊 Package Roles in Ecosystem

| Package | Role | Navigation Focus |
|---------|------|------------------|
| **mediationverse** | Meta-package | Ecosystem overview, workflow |
| **medfit** | Foundation | Technical details, S7 classes |
| **probmed** | Effect sizes | Methodology, examples |
| **RMediation** | Confidence intervals | Statistical methods |
| **medrobust** | Sensitivity | Robustness checks |
| **medsim** | Simulation | Infrastructure, utilities |

**All packages**: Complete ecosystem navigation, consistent styling.

---

## 🎯 Where to Store This Standard

**Recommended location**:

```
~/R-packages/active/mediationverse/
├── _pkgdown.yml                    # Actual config
├── .github/
│   └── MEDIATIONVERSE_STANDARDS.md # This file
└── README.md
```

**Alternative**:
```
~/R-packages/active/medfit/planning/
├── ECOSYSTEM.md
└── DOCUMENTATION_STANDARDS.md      # This file
```

**Rationale**:
- Lives with the ecosystem code
- Easy reference when updating any package
- Versioned with git
- Linked from STATUS.md

---

**Version**: 1.0
**Last Updated**: 2025-12-07
**Based on**: Existing mediationverse, medfit, rmediation configurations
**Integrates with**: r-package-development.md workflow
