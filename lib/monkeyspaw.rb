require "sublayer"

require "monkeyspaw/version"
require "monkeyspaw/application"
require "monkeyspaw/config"
require "monkeyspaw/server"
require "monkeyspaw/router"
require "monkeyspaw/prompt_manager"
require "monkeyspaw/cache_manager"

Dir[File.expand_path("../monkeyspaw/generators/*.rb", __FILE__)].each { |f| require f }

module MonkeysPaw
  class << self
    def application
      @application ||= Application.new
    end

    def configure(&block)
      application.configure(&block)
    end

    def use(provider, model: nil)
      application.config.ai_provider = provider
      application.config.ai_model = model if model
    end

    def root
      application.root
    end

    def pages_dir
      application.pages_dir
    end

    def components_dir
      application.components_dir
    end

    def assets_dir
      application.assets_dir
    end

    def pick_up!(**options)
      application.pick_up!(**options)
    end

    def root=(path)
      application.root = path
    end
  end
end

if $0 == __FILE__
  MonkeysPaw.pick_up!
end
