require "sublayer"

require "monkeyspaw/version"
require "monkeyspaw/application"
require "monkeyspaw/config"
require "monkeyspaw/server"
require "monkeyspaw/router"
require "monkeyspaw/prompt_manager"

Dir[File.expand_path("../monkeyspaw/generators/*.rb", __FILE__)].each { |f| require f }

module MonkeysPaw
  Sublayer.configuration.ai_provider = Sublayer::Providers::Gemini
  Sublayer.configuration.ai_model = "gemini-2.0-flash"

  class << self
    def application
      @application ||= Application.new
    end

    def configure(&block)
      application.configure(&block)
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
