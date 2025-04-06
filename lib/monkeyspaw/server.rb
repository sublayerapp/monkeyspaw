require "rack"
require "rack/handler/puma"

module MonkeysPaw
  class Server
    attr_reader :app

    def initialize(app, **options)
      @app = app
      @options = options
      @rack_app = build_rack_app
    end

    def start
      host = @options[:host] || app.config.host || 'localhost'
      port = @options[:port] || app.config.port || 1337

      puts "You pick up the monkey's paw. Be careful what you wish for on http://#{host}:#{port}"

      setup_signal_handlers

      Rack::Handler::Puma.run(@rack_app, Host: host, Port: port, Silent: true, Threads: "0:16", workers: 0)
    end

    def shutdown
      puts "Enough! You throw the paw away. Hopefully there were no unintended consequences. Mua ha ha ha ha!"
      exit
    end

    def generate_page(path, prompt_file)
      if app.config.caching_enabled
        # Try to get from cache first
        cached_content = app.cache_manager.get_cached_page(path, prompt_file)
        return cached_content if cached_content
      end

      # Cache miss or caching disabled, generate the page
      # Reload layout and style prompts to pick up changes
      app.prompt_manager.load_default_components
      layout_prompt = app.prompt_manager.layout_prompt
      style_prompt = app.prompt_manager.style_prompt

      html_content = HtmlFromDescriptionGenerator.new(
        description: File.read(prompt_file),
        layout_prompt: layout_prompt,
        style_prompt: style_prompt
      ).generate

      # Store in cache if enabled
      if app.config.caching_enabled
        app.cache_manager.cache_page(path, prompt_file, html_content)
      end

      html_content
    end

    def generate_error_page(message)
      "<html><body><h1>Error</h1><p>#{message}</p></body></html>"
    end

    private

    def setup_signal_handlers
      [:INT, :TERM].each do |signal|
        trap(signal) { shutdown }
      end
    end

    def build_rack_app
      server = self

      Rack::Builder.new do
        use Rack::Static,
          urls: ["/assets"],
          root: server.app.root.to_s

        run lambda { |env|
          request = Rack::Request.new(env)

          path = request.path
          path = "/" if path.empty?

          if request.params["preload"]
            prompt_file = server.app.get_page_prompt(path)
            Thread.new { server.generate_page(path, prompt_file) } if prompt_file

            return [204, {}, []]
          end

          prompt_file = server.app.get_page_prompt(path)

          if prompt_file
            html = server.generate_page(path, prompt_file)

            next_path = server.app.router.next_page(path)
            if next_path
              next_prompt = server.app.get_page_prompt(next_path)
              Thread.new { server.generate_page(next_path, next_prompt) } if next_prompt
            end

            [200, { "Content-Type" => "text/html"}, [html]]
          else
            [404, {"Content-Type" => "text/html"}, [server.generate_error_page("Page not found: #{path}")]]
          end
        }
      end
    end

  end
end
