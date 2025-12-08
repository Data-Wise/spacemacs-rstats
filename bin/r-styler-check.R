#!/usr/bin/env Rscript
# ~/.emacs.d/bin/r-styler-check.R
# Read a single filename argument, run styler::style_text on its lines and
# report the first differing line (prints "file:line:col: message") if any.
# Exit codes:
#  0 - identical (no differences)
#  1 - differences found (message printed)
#  2 - error (styler missing or runtime error)
args <- commandArgs(trailingOnly = TRUE)
if (length(args) < 1) {
  write("Usage: r-styler-check.R <file>", stderr())
  quit(status = 2)
}
file <- args[1]
if (!file.exists(file)) {
  write(sprintf("File not found: %s", file), stderr())
  quit(status = 2)
}
suppressWarnings({
  ok <- requireNamespace("styler", quietly = TRUE)
})
if (!ok) {
  write("STYLER-ERROR: styler package not installed", stderr())
  quit(status = 2)
}
txt <- tryCatch(readLines(file, warn = FALSE), error = function(e) { write(sprintf("STYLER-ERROR: %s", conditionMessage(e)), stderr()); quit(status = 2) })
styled <- tryCatch(styler::style_text(txt), error = function(e) { write(sprintf("STYLER-ERROR: %s", conditionMessage(e)), stderr()); quit(status = 2) })
if (identical(txt, styled)) {
  quit(status = 0)
}
nmin <- min(length(txt), length(styled))
for (i in seq_len(nmin)) {
  if (!identical(txt[i], styled[i])) {
    cat(sprintf("%s:%d:1: Styler would reformat starting at line %d\n", file, i, i))
    quit(status = 1)
  }
}
if (length(styled) > length(txt)) {
  cat(sprintf("%s:%d:1: Styler would add lines starting at %d\n", file, length(txt)+1, length(txt)+1))
  quit(status = 1)
}
cat(sprintf("%s:1:1: Styler would change the file\n", file))
quit(status = 1)
