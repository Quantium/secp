# Contributing to EMA Career Navigator

Thank you for your interest in contributing to the EMA Career Navigator! This document provides guidelines and information for contributors.

## 🤝 How to Contribute

### Before You Start
1. **Read the README**: Make sure you understand the project and its goals
2. **Check existing issues**: Look for open issues or discussions that might address your idea
3. **Join the discussion**: Comment on existing issues or start a new discussion

### Contribution Types
We welcome various types of contributions:

- 🐛 **Bug fixes**: Fix issues, improve error handling
- ✨ **New features**: Add new career tools, visualizations, or content
- 📚 **Documentation**: Improve README, add code comments, create guides
- 🎨 **UI/UX improvements**: Better design, accessibility, responsive layouts
- 🧪 **Testing**: Add tests, improve test coverage
- 🔧 **Code quality**: Refactoring, performance improvements, code organization

## 🚀 Getting Started

### Prerequisites
- Git installed on your machine
- A GitHub account
- Basic knowledge of HTML, CSS, and JavaScript
- A modern web browser for testing

### Setup
1. **Fork the repository**
   - Go to the main repository page
   - Click the "Fork" button in the top right
   - Clone your forked repository

2. **Clone your fork**
   ```bash
   git clone https://github.com/yourusername/ema-career-navigator.git
   cd ema-career-navigator
   ```

3. **Add the upstream remote**
   ```bash
   git remote add upstream https://github.com/original-owner/ema-career-navigator.git
   ```

4. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

## 📝 Development Guidelines

### Code Style
- **Indentation**: Use 2 spaces (no tabs)
- **JavaScript**: Use ES6+ features, prefer `const` and `let` over `var`
- **HTML**: Use semantic elements, maintain accessibility
- **CSS**: Use Tailwind utility classes when possible
- **Naming**: Use descriptive names for variables, functions, and files

### File Organization
- Keep related code together
- Use meaningful file and folder names
- Group functions logically
- Add comments for complex logic

### Testing
- Test your changes in multiple browsers
- Test responsive design on different screen sizes
- Ensure accessibility features work (keyboard navigation, screen readers)
- Validate HTML and CSS

## 🔄 Development Workflow

### Making Changes
1. **Make your changes** in your feature branch
2. **Test thoroughly** before committing
3. **Commit with clear messages**:
   ```bash
   git commit -m "Add career assessment quiz feature"
   git commit -m "Fix navigation bug on mobile devices"
   git commit -m "Update senior developer role description"
   ```

### Keeping Your Branch Updated
```bash
git fetch upstream
git checkout main
git merge upstream/main
git checkout your-feature-branch
git merge main
```

### Before Submitting
1. **Ensure your code works** in all target browsers
2. **Test the full user flow** to make sure nothing is broken
3. **Check for any console errors** or warnings
4. **Validate your HTML and CSS**

## 📤 Submitting Your Contribution

### Creating a Pull Request
1. **Push your branch** to your fork:
   ```bash
   git push origin feature/your-feature-name
   ```

2. **Create a Pull Request**:
   - Go to your fork on GitHub
   - Click "New Pull Request"
   - Select your feature branch
   - Fill out the PR template

### Pull Request Template
```markdown
## Description
Brief description of what this PR accomplishes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] UI/UX improvement
- [ ] Code refactoring
- [ ] Other (please describe)

## Testing
- [ ] Tested in Chrome
- [ ] Tested in Firefox
- [ ] Tested in Safari
- [ ] Tested in Edge
- [ ] Tested responsive design
- [ ] Tested accessibility features

## Screenshots (if applicable)
Add screenshots for UI changes

## Additional Notes
Any additional information or context
```

## 📋 Review Process

### What Happens Next
1. **Automated checks** will run (if configured)
2. **Maintainers will review** your code
3. **Feedback will be provided** if changes are needed
4. **Once approved**, your PR will be merged

### Responding to Feedback
- Be open to suggestions and feedback
- Make requested changes promptly
- Ask questions if something isn't clear
- Thank reviewers for their time

## 🐛 Reporting Issues

### Before Reporting
1. **Check existing issues** to see if it's already reported
2. **Try to reproduce** the issue consistently
3. **Check browser console** for error messages
4. **Test in different browsers** to see if it's browser-specific

### Issue Template
```markdown
## Bug Description
Clear description of what the bug is

## Steps to Reproduce
1. Go to '...'
2. Click on '...'
3. Scroll down to '...'
4. See error

## Expected Behavior
What you expected to happen

## Actual Behavior
What actually happened

## Environment
- Browser: [e.g., Chrome 120, Firefox 121]
- Operating System: [e.g., macOS 14.0, Windows 11]
- Device: [e.g., Desktop, Mobile, Tablet]

## Additional Context
Any other context, screenshots, or information
```

## 💡 Feature Requests

### Before Requesting
1. **Check the roadmap** in the README
2. **Search existing discussions** for similar ideas
3. **Think about implementation** and user value
4. **Consider if it fits** the project's scope

### Feature Request Template
```markdown
## Feature Description
Clear description of the feature you'd like to see

## Problem it Solves
What problem does this feature address?

## Proposed Solution
How would you implement this feature?

## Alternatives Considered
What other approaches could work?

## Additional Context
Any other relevant information
```

## 🎯 Areas for Contribution

### High Priority
- **Accessibility improvements**: Screen reader support, keyboard navigation
- **Mobile optimization**: Better responsive design, touch interactions
- **Performance**: Code optimization, loading improvements
- **Testing**: Add automated tests, improve test coverage

### Medium Priority
- **New visualizations**: Better charts, interactive elements
- **Content updates**: Role descriptions, career advice
- **UI improvements**: Better layouts, color schemes
- **Documentation**: Code comments, user guides

### Low Priority
- **New features**: Assessment tools, progress tracking
- **Integration**: HR system connections, analytics
- **Internationalization**: Multi-language support
- **Advanced features**: AI recommendations, personalized paths

## 🚫 What Not to Contribute

- **Breaking changes** without discussion
- **Major refactoring** without prior approval
- **New dependencies** without justification
- **Content changes** that don't align with EMA's career framework

## 📞 Getting Help

### Questions?
- **GitHub Discussions**: Use the Discussions tab for questions
- **GitHub Issues**: Create an issue for bugs or feature requests
- **Code comments**: Ask questions in your PR or issue

### Stuck?
- Check existing documentation
- Look at similar code in the project
- Ask in GitHub Discussions
- Don't hesitate to ask for help!

## 🙏 Recognition

### Contributors
All contributors will be:
- Listed in the README
- Added to the contributors list
- Recognized in release notes
- Thanked for their contributions

### Types of Recognition
- **Code contributors**: Listed in contributors
- **Documentation**: Mentioned in relevant sections
- **Bug reports**: Acknowledged in issue resolution
- **Feature ideas**: Credited in implementation

## 📜 Code of Conduct

### Our Standards
- Be respectful and inclusive
- Focus on constructive feedback
- Help others learn and grow
- Maintain a positive environment

### Enforcement
- Violations will be addressed promptly
- Maintainers have final say on conduct issues
- Repeated violations may result in removal

---

**Thank you for contributing to EMA Career Navigator!** 🎉

Your contributions help make this tool better for all software engineers at EMA and beyond.
