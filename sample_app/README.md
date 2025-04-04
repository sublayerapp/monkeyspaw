# MonkeysPaw Sample Website

This is a sample website for the MonkeysPaw gem, built using MonkeysPaw itself! 

## Meta Example

This sample app demonstrates the power and flexibility of MonkeysPaw by creating a website *about* MonkeysPaw *using* MonkeysPaw. It's a perfect example of "wish-driven development" in action.

## Running the Sample

To run this sample website:

1. Make sure you have Ruby 3.0+ installed
2. Install the MonkeysPaw gem if you haven't already:
   ```
   gem install monkeyspaw
   ```
   
3. Run the application:
   ```
   ruby app.rb
   ```
   
4. Visit [http://localhost:4567](http://localhost:4567) in your browser

## Performance with Caching

This sample uses MonkeysPaw's caching system to improve performance. Pages are generated only once and then cached. They will be regenerated only when:

- The page content (wish file) changes
- The layout component changes
- The style component changes

To force regeneration of all pages (clear the cache), run:
```
ruby app.rb --clear-cache
```

## Directory Structure

- `wishes/` - Contains the page descriptions for each page of the site
- `components/` - Contains the layout and style components
- `app.rb` - The application entry point

## Pages

- Home (`wishes/index.md`) - The main landing page
- How It Works (`wishes/how-it-works.md`) - Explains the MonkeysPaw concept
- Getting Started (`wishes/getting-started.md`) - A guide for new users

## Components

- Layout (`components/layout.md`) - Defines the structural organization of the site
- Style (`components/style.md`) - Defines the visual presentation and aesthetics

## Learning from this Example

Study the wish files to learn effective ways to structure your own prompts. Pay special attention to:

1. The level of detail in each section
2. How specific instructions are phrased
3. The balance between content, structure, and visual guidance
4. The overall organization of the prompts

Remember: The paw grants exactly what you request, not what you intend. Be precise!