# Test Files

**Verification and testing resources for emacs-r-devkit**

---

## 📋 Files

### Test Scripts

1. **[test-features.R](test-features.R)**
   - Interactive feature testing for all emacs-r-devkit capabilities
   - Tests ESS, Flycheck, LSP, Company, Roxygen2, and more
   - Run in Emacs to verify environment setup

2. **[test-roxygen.R](test-roxygen.R)**
   - Roxygen skeleton generation testing
   - Tests parameter detection with complex function signatures
   - Validates roxygen insertion functionality

### Checklists

3. **[TEST-CHECKLIST.md](TEST-CHECKLIST.md)**
   - Comprehensive verification checklist
   - Systematic testing procedure
   - Covers all features and integrations

---

## 🚀 Usage

### Run Interactive Tests

```bash
# Open test file in Emacs
emacs tests/test-features.R

# In Emacs:
# 1. Start R console: M-x R
# 2. Execute code blocks with C-RET
# 3. Verify each feature works as expected
```

### Run Roxygen Tests

```bash
# Open roxygen test file
emacs tests/test-roxygen.R

# In Emacs:
# 1. Place cursor on function
# 2. Insert roxygen: C-c r r
# 3. Verify parameters detected correctly
```

### Follow Checklist

```bash
# View checklist
cat tests/TEST-CHECKLIST.md

# Or open in Emacs
emacs tests/TEST-CHECKLIST.md
```

---

## ✅ What to Test

### Core Features
- ESS integration and R console
- Flycheck with lintr and styler
- LSP mode (go to definition, find references)
- Company completion
- Roxygen2 skeleton generation

### Advanced Features
- Auto-formatting with styler
- S7 snippets
- Git integration (Magit)
- Project management (Projectile)

### macOS Integration
- GUI Emacs PATH setup
- Option key as Meta
- Command key bindings

---

## 📚 Related

**Main documentation:** [emacs-r-devkit](../)
**Troubleshooting:** [guides/TROUBLESHOOTING.md](../guides/TROUBLESHOOTING.md)
**Configuration:** [docs_mkdocs/configuration.md](../docs_mkdocs/configuration.md)

---

**Last Updated:** 2025-12-07
