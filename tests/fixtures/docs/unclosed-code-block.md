# Test Document with Unclosed Code Block

This is a test document to verify the documentation test suite can detect malformed markdown.

## Code Block Issue

Here's a code block that is never closed:

```python
def broken_function():
    print("This code block is never closed")
    return True

## Another Section

This section comes after an unclosed code block, which should be detected as an error.
