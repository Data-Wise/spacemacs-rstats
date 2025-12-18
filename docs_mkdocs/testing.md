# Testing Guide

Verify your emacs-r-devkit installation is working correctly.

## Automated Test Suite

emacs-r-devkit includes a comprehensive 4-tier test suite with **59 tests** covering edge cases and error scenarios.

### Running All Tests

```bash
cd tests
./run_all_tests.sh
```

**Expected output:**

```text
╔════════════════════════════════════════════════════════╗
║  emacs-r-devkit Test Suite                            ║
╚════════════════════════════════════════════════════════╝

═══ Test Suite A: Documentation ═══
✅ Documentation tests PASSED (8/8)

═══ Test Suite B: Emacs Lisp ═══
✅ Emacs Lisp tests PASSED (25/25)

═══ Test Suite C: R Packages ═══
✅ R package tests PASSED (20/20)

═══ Test Suite D: Integration ═══
✅ Integration tests PASSED (6/6)

╔════════════════════════════════════════════════════════╗
║  ✅ ALL TESTS PASSED                                   ║
╚════════════════════════════════════════════════════════╝
```

### Test Tiers

#### Tier A: Documentation Tests (Python)

**8 tests** validating documentation quality:

- Link validation (internal/external)
- Markdown syntax checking
- Code block language specifiers
- **Edge cases:** Unclosed code blocks, missing images, invalid YAML
- MkDocs build verification
- Cross-reference validation

```bash
cd tests
python3 test_documentation.py
```

#### Tier B: Emacs Lisp Tests (ERT)

**25 tests** verifying Emacs functionality:

- Package loading (ESS, LSP, Flycheck, Company)
- Custom function availability (roxygen, styler, S7 helpers)
- Keybinding configuration
- **Edge cases:** Error handling, buffer states, invalid input
- Mode activation
- Integration tests

```bash
cd tests
./run_elisp_tests.sh
```

#### Tier C: R Package Tests (testthat)

**20 tests** checking R tooling:

- Required package availability
- Styler functionality
- Lintr code checking
- Roxygen2 parsing
- Language server availability
- **Edge cases:** Empty files, syntax errors, nonexistent files
- Helper script execution

```bash
cd tests
Rscript -e "testthat::test_file('test_r_packages.R')"
```

#### Tier D: Integration Tests (Bash)

**6 tests** validating end-to-end workflows:

- Spacemacs configuration
- Helper script availability
- R installation
- Required R packages
- Emacs functionality
- Documentation builds

```bash
cd tests
./test_integration.sh
```

### Edge Case Coverage

The test suite includes **16 edge case tests** with **9 test fixtures**:

**Documentation Edge Cases:**

- Malformed markdown (unclosed code blocks, broken tables)
- Missing assets (images, files)
- Invalid YAML frontmatter

**Emacs Lisp Edge Cases:**

- Functions called in wrong major mode
- Buffers without associated files
- Invalid user input to custom functions
- Disabled feature states

**R Package Edge Cases:**

- Empty/comment-only R files
- R syntax errors
- Nonexistent files
- Unicode characters

**Test Fixtures Location:** `tests/fixtures/`

### Individual Test Runners

Run specific test tiers:

```bash
# Documentation only
python3 tests/test_documentation.py

# Emacs Lisp only
tests/run_elisp_tests.sh

# R packages only
Rscript -e "testthat::test_file('tests/test_r_packages.R')"

# Integration only
tests/test_integration.sh
```

### Test Output

All test results are logged to `tests/test_run.log`:

```bash
# View last test run
cat tests/test_run.log

# Monitor tests in real-time
tail -f tests/test_run.log
```

### CI/CD Integration

The test suite is designed for CI/CD pipelines:

```yaml
# Example GitHub Actions
- name: Run Tests
  run: |
    cd tests
    ./run_all_tests.sh
```

**Exit codes:**

- `0` = All tests passed
- `1` = One or more test suites failed

## Quick Verification

### Automated Check

```bash
# Run dependency checker
./check-dependencies.sh
```text

Expected output:

```text
================================================
  emacs-r-devkit Dependency Checker
================================================

System Requirements:
-------------------
✓ Emacs: 30.0.92
✓ R: 4.4.2
✓ Rscript: 4.4.2

Required R Packages:
--------------------
✓ R package devtools: 2.4.5
✓ R package usethis: 3.0.0
...

================================================
  Summary
================================================
✓ All dependencies satisfied!
```bash

## Interactive Testing

### Test File Method

Use the provided test file:

```bash
emacs test-features.R
```text

Follow instructions in the file to test:

1. Syntax highlighting
2. Code completion
3. Flycheck integration
4. Roxygen insertion
5. LSP navigation
6. R console integration
7. Auto-formatting

### Manual Test Steps

#### 1. Basic Emacs Functions

=== "File Operations"

    ```
    C-x C-f test.R RET       # Open/create file
    # Type some text
    C-x C-s                  # Save
    C-x k RET                # Close buffer
    ```

    ✅ **Expected:** File created and saved successfully

=== "Navigation"

    ```
    # Open any R file
    C-a                      # Go to beginning of line
    C-e                      # Go to end of line
    M-f                      # Forward word (Option-f)
    M-b                      # Backward word (Option-b)
    ```

    ✅ **Expected:** Cursor moves as expected

#### 2. ESS (R Mode)

=== "R Console"

    ```
    M-x R RET                # Start R
    ```

    ✅ **Expected:**
    ```
    R version 4.4.2 (2024-10-31) -- "Pile of Leaves"
    ...
    >
    ```

=== "Code Execution"

    ```r
    # In R file, type:
    x <- 1:10

    # With cursor on line:
    C-RET                    # Send to R
    ```

    ✅ **Expected:** Code executes in R console, `x` is defined

=== "Function Execution"

    ```r
    # Type a function:
    my_func <- function(x) {
      x * 2
    }

    # Cursor anywhere in function:
    C-c C-c                  # Send function to R
    ```

    ✅ **Expected:** Function defined in R

#### 3. Flycheck

=== "Syntax Error Detection"

    ```r
    # Type invalid R code:
    x <- 1:10
    y <- x +                 # Incomplete
    ```

    ✅ **Expected:**
    - Red squiggle under error
    - `FlyC` in mode line shows errors
    - `C-c ! l` lists errors

=== "Style Warnings"

    ```r
    # Type poorly formatted code:
    x=1:10                   # Should use <-
    if(x>5){print(x)}       # Poor spacing
    ```

    ✅ **Expected:**
    - Orange squiggles for style issues
    - lintr warnings shown

#### 4. Company Completion

=== "Function Completion"

    ```r
    # Start typing:
    mea
    ```

    ✅ **Expected:**
    - Popup appears with `mean`, `median`, etc.
    - Navigate with `C-n`/`C-p`
    - Accept with `TAB` or `RET`

=== "Argument Completion"

    ```r
    # Type:
    mean(
    ```

    ✅ **Expected:**
    - Popup shows function arguments
    - `x`, `trim`, `na.rm` options

#### 5. LSP Mode

!!! warning "Requirements"
    LSP only works in R packages (needs `DESCRIPTION` file)

=== "Create Test Package"

    ```r
    # In R console:
    usethis::create_package("~/test-pkg")

    # In Emacs:
    C-x C-f ~/test-pkg/R/utils.R RET
    ```

=== "Go to Definition"

    ```r
    # In R/utils.R:
    helper <- function(x) {
      mean(x)
    }

    main <- function(data) {
      helper(data)           # M-. here
    }
    ```

    ✅ **Expected:**
    - `M-.` on `helper` jumps to definition
    - `M-,` returns to original location

=== "Find References"

    ```r
    # With cursor on `helper`:
    M-?                      # Find references
    ```

    ✅ **Expected:** Shows all usages of `helper`

#### 6. Roxygen Integration

=== "Basic Function"

    ```r
    # Type (or open test-roxygen.R):
    calculate_mean <- function(x, na.rm = TRUE) {
      mean(x, na.rm = na.rm)
    }

    # Move cursor to line before function
    C-c r r                  # Insert roxygen
    ```

    ✅ **Expected:**
    ```r
    #' Title
    #'
    #' @param x
    #' @param na.rm
    #'
    #' @return
    #' @export
    #'
    #' @examples
    calculate_mean <- function(x, na.rm = TRUE) {
      mean(x, na.rm = na.rm)
    }
    ```

=== "Complex Function"

    ```r
    # Multiline parameters:
    complex_func <- function(data,
                             method = "mean",
                             na.rm = TRUE,
                             verbose = FALSE) {
      # implementation
    }

    C-c r r
    ```

    ✅ **Expected:** All parameters detected (`data`, `method`, `na.rm`, `verbose`)

#### 7. Styler Auto-Format

=== "Messy Code"

    ```r
    # Type messy code:
    my_func=function(x,y){
    result=x+y
    return(result)
    }

    # Save:
    C-x C-s
    ```

    ✅ **Expected:** Code auto-formatted to:
    ```r
    my_func <- function(x, y) {
      result <- x + y
      return(result)
    }
    ```

=== "Toggle Styler"

    ```
    C-c r S                  # Disable
    # Save messy code - stays messy
    C-c r S                  # Re-enable
    # Save - gets formatted
    ```

    ✅ **Expected:** Toggle works correctly

#### 8. Usethis Integration

!!! warning "Requirements"
    Must be in R package directory

=== "Create R File"

    ```
    # In R package:
    C-c r u
    Name: utils RET
    ```

    ✅ **Expected:** Creates `R/utils.R`

=== "Create Test File"

    ```
    C-c r t
    Name: utils RET
    ```

    ✅ **Expected:** Creates `tests/testthat/test-utils.R`

#### 9. S7 Integration

=== "Insert Class"

    ```
    C-c r s c
    ```

    ✅ **Expected:** S7 class template inserted

=== "Insert Method"

    ```
    C-c r s m
    ```

    ✅ **Expected:** S7 method template inserted

#### 10. Which-Key

=== "Prefix Discovery"

    ```
    C-c r                    # Wait 1 second
    ```

    ✅ **Expected:** Popup shows all `C-c r` options

## Systematic Checklist

Use `TEST-CHECKLIST.md` for comprehensive verification:

```bash
emacs TEST-CHECKLIST.md
```text

Check off each item as you verify it works.

## Package-Specific Tests

### In R Package

Create a test package to verify all features:

```r
# In R console
usethis::create_package("~/emacs-test-pkg")
```text

Then test:

1. ✅ LSP mode activates
2. ✅ Go to definition works
3. ✅ `C-c r u` creates R files
4. ✅ `C-c r t` creates test files
5. ✅ Roxygen insertion works
6. ✅ Auto-formatting works
7. ✅ Flycheck shows errors

### Standalone R File

Test features that work without package:

```bash
emacs ~/test-standalone.R
```text

1. ✅ Syntax highlighting
2. ✅ Code completion (basic)
3. ✅ R console integration
4. ✅ Flycheck linting
5. ✅ Auto-formatting
6. ✅ Roxygen insertion

❌ LSP won't work (needs package)

## Performance Tests

### Startup Time

```bash
# Measure startup
time emacs --eval '(kill-emacs)'
```text

✅ **Expected:** < 5 seconds (after initial package installation)

### Large File Handling

```r
# Create large R file
writeLines(rep("x <- 1:10", 1000), "large.R")

# Open in Emacs
emacs large.R
```text

✅ **Expected:**
- Loads quickly
- Syntax highlighting works
- No lag when typing

## Troubleshooting Failed Tests

### If ESS Test Fails

```bash
M-x package-install RET ess RET
```bash

### If Flycheck Test Fails

```bash
Rscript -e 'install.packages(c("lintr", "styler"))'
M-x flycheck-verify-setup
```bash

### If LSP Test Fails

```r
install.packages("languageserver")
```text

Ensure you're in R package (has `DESCRIPTION`).

### If Roxygen Test Fails

Check function exists:

```yaml
M-: (fboundp 'emacs-r-devkit/insert-roxygen-skeleton) RET
```text

Should return `t`.

### If Styler Test Fails

```bash
Rscript -e 'install.packages("styler")'
Rscript ~/.emacs.d/bin/r-styler-check.R test.R
```bash

## Reporting Issues

If tests fail:

1. Run `./check-dependencies.sh`
2. Check `C-h e` (*Messages* buffer)
3. Note exact error messages
4. Report to [GitHub Issues](https://github.com/Data-Wise/emacs-r-devkit/issues) with:
    - Emacs version (`M-x emacs-version`)
    - R version (`R --version`)
    - macOS version
    - Failed test description
    - Error messages

## Success Criteria

All tests passing means:

✅ emacs-r-devkit is correctly installed
✅ All dependencies satisfied
✅ R integration working
✅ Code navigation functional
✅ Auto-formatting operational
✅ Documentation generation ready
✅ Ready for R package development!

---

**Next:** Start developing with the [Keybindings Reference](keybindings.md)!
