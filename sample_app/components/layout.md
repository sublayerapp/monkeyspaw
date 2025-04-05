# Layout Component for MonkeysPaw Site

Create a responsive layout with the following structure:

## Basic Structure
- Include Tailwind CSS via CDN: `<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">`
- Use a dark theme with mystical/magical feel
- Set `font-family: 'Montserrat', 'Segoe UI', system-ui` for content and `font-family: 'Cinzel', serif` for headings
- Include Google Fonts: `<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;400;600&display=swap" rel="stylesheet">`
- Only include any CDN resources unless from jsdelivr.net

## Header
- Fixed navigation at the top with slightly transparent dark background
- Navigation links should slide in from below when hovered
- Include navigation items with the following paths:
  - Home (/) 
  - How It Works (/how-it-works)
  - Getting Started (/getting-started)
  - Components (/components)
  - Examples (/examples)
  - Best Practices (/best-practices)
- Mobile: Convert to hamburger menu that slides in from the side

## Main Content Area
- Centered content with max-width of 1200px
- Subtle parchment-like background texture
- Elegant shadows and subtle borders
- Add small monkey paw print graphics as section dividers

## Footer
- Dark background matching the header
- Include "Be careful what you wish for..." tagline
- Add GitHub link, created year
- Add small animated monkey's paw icon that curls when hovering over footer

## Animations
- Subtle page transitions
- Elements should fade in when scrolling into view
- Interactive elements should have subtle hover effects
- Add a small animated cursor effect near the mouse that looks like magical sparkles

## Special Features
- Include a "theme toggle" that shows a monkey's paw curling animation during theme switch
- Add a subtle "fingerprint" pattern in the background that looks like monkey paw prints
- When users hover over code samples, show a small "wish granted" message

Ensure the layout is fully responsive and works well on all device sizes.
