require 'monkeyspaw'

# Configure AI provider - choose one of the following:
# MonkeysPaw.use :gemini, model: 'gemini-2.0-flash-exp'
# MonkeysPaw.use :claude, model: 'claude-3-5-sonnet-20241022' 
# MonkeysPaw.use :openai, model: 'gpt-4o-mini'

# Or configure via the config block
MonkeysPaw.configure do |config|
  config.port = 4567
  config.host = 'localhost'

  # AI provider configuration
  config.ai_provider = :gemini  # :gemini, :claude, or :openai
  config.ai_model = 'gemini-2.0-flash-exp'

  # Enable caching to improve performance
  # Pages will only regenerate when their content or dependencies change
  config.caching_enabled = true

  # Default directories are 'wishes', 'components', and 'assets'
end

# Force clear cache with command line argument --clear-cache
if ARGV.include?('--clear-cache')
  puts "Clearing cache before starting server..."
  MonkeysPaw.application.cache_manager.clear_cache
end

# Make your wish come true
MonkeysPaw.pick_up!
