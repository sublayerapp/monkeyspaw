# How MonkeysPaw Works

## Page Content

Create an informative page that explains the inner workings of the MonkeysPaw framework with visuals and examples. The page should clarify how prompts are transformed into web pages while maintaining the mystical theme.

### Introduction Section
- Heading: "The Magic Behind the Paw"
- Brief explanation: "MonkeysPaw operates on a simple but powerful principle: your wishes (prompts) are interpreted by advanced AI to manifest as fully-formed web pages. But like any mystical artifact, understanding its workings can help you wield it more effectively."

### The Wish Cycle Diagram
- Create a visual flow diagram showing:
  1. **Your Wish**: Written in markdown files in the `wishes/` directory
  2. **Components**: Layout and style components that influence the outcome
  3. **The Granting**: AI processing of the combined inputs
  4. **Manifestation**: The resulting HTML page displayed to users
- Each step should have a brief explanation and small visualization

### Anatomy of a Wish
- Show a sample wish file with annotations explaining key parts:
```markdown
# Product Landing Page

## Content Instructions:
Create a landing page for a premium fountain pen with elegant design.
Focus on craftsmanship and writing experience.

## Key Features to Highlight:
- Hand-crafted 14k gold nib
- Piston filling mechanism
- Ebonite body with custom patterns
- Smooth writing experience

## Desired Sections:
- Hero with product image
- Features breakdown
- Testimonials from writers
- Specifications table
- Purchase options

## Tone:
Sophisticated, elegant, premium but not pretentious
```
- Explain how each section of this "wish" influences the final outcome

### The Role of Components
- Explain the two special components:
  1. **Layout Component**: Controls the structural organization of elements
  2. **Style Component**: Defines the visual presentation and aesthetics
- Show how these components interact with page-specific wishes
- Include a visual showing how the same content looks with different layout/style combinations

### Behind the Scenes
- Simple technical explanation of how MonkeysPaw:
  1. Reads the files from the directory structure
  2. Combines page content with layout and style guidance
  3. Generates a comprehensive prompt for the AI
  4. Processes the AI response into valid HTML
  5. Serves the resulting page via a built-in web server

### Example: Wish vs. Reality
- Show a side-by-side comparison of:
  - A sample wish (prompt file)
  - The resulting web page
  - The HTML code generated
- Highlight areas where specific instructions directly influenced the outcome

### Common Questions
- Include a FAQ section addressing:
  - "How specific should my wishes be?"
  - "Can I modify the HTML after it's generated?"
  - "How does caching work?"
  - "Can I use multiple layout or style components?"
  - "What happens if my wish is contradictory or impossible?"

### Warnings Section
- Title: "The Fine Print" with a small monkey's paw icon
- List of important considerations:
  - Ambiguous wishes may have unexpected interpretations
  - Highly complex wishes might require more precise language
  - The paw grants what you ask for, not what you intend
  - Each wish may manifest slightly differently on each request

### Next Steps
- Call-to-action: "Ready to craft your own wishes? Continue to Getting Started"
- Secondary link: "Browse Examples to see the paw in action"