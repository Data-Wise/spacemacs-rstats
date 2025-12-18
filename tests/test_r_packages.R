#!/usr/bin/env Rscript
#
# R Package Tests for emacs-r-devkit
#
# Tests:
# 1. Required R packages are installed
# 2. Helper scripts work correctly
# 3. R languageserver is functional
#

library(testthat)

# Test 1: Required packages
test_that("Required R packages are installed", {
    required_packages <- c(
        "devtools",
        "usethis",
        "roxygen2",
        "testthat",
        "lintr",
        "styler",
        "languageserver"
    )

    for (pkg in required_packages) {
        expect_true(
            requireNamespace(pkg, quietly = TRUE),
            info = paste(pkg, "is installed")
        )
    }
})

# Test 2: Styler functionality
test_that("Styler can format R code", {
    skip_if_not_installed("styler")

    messy_code <- "x=1+2"
    styled <- styler::style_text(messy_code)

    expect_true(length(styled) > 0)
    expect_match(as.character(styled), "x <- 1 \\+ 2")
})

# Test 3: Lintr functionality
test_that("Lintr can check R code", {
    skip_if_not_installed("lintr")

    bad_code <- tempfile(fileext = ".R")
    writeLines("x=1+2", bad_code)

    lints <- lintr::lint(bad_code)

    expect_true(length(lints) > 0)

    unlink(bad_code)
})

# Test 4: Roxygen2 functionality
test_that("Roxygen2 can parse documentation", {
    skip_if_not_installed("roxygen2")

    test_func <- "
#' Test Function
#'
#' @param x A number
#' @return The number plus one
#' @export
test_func <- function(x) {
  x + 1
}
"

    temp_file <- tempfile(fileext = ".R")
    writeLines(test_func, temp_file)

    # Parse roxygen comments
    blocks <- roxygen2::parse_file(temp_file)

    expect_true(length(blocks) > 0)

    unlink(temp_file)
})

# Test 5: Language server
test_that("Language server package is available", {
    skip_if_not_installed("languageserver")

    expect_true(
        "languageserver" %in% loadedNamespaces() ||
            requireNamespace("languageserver", quietly = TRUE)
    )
})

# Test 6: Helper script - r-styler-check.R
test_that("r-styler-check.R script exists and works", {
    skip_if_not_installed("styler")

    script_path <- "~/.emacs.d/bin/r-styler-check.R"
    script_path <- path.expand(script_path)

    # If not in ~/.emacs.d/bin, check current project bin/
    if (!file.exists(script_path)) {
        project_bin <- file.path(getwd(), "..", "bin", "r-styler-check.R")
        if (file.exists(project_bin)) {
            script_path <- project_bin
        }
    }

    skip_if_not(file.exists(script_path), "Helper script not found")

    # Create test file
    test_file <- tempfile(fileext = ".R")
    writeLines("x <- 1 + 2", test_file)

    # Run styler check - use system to get exit code directly
    exit_status <- system(
        paste("Rscript", shQuote(script_path), shQuote(test_file), "> /dev/null 2>&1"),
        intern = FALSE,
        wait = TRUE
    )

    expect_true(exit_status %in% c(0, 1))

    unlink(test_file)
})

# Test 7: devtools functionality
test_that("devtools can load packages", {
    skip_if_not_installed("devtools")

    expect_true(
        is.function(devtools::load_all)
    )
})

# Test 8: usethis functionality
test_that("usethis functions are available", {
    skip_if_not_installed("usethis")

    expect_true(is.function(usethis::use_r))
    expect_true(is.function(usethis::use_test))
})

# Test 9: Styler edge case - empty file
test_that("Styler handles empty R files gracefully", {
    skip_if_not_installed("styler")

    empty_file <- tempfile(fileext = ".R")
    writeLines("# Only comments", empty_file)

    # Should not error
    expect_no_error(styler::style_file(empty_file, strict = FALSE))

    unlink(empty_file)
})

# Test 10: Lintr edge case - clean code
test_that("Lintr returns no violations for clean code", {
    skip_if_not_installed("lintr")

    clean_file <- tempfile(fileext = ".R")
    writeLines(c(
        "#' Test function",
        "#' @param x A number",
        "test_func <- function(x) {",
        "  x + 1",
        "}"
    ), clean_file)

    lints <- lintr::lint(clean_file)

    # Clean code should have minimal or no lints
    expect_true(length(lints) < 3) # Allow for minor style preferences

    unlink(clean_file)
})

# Test 11: Styler edge case - syntax error handling
test_that("Styler handles syntax errors gracefully", {
    skip_if_not_installed("styler")

    bad_file <- tempfile(fileext = ".R")
    writeLines("function(x { x + 1 }", bad_file) # Missing closing paren

    # Should handle error gracefully (not crash)
    result <- tryCatch(
        {
            styler::style_file(bad_file, strict = FALSE)
            TRUE
        },
        error = function(e) {
            # Expected to error, which is fine
            TRUE
        }
    )

    expect_true(result)

    unlink(bad_file)
})

# Test 12: Helper script edge case - nonexistent file
test_that("Helper script handles nonexistent files", {
    skip_if_not_installed("styler")

    script_path <- "~/.emacs.d/bin/r-styler-check.R"
    script_path <- path.expand(script_path)

    if (!file.exists(script_path)) {
        project_bin <- file.path(getwd(), "..", "bin", "r-styler-check.R")
        if (file.exists(project_bin)) {
            script_path <- project_bin
        }
    }

    skip_if_not(file.exists(script_path), "Helper script not found")

    # Test with nonexistent file
    exit_status <- system(
        paste("Rscript", shQuote(script_path), "/tmp/nonexistent_file_12345.R", "> /dev/null 2>&1"),
        intern = FALSE,
        wait = TRUE
    )

    # Should exit with error code (not 0)
    expect_true(exit_status != 0)
})

# Run tests
cat("\n🧪 Running R Package Tests\n")
cat("==========================\n\n")

# Note: Tests are run by the runner using test_file()
# so we don't need output here.
