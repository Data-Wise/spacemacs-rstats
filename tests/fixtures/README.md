# Test Fixtures

Mock environments for testing installation scripts without affecting the real system.

## Fixtures

1. **fresh/** - Fresh system (nothing installed)
2. **emacs-only/** - Emacs but no Spacemacs
3. **installed/** - Complete emacs-r-devkit installation
4. **conflicting/** - Multiple Emacs versions
5. **corrupted/** - Broken installation
6. **spacemacs-vanilla/** - Spacemacs without our config

## Usage

```bash
# Set HOME to fixture
export HOME="$PWD/tests/fixtures/fresh"

# Run health check
./scripts/health-check.sh

# Run pre-flight
./scripts/health-check.sh --pre-flight
```

## Testing

```bash
# Run fixture tests
./tests/test_with_fixtures.sh
```
