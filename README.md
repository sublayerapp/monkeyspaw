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
  config.port = 4567
  config.host = 'localhost'
end
```

## Mystical Entities Available for Summoning (TODO)

MonkeysPaw can channel various AI entities:

```ruby
# The Gemini Spirit
MonkeysPaw.use :gemini, model: :gemini_2_0_flash

# The OpenAI Oracle
MonkeysPaw.use :openai, model: :gpt_4

# The Anthropic Sage
MonkeysPaw.use :anthropic, model: :claude_3_opus

# The Mistral Wind
MonkeysPaw.use :mistral, model: :mistral_large
```

## Words of Caution

1. **Be Precise**: Ambiguity is your enemy. The more specific your wishes, the fewer surprises you'll face.
   
2. **Test Your Wishes**: Always preview the manifestation of your wishes before sharing them with others.

3. **Expect Variations**: Even with careful crafting, each wish may manifest slightly differently on each request.

4. **Mind Your Resources**: Frequent wishes may deplete your API quota. Use caching wisely.

## The Binding Contract (License)

MonkeysPaw is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

---

*"The paw grants exactly what you request, not what you intend."*
