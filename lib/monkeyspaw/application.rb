require "pathname"

module MonkeysPaw
  class Application
    attr_reader :config
    attr_accessor :root, :router

    def initialize
      @config = Config.new
      @root = Pathname.new(Dir.pwd)
      @server = nil
      @router = nil
      @prompt_manager = nil
    end
    
    def prompt_manager
      @prompt_manager ||= PromptManager.new(self)
    end

    def configure
      yield config if block_given?
      self
    end

    def use(provider, **options)
      puts "Use called"
    end

    def pick_up!(**options)
      setup_directories

      @router ||= Router.new(self)
      
      # Initialize prompt manager
      prompt_manager

      @server ||= Server.new(self, **options)
      @server.start
    end

    def pages_dir
      root.join(config.pages_dir || 'wishes')
    end

    def components_dir
      root.join(config.components_dir || 'components')
    end

    def assets_dir
      root.join(config.assets_dir || 'assets')
    end

    def get_page_prompt(path)
      @prompt_manager.get_page_prompt(path)
    end

    def get_component_prompt(path)
      @prompt_manager.get_component_prompt(path)
    end

    private

    def setup_directories
      [pages_dir, components_dir, assets_dir].each do |dir|
        dir.mkpath unless dir.exist?
      end
    end
  end
end
