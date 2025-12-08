# R Package Documentation Standards

**Standardized documentation for Data-Wise R packages using pkgdown**

This document defines standards for R package documentation, complementing the main DOCUMENTATION_STANDARDS.md which covers project-level documentation.

## 🎯 Documentation Strategy

### Two-Tier Documentation Approach

**1. R Package Documentation (pkgdown)**
- Function reference
- Vignettes/Articles
- Package metadata
- Hosted at: `https://data-wise.github.io/package-name/`

**2. Project Documentation (MkDocs)** *(Optional for complex projects)*
- Ecosystem overview
- Multi-package workflows
- Tutorials spanning multiple packages
- Hosted at: `https://data-wise.github.io/project-name-docs/`

### When to Use What

| Type | Use MkDocs | Use pkgdown |
|------|------------|-------------|
| Single R package | No | Yes |
| R package ecosystem (multiple packages) | Yes (for overview) | Yes (for each package) |
| Development tools (non-R) | Yes | No |
| Workflows/frameworks | Yes | No |
| Configuration projects | Yes | No |

## 📦 Standard pkgdown Configuration

### File: `_pkgdown.yml`

**Standard Base Configuration:**

```yaml
url: https://data-wise.github.io/package-name/

template:
  bootstrap: 5
  bootswatch: flatly  # or: cosmo, lux, minty, sandstone

  params:
    # Data-Wise branding
    ganalytics: ~  # Add if using Google Analytics

  # Standard footer
  includes:
    in_header: |
      <!-- Google Analytics or other tracking -->

# Standard home page
home:
  title: Package Name
  description: >
    One-line package description

  sidebar:
    structure:
      - links
      - license
      - community
      - citation
      - authors
      - dev

  links:
    - text: Report a bug
      href: https://github.com/Data-Wise/package-name/issues
    - text: Changelog
      href: news/index.html

# Standard navigation
navbar:
  structure:
    left:  [home, intro, reference, articles, tutorials, news]
    right: [search, github]

  components:
    home:
      icon: fa-home fa-lg
      href: index.html

    intro:
      text: Get Started
      href: articles/package-name.html

    reference:
      text: Reference
      href: reference/index.html

    articles:
      text: Articles
      menu:
        - text: Introduction
          href: articles/package-name.html
        - text: -------
        - text: Advanced Topics
        - text: Topic 1
          href: articles/topic-1.html
        - text: Topic 2
          href: articles/topic-2.html

    tutorials:
      text: Tutorials
      menu:
        - text: Tutorial 1
          href: articles/tutorial-1.html

    news:
      text: Changelog
      href: news/index.html

    github:
      icon: fab fa-github fa-lg
      href: https://github.com/Data-Wise/package-name/

# Function reference organization
reference:
  - title: Main Functions
    desc: Core package functionality
    contents:
      - has_concept("main")

  - title: Helper Functions
    desc: Supporting utilities
    contents:
      - has_concept("helpers")

  - title: Data
    desc: Included datasets
    contents:
      - has_type("data")

# Articles organization
articles:
  - title: Getting Started
    navbar: ~
    contents:
      - package-name

  - title: Advanced Topics
    desc: In-depth guides
    contents:
      - topic-1
      - topic-2

  - title: Tutorials
    desc: Step-by-step workflows
    contents:
      - tutorial-1

# Development mode
development:
  mode: auto  # or release/devel
  destination: dev
  version_label: danger
  version_tooltip: "Development version"
```

### Standard Color Schemes

**By Package Type:**

```yaml
# Statistical Methods Package
template:
  bootswatch: cosmo
  params:
    primary: "#2780E3"      # Blue
    success: "#3FB618"      # Green

# Mediation/Causal Inference
template:
  bootswatch: flatly
  params:
    primary: "#7E57C2"      # Purple
    success: "#26A69A"      # Teal

# Survival Analysis
template:
  bootswatch: lux
  params:
    primary: "#F57C00"      # Orange
    success: "#388E3C"      # Green

# Utilities/Tools
template:
  bootswatch: minty
  params:
    primary: "#78C2AD"      # Mint
    success: "#56CC9D"      # Green
```

## 📝 Standard Vignette Structure

### Get Started Vignette

**File:** `vignettes/package-name.Rmd`

```yaml
---
title: "Getting Started with packagename"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Getting Started with packagename}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---
```

**Required Sections:**

1. **Installation**
2. **Quick Example** (minimal working example)
3. **Basic Usage** (common use cases)
4. **Next Steps** (links to other vignettes)

### Advanced Topic Vignettes

**Standard Structure:**

```markdown
# Vignette Title

## Overview
- What this vignette covers
- Prerequisites
- Time to complete

## Background
- Theoretical context
- When to use this approach

## Step-by-Step Guide
- Clear, numbered steps
- Code examples
- Expected output

## Advanced Usage
- Edge cases
- Customization options

## Troubleshooting
- Common issues
- Solutions

## References
- Related vignettes
- External resources
```

## 🏠 Standard README Structure

### For R Packages

```markdown
# packagename

> One-line description

[![R-CMD-check](badge)](link)
[![Codecov](badge)](link)
[![CRAN status](badge)](link)
[![Lifecycle](badge)](link)
[![License](badge)](link)

## Installation

### CRAN (stable release)

```r
install.packages("packagename")
```

### Development version

```r
# install.packages("remotes")
remotes::install_github("Data-Wise/packagename")
```

## Quick Example

```r
library(packagename)

# Minimal working example
```

## Features

- Feature 1
- Feature 2
- Feature 3

## Documentation

- [Get Started](https://data-wise.github.io/packagename/articles/packagename.html)
- [Function Reference](https://data-wise.github.io/packagename/reference/)
- [Changelog](https://data-wise.github.io/packagename/news/)

## Citation

```r
citation("packagename")
```

## Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](https://data-wise.github.io/packagename/CODE_OF_CONDUCT.html).

## License

MIT © Data-Wise
```

## 📋 Standard Package Files

### DESCRIPTION

```dcf
Package: packagename
Title: What the Package Does (One Line, Title Case)
Version: 0.1.0.9000
Authors@R:
    person("First", "Last", , "email@example.com", role = c("aut", "cre"),
           comment = c(ORCID = "YOUR-ORCID-ID"))
Description: What the package does (one paragraph).
License: MIT + file LICENSE
URL: https://data-wise.github.io/packagename/, https://github.com/Data-Wise/packagename
BugReports: https://github.com/Data-Wise/packagename/issues
Encoding: UTF-8
Roxygen: list(markdown = TRUE)
RoxygenNote: 7.3.0
Suggests:
    knitr,
    rmarkdown,
    testthat (>= 3.0.0)
VignetteBuilder: knitr
Config/testthat/edition: 3
```

### NEWS.md

```markdown
# packagename (development version)

## New Features

- Feature 1
- Feature 2

## Bug Fixes

- Fix 1

## Documentation

- Documentation improvement 1

---

# packagename 0.1.0

- Initial CRAN release
```

## 🎨 Standard Function Documentation

### Roxygen2 Template

```r
#' Brief title (one line)
#'
#' @description
#' More detailed description of what the function does.
#' Can span multiple lines and paragraphs.
#'
#' @param arg1 Description of arg1. Can reference other functions
#'   with [other_function()]. Use markdown **formatting**.
#' @param arg2 Description of arg2.
#'
#' @return
#' Description of return value. Be specific about structure.
#'   - For lists: describe each element
#'   - For data frames: describe columns
#'   - For S3/S7: describe class
#'
#' @export
#'
#' @family function_family
#' @seealso [related_function()]
#'
#' @examples
#' # Basic usage
#' result <- my_function(arg1 = 1, arg2 = "value")
#'
#' # Advanced usage
#' \dontrun{
#'   # This requires additional setup
#'   advanced_result <- my_function(arg1 = complex_data)
#' }
#'
#' @references
#' Author (Year). Title. *Journal*, Volume(Issue), pages.
#' DOI: 10.xxxx/xxxxx
my_function <- function(arg1, arg2 = "default") {
  # Implementation
}
```

### Standard Concepts (for grouping)

Use `@concept` tags for reference grouping:

```r
#' @concept main       # Main user-facing functions
#' @concept helpers    # Helper/utility functions
#' @concept internal   # Internal functions
#' @concept data       # Data documentation
#' @concept deprecated # Deprecated functions
```

## 🔗 Cross-Package Linking

### In pkgdown Sites

Link to other Data-Wise packages:

```yaml
# _pkddown.yml
template:
  params:
    # Related projects sidebar
    related_packages:
      - name: otherpkg
        url: https://data-wise.github.io/otherpkg/
        description: Related package description
```

### In Vignettes

```r
# Link to other package documentation
# See [otherpkg documentation](https://data-wise.github.io/otherpkg/)
# for more details on methodology.

# Cross-reference in code
library(otherpkg)
result <- otherpkg::function(data)
```

## 🌐 Integration with Project Documentation

### For Package Ecosystems

**Project MkDocs site** (e.g., `mediationverse-docs`):
```markdown
# MediationVerse

Ecosystem overview and tutorials

## Packages

- [mediator](https://data-wise.github.io/mediator/) - Core mediation
- [modmed](https://data-wise.github.io/modmed/) - Moderated mediation
- [serialmed](https://data-wise.github.io/serialmed/) - Sequential mediation
```

**Individual package pkgdown sites**:
- Link back to ecosystem site
- Reference other packages
- Provide package-specific details

## 📊 Standard Badges

**For CRAN Packages:**

```markdown
[![R-CMD-check](https://github.com/Data-Wise/pkg/workflows/R-CMD-check/badge.svg)](https://github.com/Data-Wise/pkg/actions)
[![Codecov](https://codecov.io/gh/Data-Wise/pkg/branch/main/graph/badge.svg)](https://codecov.io/gh/Data-Wise/pkg)
[![CRAN status](https://www.r-pkg.org/badges/version/pkg)](https://CRAN.R-project.org/package=pkg)
[![Downloads](https://cranlogs.r-pkg.org/badges/grand-total/pkg)](https://cran.r-project.org/package=pkg)
[![Lifecycle](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
```

**For Development Packages:**

```markdown
[![R-CMD-check](badge)](link)
[![Codecov](badge)](link)
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](lifecycle-link)
[![License: MIT](badge)](link)
```

## 🧪 Testing & CI Integration

### GitHub Actions Workflow

```yaml
# .github/workflows/pkgdown.yaml
name: pkgdown

on:
  push:
    branches: [main, master]
  pull_request:
    branches: [main, master]
  release:
    types: [published]
  workflow_dispatch:

jobs:
  pkgdown:
    runs-on: ubuntu-latest
    env:
      GITHUB_PAT: ${{ secrets.GITHUB_TOKEN }}
    steps:
      - uses: actions/checkout@v4

      - uses: r-lib/actions/setup-pandoc@v2

      - uses: r-lib/actions/setup-r@v2
        with:
          use-public-rspm: true

      - uses: r-lib/actions/setup-r-dependencies@v2
        with:
          extra-packages: any::pkgdown, local::.
          needs: website

      - name: Build site
        run: pkgdown::build_site_github_pages(new_process = FALSE, install = FALSE)
        shell: Rscript {0}

      - name: Deploy to GitHub pages 🚀
        if: github.event_name != 'pull_request'
        uses: JamesIves/github-pages-deploy-action@v4
        with:
          clean: false
          branch: gh-pages
          folder: docs
```

## ✅ Implementation Checklist

For each R package:

- [ ] Create `_pkgdown.yml` with standard configuration
- [ ] Add standard badges to README
- [ ] Create "Get Started" vignette
- [ ] Organize function reference with concepts
- [ ] Set up pkgdown GitHub Action
- [ ] Link to other Data-Wise packages
- [ ] Add to ecosystem documentation (if applicable)
- [ ] Use consistent color scheme
- [ ] Add NEWS.md with standard format
- [ ] Configure development mode properly

## 🎯 Quality Standards

**Every package should have:**

1. ✅ **README** with installation, example, features
2. ✅ **Get Started vignette** (<10 min read)
3. ✅ **Function reference** with examples
4. ✅ **NEWS.md** tracking changes
5. ✅ **Tests** with >80% coverage
6. ✅ **CI/CD** with R-CMD-check
7. ✅ **pkgdown site** deployed to gh-pages
8. ✅ **Consistent styling** across packages

---

**Version:** 1.0
**Last Updated:** 2025-12-07
**Companion:** DOCUMENTATION_STANDARDS.md
