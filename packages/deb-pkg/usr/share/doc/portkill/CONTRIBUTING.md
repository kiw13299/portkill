# Contributing to PortKill

Thank you for considering contributing to PortKill. This document provides guidelines and instructions for contributing to the project.

## Code of Conduct

All contributors are expected to maintain professional conduct and respect for others in all project interactions.

## Getting Started

1. Fork the repository
2. Clone your fork: `git clone https://github.com/your-username/portkill.git`
3. Add upstream remote: `git remote add upstream https://github.com/mr-tanta/portkill.git`
4. Create a feature branch: `git checkout -b feature/your-feature-name`

## Development Setup

### Prerequisites

- macOS or Linux development environment
- Bash 3.2 or later
- Git
- Make

### Building from Source

```bash
make build
```

### Running Tests

```bash
make test
```

## Contribution Process

### Reporting Issues

When reporting issues, please include:
- Operating system and version
- PortKill version
- Steps to reproduce the issue
- Expected behavior
- Actual behavior
- Error messages if applicable

### Submitting Changes

1. Ensure your code adheres to the project style guidelines
2. Add tests for new functionality
3. Update documentation as needed
4. Commit your changes using descriptive commit messages
5. Push to your fork and submit a pull request

### Commit Message Format

Use conventional commit format:

```
type(scope): subject

body

footer
```

Types:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `test`: Test additions or modifications
- `refactor`: Code refactoring
- `perf`: Performance improvements
- `chore`: Maintenance tasks

Example:
```
feat(cli): add interactive mode for port selection

Implements a terminal UI that allows users to select ports
from a list rather than specifying them via command line.

Closes #42
```

## Code Standards

### Shell Scripts

- Use ShellCheck for linting
- Follow POSIX shell conventions where possible
- Use meaningful variable names
- Add comments for complex logic
- Handle errors explicitly

### Documentation

- Keep documentation concise and accurate
- Include code examples where appropriate
- Update README.md for user-facing changes
- Document all public functions and APIs

## Testing

### Test Coverage

All new features should include appropriate tests:
- Unit tests for individual functions
- Integration tests for command workflows
- Edge case handling

### Running Specific Tests

```bash
# Run unit tests
make test-unit

# Run integration tests
make test-integration

# Run all tests with coverage
make test-coverage
```

## Pull Request Process

1. Update documentation for any changed functionality
2. Ensure all tests pass
3. Request review from maintainers
4. Address review feedback
5. Squash commits before merging

### Pull Request Template

```markdown
## Description
Brief description of the changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
- [ ] Tests pass locally
- [ ] New tests added
- [ ] Manual testing completed

## Checklist
- [ ] Code follows project style guidelines
- [ ] Self-review completed
- [ ] Documentation updated
```

## Project Structure

```
portkill/
├── bin/            # Executable scripts
├── lib/            # Core functionality
├── test/           # Test suites
├── docs/           # Documentation
└── scripts/        # Build and utility scripts
```

## Release Process

Releases follow semantic versioning (MAJOR.MINOR.PATCH):
- MAJOR: Breaking changes
- MINOR: New features (backward compatible)
- PATCH: Bug fixes

## Questions

For questions about contributing, please open a discussion in the GitHub repository.

## License

By contributing to PortKill, you agree that your contributions will be licensed under the MIT License.