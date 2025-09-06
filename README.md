# MonkeysPaw 🐒✋

> *Be careful what you wish for...*

A prompt-driven web framework for Ruby that grants your web development wishes through the power of AI. Like the legendary monkey's paw, it will fulfill your requests exactly as stated—for better or worse.

## The Curse and the Gift

MonkeysPaw removes traditional web development constraints by allowing you to express your intentions through prompts rather than code. But remember, with great power comes the responsibility to be precise. Your words shape reality here.

The quality of what you receive depends entirely on how carefully you phrase your wishes.

## Installation

Summon the paw into your application:

```ruby
gem 'monkeyspaw'
```

Then invoke the ritual:

```bash
$ bundle install
```

Or bind it directly:

```bash
$ gem install monkeyspaw
```

## AI Provider Configuration

MonkeysPaw can channel various AI entities to manifest your wishes. Configure your chosen provider:

### Environment Variables

Set up your API keys based on your chosen provider:

MacOS/Linux:
```bash
export GEMINI_API_KEY=your_gemini_api_key
export ANTHROPIC_API_KEY=your_anthropic_api_key  
export OPENAI_API_KEY=your_openai_api_key
```

Windows:
```bash
Set-Item -Path env:GEMINI_API_KEY -Value "YourKeyHere"
Set-Item -Path env:ANTHROPIC_API_KEY -Value "YourKeyHere"
Set-Item -Path env:OPENAI_API_KEY -Value "YourKeyHere"
```

### Selecting Your AI Provider

You can configure your AI provider in two ways:

**Method 1: Using the `use` method**
```ruby
# Choose your entity and model
MonkeysPaw.use :gemini, model: 'your-gemini-model'
MonkeysPaw.use :claude, model: 'your-claude-model'
MonkeysPaw.use :openai, model: 'your-openai-model'
```

**Method 2: Using the configure block**
```ruby
MonkeysPaw.configure do |config|
  config.ai_provider = :gemini  # :gemini, :claude, or :openai
  config.ai_model = 'your-model-name'
end
```

Default provider is Gemini.

## Making Your First Wish

Create a simple manifestation with just a few incantations:

```ruby
require 'monkeyspaw'

# Make your wish come true
MonkeysPaw.pick_up!
```

That's it! MonkeysPaw will interpret your desires by:

1. Reading prompt files from the `wishes/` directory
2. Channeling the AI entity to manifest your content
3. Summoning a web server (default: http://localhost:1337)

## Structuring Your Desires

MonkeysPaw follows arcane file-based conventions:

```
your-project/
├── wishes/                  # Your primary desires
│   ├── index.md            # Home page (/)
│   ├── about.md            # About page (/about)
│   └── curses/
│       ├── 01-wish.md      # First curse (/curses/01-wish)
│       └── 02-consequence.md  # Second curse (/curses/02-consequence)
├── components/             # Recurring incantations
│   ├── layout.md           # The container of all things
│   └── navigation.md       # Pathways between realms
├── assets/                 # Physical manifestations
│   └── images/
│       └── paw-mark.png
└── app.rb                  # Where the magic begins
```

## Crafting Effective Wishes (Prompts)

The art of prompt crafting is delicate. Be specific, or face the consequences of ambiguity:

```markdown
# Page: Introduction to MonkeysPaw

## Content Instructions:
Create an engaging introduction to a framework that grants web development wishes 
through AI prompts. Emphasize the need for precise language.

## Key Points:
- The dual nature of wish fulfillment: power and peril
- How imprecise wishes lead to unexpected outcomes
- Examples of well-crafted vs. poorly-crafted prompts

## Style:
- Mysterious yet professional tone
- Include a cautionary opening statement
- End with advice for the wish-maker

## Visual Elements:
- A clear warning header
- Short, foreboding paragraphs
- A callout box with "Do's and Don'ts" for prompt crafting
```

## Controlling Your Fate

Configure the terms of your pact:

```ruby
MonkeysPaw.configure do |config|
  # Server settings
  config.port = 4567
  config.host = 'localhost'
  
  # AI provider settings
  config.ai_provider = :gemini
  config.ai_model = 'your-model-name'
  
  # Caching (enabled by default)
  config.caching_enabled = true  # Set to false to disable caching
end
```

## Available AI Providers

MonkeysPaw supports multiple AI providers. Simply specify your provider and the model string that provider expects:

- **Gemini** - Google's AI models
- **Claude** - Anthropic's AI models  
- **OpenAI** - OpenAI's GPT models

Each provider regularly updates their available models. Check your provider's documentation for the latest model identifiers.

## Words of Caution

1. **Be Precise**: Ambiguity is your enemy. The more specific your wishes, the fewer surprises you'll face.
   
2. **Test Your Wishes**: Always preview the manifestation of your wishes before sharing them with others.

3. **Expect Variations**: Even with careful crafting, each wish may manifest slightly differently on each request.

4. **Mind Your Resources**: Frequent wishes may deplete your API quota. Use caching wisely.

## The Binding Contract (License)

MonkeysPaw is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

---

*"The paw grants exactly what you request, not what you intend."*
