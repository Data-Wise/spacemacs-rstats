# Assets

**Images, screenshots, and media files for emacs-r-devkit**

---

## 📁 Directory Structure

```
assets/
└── screenshots/         # Project screenshots
    ├── Screenshot *.png
    └── ...
```

---

## 📸 Screenshots

Screenshots demonstrating emacs-r-devkit features and interface:

- **UI demonstrations** - Emacs interface with R development setup
- **Feature highlights** - Specific features in action
- **Configuration examples** - Settings and customization

### Usage

Screenshots are referenced in:
- README.md
- Documentation site (docs_mkdocs/)
- GitHub Issues and discussions
- Tutorial and guides

---

## 🖼️ Adding New Assets

### Screenshots

```bash
# 1. Take screenshot (macOS)
# Cmd+Shift+4 for selection
# Cmd+Shift+5 for screen recording

# 2. Add to assets/screenshots/
mv ~/Desktop/screenshot.png assets/screenshots/feature-name.png

# 3. Reference in docs
![Feature Name](assets/screenshots/feature-name.png)
```

### Naming Convention

Use descriptive names:
- `feature-<name>.png` - Feature demonstrations
- `ui-<component>.png` - UI components
- `config-<setting>.png` - Configuration examples
- `error-<issue>.png` - Error messages for troubleshooting

### Best Practices

- **Resolution:** High enough to read text (1x or 2x retina)
- **Format:** PNG for screenshots (lossless)
- **Size:** Optimize before committing (<500KB if possible)
- **Content:** Show relevant features clearly
- **Privacy:** No personal information in screenshots

---

## 🔗 Related

**Main project:** [emacs-r-devkit](../)
**Documentation:** [docs_mkdocs/](../docs_mkdocs/)
**Guides:** [guides/](../guides/)

---

**Last Updated:** 2025-12-07
