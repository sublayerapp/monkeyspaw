# Getting Started with MonkeysPaw

## Page Content

Create a practical, step-by-step guide that helps users start using MonkeysPaw quickly while providing enough detail for them to understand what they're doing. Maintain the mystical theme while being clear and instructive.

### Introduction
- Heading: "Your First Wish Awaits"
- Brief overview: "This guide will walk you through summoning the MonkeysPaw, preparing your first wishes, and witnessing them manifest. Follow these steps carefully to begin your journey into wish-driven development."

### Prerequisites
- A short list of requirements:
  - Ruby 3.0 or higher
  - Bundler
  - Basic familiarity with Ruby and web concepts
  - A healthy respect for the power of wishes

### Installation Section
- Step 1: Add to your Gemfile
```ruby
gem 'monkeyspaw'
```
- Step 2: Run bundle install
```bash
$ bundle install
```
- Alternative: Direct installation
```bash
$ gem install monkeyspaw
```
- Note: "The paw is now in your possession. Use it wisely."

### Project Setup
- Creating a new MonkeysPaw project:
```bash
$ mkdir my_wishes
$ cd my_wishes
```
- Setting up the basic directory structure:
```bash
mkdir -p wishes components assets
```
- Explain each directory's purpose:
  - `wishes/`: Where your page descriptions live
  - `components/`: Layout and style components
  - `assets/`: Static files like images

### Your First Component Files
- Create a layout component (`components/layout.md`):
```markdown
# Layout Component

Create a clean layout with:
- A header with site title and navigation
- Main content area
- Footer with copyright
- Responsive design for mobile and desktop
```

- Create a style component (`components/style.md`):
```markdown
# Style Component

Apply these styling guidelines:
- Modern, clean aesthetic with ample white space
- Primary color: #3490dc, Secondary: #f6993f
- Sans-serif fonts for readability
- Subtle animations for interactive elements
```

### Your First Wish
- Create your first wish file (`wishes/index.md`):
```markdown
# Home Page

## Content
Create a welcoming home page for a personal blog about hiking adventures.

## Required Sections
- Hero section with a greeting and brief introduction
- Featured hikes section with 3 recent adventures
- About the author section with a short bio
- Newsletter signup form

## Tone
Friendly, adventurous, and inspiring
```

### Bringing It to Life
- Create a simple Ruby file to run your application (`app.rb`):
```ruby
require 'monkeyspaw'

MonkeysPaw.pick_up!
```
- Run the application:
```bash
$ ruby app.rb
```
- View your creation:
```
You pick up the monkey's paw. Be careful what you wish for on http://localhost:1337
```

### Customizing Your Experience
- Basic configuration options:
```ruby
MonkeysPaw.configure do |config|
  config.port = 4567
  config.host = 'localhost'
  # Custom directories if needed
  config.wishes_dir = 'my_custom_wishes_folder'
  config.components_dir = 'my_custom_components_folder'
end
```

### Understanding the Results
- Tips for evaluating what you receive:
  - Compare the output against your wish
  - Note areas where more specificity would help
  - Identify patterns in how your wishes are interpreted
  - Keep track of particularly effective phrasings

### Debugging Common Issues
- Troubleshooting section with common problems:
  - Missing directories
  - Unclear or contradictory wishes
  - Performance considerations
  - Server configuration issues

### Next Steps
- Suggestions for further exploration:
  - Try creating more complex pages
  - Experiment with different layout and style components
  - Learn how to structure multi-page sites
  - Read the Best Practices guide for more advanced usage

### Warning Box
- Final cautionary note in a stylized warning box:
  - "Remember: The paw grants exactly what you request, not what you intend. Be precise, be clear, and most importantly—be careful what you wish for."

### Continue Your Journey
- Call-to-action buttons:
  - "Explore Components" (links to Components page)
  - "See Examples" (links to Examples page)
  - "Learn Best Practices" (links to Best Practices page)