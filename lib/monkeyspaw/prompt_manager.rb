module MonkeysPaw
  class PromptManager
    attr_reader :app

    def initialize(app)
      @app = app
    end

    def get_page_prompt(path)
      path = "/" if path.empty?

      app.router.get_file(path)
    end
  end
end
