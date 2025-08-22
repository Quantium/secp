# Technical Architecture

## Overview
The EMA Career Navigator is a single-page application (SPA) built with vanilla JavaScript, HTML, and CSS. It's designed to be lightweight, fast, and accessible without requiring any build tools or dependencies.

## 🏗️ Architecture Pattern

### Single Page Application (SPA)
- **Single HTML file**: All content is contained in `index.html`
- **JavaScript-driven navigation**: Content sections are shown/hidden dynamically
- **No page reloads**: Smooth transitions between different career sections
- **Progressive enhancement**: Works without JavaScript, enhanced with it

### Component Structure
```
┌─────────────────────────────────────────────────────────────┐
│                    Header Navigation                        │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────┐  ┌─────────────────────────────────────┐  │
│  │   Section   │  │           Content Area              │  │
│  │  Navigation │  │                                     │  │
│  │             │  │  ┌─────────────────────────────┐    │  │
│  │ • Foundation│  │  │      Dynamic Content       │    │  │
│  │ • IC Path   │  │  │                             │    │  │
│  │ • Leadership│  │  │  ┌─────────────────────┐    │    │  │
│  │ • Specialized│  │  │   Interactive        │    │    │  │
│  │ • Growth    │  │  │   Components         │    │    │  │
│  └─────────────┘  │  └─────────────────────┘    │    │  │
│                   └─────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
```

## 🎨 Frontend Architecture

### Technology Stack
- **HTML5**: Semantic markup, accessibility features
- **CSS3**: Tailwind CSS utility classes, custom styles
- **JavaScript (ES6+)**: Modern JavaScript features, no transpilation needed

### CSS Architecture
```css
/* Base styles */
body { /* Global styles */ }

/* Component styles */
.nav-link { /* Navigation styling */ }
.content-section { /* Content visibility */ }
.chart-container { /* Chart layout */ }

/* Utility classes (Tailwind) */
.bg-white, .p-6, .rounded-xl, .shadow-md
```

### JavaScript Architecture
```javascript
// Module pattern for organization
document.addEventListener('DOMContentLoaded', function() {
    // Initialize all components
    initDualTrackChart();
    initICPath();
    initLeadership();
    initCertifications();
});

// Component functions
function initDualTrackChart() { /* Chart initialization */ }
function initICPath() { /* IC path functionality */ }
function initLeadership() { /* Leadership comparison */ }
function initCertifications() { /* Certification table */ }
```

## 🔧 Component Architecture

### 1. Navigation System
```javascript
// Section switching logic
function showSection(hash) {
    contentSections.forEach(section => {
        section.classList.toggle('active', '#' + section.id === hash);
    });
}

// Event handling
navLinks.forEach(link => {
    link.addEventListener('click', (e) => {
        e.preventDefault();
        const hash = e.target.getAttribute('href');
        history.pushState(null, null, hash);
        showSection(hash);
    });
});
```

### 2. Interactive Charts
```javascript
// Chart.js integration
function initDualTrackChart() {
    const ctx = document.getElementById('dualTrackChart').getContext('2d');
    new Chart(ctx, {
        type: 'bar',
        data: { /* Chart data */ },
        options: { /* Chart options */ }
    });
}
```

### 3. Dynamic Content Rendering
```javascript
// Template-based content rendering
function renderICRole(roleKey) {
    const role = icRolesData[roleKey];
    titleEl.textContent = role.title;
    renderICTabs(roleKey, Object.keys(role.tabs)[0]);
}
```

### 4. State Management
```javascript
// Simple state management with data objects
const icRolesData = {
    junior: { /* Role data */ },
    mid: { /* Role data */ },
    senior: { /* Role data */ },
    staff: { /* Role data */ }
};
```

## 📱 Responsive Design

### Breakpoint Strategy
```css
/* Mobile first approach */
.chart-container {
    height: 300px;
    max-height: 400px;
}

/* Tablet and up */
@media (min-width: 768px) {
    .chart-container {
        height: 400px;
    }
}
```

### Grid System
```html
<!-- Responsive grid layout -->
<div class="grid grid-cols-1 md:grid-cols-3 gap-8">
    <div class="md:col-span-1"><!-- Sidebar --></div>
    <div class="md:col-span-2"><!-- Main content --></div>
</div>
```

## 🚀 Performance Considerations

### Loading Strategy
- **CDN Resources**: Tailwind CSS and Chart.js loaded from CDN
- **Font Loading**: Google Fonts with preconnect for performance
- **No Bundle**: Single HTML file reduces HTTP requests

### Rendering Optimization
```javascript
// Efficient DOM manipulation
function renderICTabs(roleKey, activeTabKey) {
    // Batch DOM updates
    tabButtonsEl.innerHTML = '';
    Object.keys(role.tabs).forEach(tabKey => {
        // Create elements efficiently
    });
}
```

### Memory Management
- **Event Listeners**: Properly scoped and cleaned up
- **Chart Instances**: Single instance per chart
- **DOM References**: Cached for performance

## 🔒 Security Features

### Content Security
- **No eval()**: All code is static and safe
- **HTTPS Only**: External resources use secure connections
- **No User Input**: No form submission or data collection

### External Dependencies
```html
<!-- Secure CDN resources -->
<script src="https://cdn.tailwindcss.com"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
```

## 🧪 Testing Strategy

### Manual Testing
- **Cross-browser testing**: Chrome, Firefox, Safari, Edge
- **Responsive testing**: Mobile, tablet, desktop
- **Accessibility testing**: Keyboard navigation, screen readers

### Automated Testing (Future)
```javascript
// Example test structure
describe('Career Navigator', () => {
    test('should show foundation section by default', () => {
        // Test implementation
    });
    
    test('should switch sections correctly', () => {
        // Test implementation
    });
});
```

## 📊 Data Flow

### Data Structure
```javascript
// Hierarchical data organization
const icRolesData = {
    junior: {
        title: 'Junior Developer',
        tabs: {
            responsibilities: { title: 'Responsibilities', content: '...' },
            skills: { title: 'Key Skills', content: '...' },
            progression: { title: 'Progression Indicators', content: '...' }
        }
    }
    // ... more roles
};
```

### State Updates
```javascript
// Unidirectional data flow
User Action → Event Handler → State Update → DOM Update → UI Change
```

## 🔄 Future Architecture Considerations

### Potential Improvements
- **Component Library**: Extract reusable components
- **State Management**: Implement more robust state management
- **Build System**: Add bundling for production optimization
- **Testing Framework**: Integrate Jest or similar testing tools
- **TypeScript**: Add type safety to JavaScript code

### Scalability
- **Modular JavaScript**: Split into multiple files
- **CSS Modules**: Better CSS organization
- **Performance Monitoring**: Add analytics and performance tracking
- **Internationalization**: Support for multiple languages

## 📚 Code Organization

### File Structure
```
index.html              # Main application file
├── <head>             # Meta tags, CSS, external resources
├── <body>             # Application content
│   ├── Header         # Navigation and branding
│   ├── Main Content   # Career path sections
│   └── Scripts        # JavaScript functionality
```

### JavaScript Organization
```javascript
// 1. Data definitions
const icRolesData = { /* ... */ };
const leadershipData = { /* ... */ };
const certificationsData = [ /* ... */ ];

// 2. Utility functions
function showSection(hash) { /* ... */ }

// 3. Component initialization
function initDualTrackChart() { /* ... */ }
function initICPath() { /* ... */ }

// 4. Event handlers
document.addEventListener('DOMContentLoaded', function() { /* ... */ });
```

## 🎯 Best Practices

### Code Quality
- **Consistent naming**: Descriptive variable and function names
- **Error handling**: Graceful fallbacks for missing elements
- **Performance**: Efficient DOM manipulation
- **Accessibility**: ARIA labels, keyboard navigation

### Maintainability
- **Modular functions**: Single responsibility principle
- **Clear comments**: Explain complex logic
- **Consistent formatting**: 2-space indentation
- **Logical organization**: Related code grouped together

---

*This architecture document should be updated as the project evolves and new features are added.*
