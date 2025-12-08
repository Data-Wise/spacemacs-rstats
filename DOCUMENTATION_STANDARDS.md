# Documentation Standardization Guide

**Consistent documentation structure across Data-Wise projects**

This document defines the standard navigation, content structure, and styling for all Data-Wise GitHub Pages documentation sites.

## 🎯 Goals

- **Consistency** - Users recognize the structure across projects
- **Discoverability** - Easy to find information
- **Professional** - Polished, cohesive brand
- **Maintainable** - Easy to update and extend

## 📋 Standard Navigation Structure

### Core Pages (Required)

Every project documentation should have these pages in this order:

```yaml
nav:
  - Home: index.md
  - Getting Started: getting-started.md
  - [Project-Specific Section]: ...
  - Configuration: configuration.md
  - Troubleshooting: troubleshooting.md
  - Contributing: contributing.md
```

### Project-Specific Sections

Between "Getting Started" and "Configuration", insert project-specific content:

**For Tool/Library Projects:**
```yaml
  - Features: features.md
  - API Reference: api-reference.md
  - Examples: examples.md
```

**For Workflow/Framework Projects (⭐ Recommended Pattern - claude-r-dev):**
```yaml
nav:
  - Home: index.md
  - Getting Started: getting-started.md
  - Commands Reference: commands-reference.md
  - Profiles: profiles.md
  - Configuration: configuration.md
  - Customization: customization.md
  - Tutorials:
      - Overview: tutorials/index.md
      - R Package Development: tutorials/r-package-development.md
      - Mediation Analysis: tutorials/mediation-analysis.md
      - Causal Inference: tutorials/causal-inference.md
      - Survival Analysis: tutorials/survival-analysis.md
  - Contributing: contributing.md
```

**Key Features of This Pattern:**
- **Clear progression:** Getting Started → Core Features (Commands, Profiles) → Advanced (Customization)
- **Specialized Tutorials dropdown:** Domain-specific learning paths (R Package Dev, Mediation, etc.)
- **Descriptive names:** "Commands Reference" is clearer than just "Reference"
- **Logical grouping:** Configuration separate from Customization (schema vs. user customization)

**For Configuration Projects:**
```yaml
  - Keybindings Reference: keybindings.md
  - Customization: customization.md
  - Testing: testing.md
```

## 📄 Standard Page Templates

### 1. Home (index.md)

**Required Sections:**
```markdown
# Project Name

**One-line tagline**

[Badges]

---

## ✨ Features

- Feature 1
- Feature 2
...

## 🚀 Quick Start

Installation/setup

## 📚 Documentation

Links to main docs pages

## 🤝 Contributing

## 📄 License

## 🙏 Acknowledgments
```

**Visual Elements:**
- Feature grid/cards (if using Material)
- Badges at top
- Quick start with tabs or code blocks
- Table of key capabilities

### 2. Getting Started

**Required Sections:**
```markdown
# Getting Started

## Prerequisites
## Installation
## First Steps / Quick Tutorial
## Verification
## Next Steps
## Common Issues
```

**Best Practices:**
- Step-by-step with code blocks
- Prerequisites clearly listed
- Expected outcomes for each step
- Links to troubleshooting

### 3. Configuration

**Required Sections:**
```markdown
# Configuration

## Overview
## Common Customizations
## Advanced Configuration
## Configuration Examples
## Environment Variables (if applicable)
```

### 4. Troubleshooting

**Required Sections:**
```markdown
# Troubleshooting

## Quick Diagnosis
## [Category 1] Issues
## [Category 2] Issues
## Getting Help
## Common Error Messages
```

**Best Practices:**
- Symptom → Diagnosis → Solution format
- Code examples for solutions
- Links to related documentation

### 5. Contributing

**Standard Template:**
Use CONTRIBUTING.md from main repository as basis
- How to contribute
- Development workflow
- Code style guidelines
- Testing requirements
- PR process

## 🎨 Standard Styling & Theming

### MkDocs Material Theme Configuration

**Standard Base Configuration:**

```yaml
theme:
  name: material
  palette:
    # Dark mode (default)
    - media: "(prefers-color-scheme: dark)"
      scheme: slate
      primary: indigo
      accent: purple
      toggle:
        icon: material/brightness-4
        name: Switch to light mode
    # Light mode
    - media: "(prefers-color-scheme: light)"
      scheme: default
      primary: indigo
      accent: purple
      toggle:
        icon: material/brightness-7
        name: Switch to dark mode
  features:
    - navigation.instant
    - navigation.tracking
    - navigation.tabs
    - navigation.sections
    - navigation.top
    - search.suggest
    - search.highlight
    - content.code.copy
    - content.tabs.link
  icon:
    repo: fontawesome/brands/github
```

**Color Schemes by Project Type:**

- **Development Tools** - `primary: indigo, accent: purple`
- **Statistical Projects** - `primary: blue, accent: teal`
- **Workflows** - `primary: deep-purple, accent: amber`
- **Utilities** - `primary: green, accent: light-green`

### Standard Markdown Extensions

```yaml
markdown_extensions:
  - abbr
  - admonition
  - attr_list
  - def_list
  - footnotes
  - md_in_html
  - toc:
      permalink: true
  - pymdownx.arithmatex:
      generic: true
  - pymdownx.betterem:
      smart_enable: all
  - pymdownx.caret
  - pymdownx.details
  - pymdownx.emoji:
      emoji_index: !!python/name:material.extensions.emoji.twemoji
      emoji_generator: !!python/name:material.extensions.emoji.to_svg
  - pymdownx.highlight:
      anchor_linenums: true
      line_spans: __span
      pygments_lang_class: true
  - pymdownx.inlinehilite
  - pymdownx.keys
  - pymdownx.mark
  - pymdownx.smartsymbols
  - pymdownx.superfences:
      custom_fences:
        - name: mermaid
          class: mermaid
          format: !!python/name:pymdownx.superfences.fence_code_format
  - pymdownx.tabbed:
      alternate_style: true
  - pymdownx.tasklist:
      custom_checkbox: true
  - pymdownx.tilde
```

## 🔗 Cross-Project Navigation

### Footer with Project Links

**Add to every site:**

```yaml
extra:
  social:
    - icon: fontawesome/brands/github
      link: https://github.com/Data-Wise

  # Cross-project navigation
  projects:
    - name: emacs-r-devkit
      description: Emacs environment for R development
      url: https://data-wise.github.io/emacs-r-devkit/
    - name: claude-r-dev
      description: AI-powered R package development
      url: https://data-wise.github.io/claude-r-dev/
    # Add more projects...
```

**Create custom footer template:**

`overrides/partials/footer.html`:
```html
{% extends "base.html" %}

{% block footer %}
  {{ super() }}
  <div class="md-footer-meta__inner md-grid">
    <div class="md-footer-projects">
      <h4>Other Data-Wise Projects</h4>
      <ul>
        {% for project in config.extra.projects %}
          {% if project.name != config.site_name %}
            <li>
              <a href="{{ project.url }}">{{ project.name }}</a> - {{ project.description }}
            </li>
          {% endif %}
        {% endfor %}
      </ul>
    </div>
  </div>
{% endblock %}
```

## 📦 Shared Configuration Strategy

### Option 1: Shared Base Configuration File

Create `mkdocs-base.yml` in a shared repository:

```yaml
# mkdocs-base.yml - Shared base configuration
theme:
  name: material
  palette:
    # [Standard palette configuration]
  features:
    # [Standard features]

markdown_extensions:
  # [Standard extensions]

plugins:
  - search
  - minify:
      minify_html: true

extra:
  social:
    - icon: fontawesome/brands/github
      link: https://github.com/Data-Wise
```

**In each project's mkdocs.yml:**

```yaml
INHERIT: https://raw.githubusercontent.com/Data-Wise/docs-config/main/mkdocs-base.yml

site_name: Project Name
site_description: Project description
site_url: https://data-wise.github.io/project-name/

nav:
  # Project-specific navigation
```

### Option 2: Template Repository

Create `data-wise/docs-template` repository with:
```
docs-template/
├── mkdocs.yml (template)
├── docs_mkdocs/
│   ├── index.md (template)
│   ├── getting-started.md (template)
│   ├── configuration.md (template)
│   ├── troubleshooting.md (template)
│   └── contributing.md (template)
├── .github/
│   └── workflows/
│       └── mkdocs.yml (standard workflow)
└── README.md
```

**Use GitHub's template repository feature:**
- Create new docs from template
- Customize project-specific sections
- Keep standard structure

## 🎯 Standard Homepage Elements

### Hero Section

```markdown
# Project Name

**Concise value proposition in one line**

[![License](badge)](link)
[![Release](badge)](link)
[![Stars](badge)](link)
[![Docs](badge)](link)
[![CI](badge)](link)
[Project-specific badges]
```

### Feature Grid

```markdown
## ✨ Features

<div class="grid cards" markdown>

- :material-icon:{ .lg .middle } **Feature Name**

    ---

    Feature description

[Repeat for 4-8 features]

</div>
```

### Quick Start Tabs

```markdown
## 🚀 Quick Start

=== "Installation"

    ```bash
    # Installation commands
    ```

=== "First Steps"

    ```bash
    # First steps
    ```

=== "Verification"

    ```bash
    # Verification
    ```
```

## 📊 Standard Badges

**Required Badges (in order):**

1. License
2. Release/Version
3. GitHub Stars
4. Documentation Status
5. CI/Build Status

**Project-Specific Badges:**

6. Language version (R, Python, etc.)
7. Platform (macOS, Linux, etc.)
8. Dependencies
9. Code coverage (optional)

## 🗂️ Standard Directory Structure

```
project-name/
├── mkdocs.yml
├── docs_mkdocs/
│   ├── index.md
│   ├── getting-started.md
│   ├── [project-specific].md
│   ├── configuration.md
│   ├── troubleshooting.md
│   ├── contributing.md
│   ├── assets/
│   │   ├── images/
│   │   └── stylesheets/
│   └── tutorials/ (optional)
│       ├── index.md
│       └── [tutorial-name].md
├── .github/
│   └── workflows/
│       └── mkdocs.yml
└── README.md
```

## ✍️ Writing Style Guide

### Consistency

- **Headings**: Sentence case ("Getting started" not "Getting Started")
- **Code blocks**: Always specify language
- **Links**: Descriptive text, not "click here"
- **Voice**: Second person ("you" not "we")
- **Tense**: Present tense for features, imperative for instructions

### Content Formatting Patterns (⭐ claude-r-dev style)

**For Command/Function/Feature Documentation:**

Use this consistent structure:

```markdown
### command_name

**Usage:**
```
command_name [arguments]
```

**What it does:**
- Step 1 of what happens
- Step 2 of what happens
- Step 3 of what happens

**When to use:**
Practical context explaining the use case and scenarios where this command is appropriate.

**Example:**
```language
# Concrete example with inline comments
command_name "descriptive argument"
```
```

**Why this works:**
- **Scannable:** Bold labels ("Usage:", "What it does:") help users quickly find information
- **Practical:** "When to use" provides context beyond just syntax
- **Consistent:** Same structure across all commands/functions
- **Progressive:** Usage → Behavior → Context → Example

---

**For Getting Started pages:**

```markdown
## Section Name

Brief introduction to this section.

### Subsection (Option 1: Recommended)

Step-by-step instructions:

1. First step with command:
   ```bash
   command here
   ```

2. Second step with explanation

3. Third step

### Subsection (Option 2: Alternative)

Alternative approach for different use cases.
```

---

**Quick Reference Tables:**

End reference pages with a summary table:

```markdown
## Quick Reference

| Item | Description |
|------|-------------|
| command1 | Brief purpose |
| command2 | Brief purpose |
```

---

### Formatting Elements

**Admonitions (use sparingly):**
```markdown
!!! tip "Pro Tip"
    Helpful advice

!!! warning "Important"
    Critical information

!!! info "Note"
    Additional context

!!! failure "Common Mistake"
    What to avoid
```

**Note:** claude-r-dev minimizes admonitions for cleaner appearance. Use only when truly necessary.

---

**Code Examples:**
```markdown
=== "Tab 1"
    Code for option 1

=== "Tab 2"
    Code for option 2
```

**Keyboard Shortcuts:**
```markdown
Press ++ctrl+c++ to cancel
Use ++option+x++ for Meta-x
```

**Inline Code with Context:**
```markdown
Use the `/project:init` command to initialize a new project.
```

**Code Blocks with Comments:**
```markdown
```bash
# Install dependencies
npm install

# Run development server
npm run dev
```
```

## 🔄 Implementation Checklist

For each new documentation site:

- [ ] Use standard navigation structure
- [ ] Include all required pages
- [ ] Apply standard theme configuration
- [ ] Add standard badges to homepage
- [ ] Use feature grid on homepage
- [ ] Include quick start tabs
- [ ] Add cross-project links in footer
- [ ] Use consistent writing style
- [ ] Apply standard markdown extensions
- [ ] Set up standard CI/CD workflow
- [ ] Add to Data-Wise project list

## 📝 Maintenance

### Quarterly Review

- Update cross-project links
- Refresh screenshots
- Update version badges
- Check for broken links
- Sync theme with latest Material updates

### When Adding New Projects

1. Add to `extra.projects` in all sites
2. Update shared configuration if needed
3. Create entry in Data-Wise org README
4. Add to GitHub org pinned repositories

## 🎨 Customization Guidelines

**Allowed Customizations:**
- Color scheme (within Material palette)
- Logo and favicon
- Project-specific navigation sections
- Additional pages beyond core set
- Custom CSS (in assets/stylesheets/)

**Discouraged:**
- Different theme framework
- Different navigation pattern
- Different page templates
- Different badge styles

## 🌟 Reference Implementations

These projects exemplify the documentation standards:

### emacs-r-devkit (Configuration Project)
**URL:** https://data-wise.github.io/emacs-r-devkit/

**Exemplifies:**
- Complete standard navigation structure
- All required pages (Getting Started, Configuration, Troubleshooting, Contributing)
- Feature grid on homepage
- Quick start tabs
- Cross-project links
- Standard Material theme with dark/light mode
- Comprehensive keybindings and testing documentation

**Best for reference when:** Creating documentation for configuration/setup projects

---

### claude-r-dev (Framework Project) ⭐
**URL:** https://data-wise.github.io/claude-r-dev/

**Exemplifies:**
- Excellent top menu design with clear progression
- Specialized tutorials dropdown (R Package Dev, Mediation, Causal Inference, Survival)
- Descriptive navigation labels ("Commands Reference" vs generic "Reference")
- Logical separation: Configuration (schema) vs Customization (user guide)
- Domain-specific learning paths
- Clean, professional organization

**Best for reference when:** Creating documentation for frameworks, workflows, or tools with multiple use cases

**Why this pattern works:**
1. **User journey flow:** Getting Started → Core Features → Advanced Topics → Tutorials
2. **Discoverability:** Specialized tutorials help users find domain-specific guidance
3. **Clarity:** Descriptive menu items ("Commands Reference" is more informative than "API")
4. **Scalability:** Tutorials dropdown can expand with new domains without cluttering main nav

---

## 📊 Success Metrics

Documentation is standardized when:
- [ ] User can navigate any Data-Wise docs intuitively
- [ ] Cross-project discovery is easy
- [ ] Consistent visual brand
- [ ] Similar pages have similar structure
- [ ] Search works consistently across sites
- [ ] New users can find getting started within 5 seconds
- [ ] Tutorials/examples are discoverable via clear navigation

---

**Version:** 1.0
**Last Updated:** 2025-12-07
**Owner:** Data-Wise Organization
