require 'monkeyspaw'

# Set the project root to the current directory
MonkeysPaw.root = File.expand_path('.')

# Configure the application
MonkeysPaw.configure do |config|
  config.port = 4567
  config.host = 'localhost'
  
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
