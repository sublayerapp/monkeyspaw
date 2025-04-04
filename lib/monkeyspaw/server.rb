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
      HtmlFromDescriptionGenerator.new(description: File.read(prompt_file)).generate
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
