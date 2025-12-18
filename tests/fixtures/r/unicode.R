# R file with Unicode characters

# Test function with Unicode in comments: 你好世界 🎉

unicode_test <- function(x) {
  # Greek letters: α β γ δ
  result <- x * π  # Using Unicode pi
  return(result)
}

# Emoji in variable names (valid R)
data_📊 <- c(1, 2, 3)
