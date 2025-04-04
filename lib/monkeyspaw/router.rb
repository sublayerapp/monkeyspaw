module MonkeysPaw
  class Router
    attr_reader :app, :routes

    def initialize(app)
      @app = app
      @routes = {}
      scan_pages
    end

    def scan_pages
      @routes = {}
      pages_dir = app.pages_dir

      return unless pages_dir.exist?

      page_files = Dir.glob(pages_dir.join('**', '*.md'))

      page_files.each do |file|
        rel_path = Pathname.new(file).relative_path_from(pages_dir)
        route = '/' + rel_path.to_s.sub(/\.md$/, '')

        route = route.sub(/\/index$/, '/')

        @routes[route] = file
      end

      @routes = @routes.sort_by { |route, file| file }.to_h
    end

    def get_file(path)
      @routes[path]
    end

    def next_page(current_path)
      keys = @routes.keys
      current_index = keys.find_index(current_path)
      return nil unless current_index
      keys[current_index + 1]
    end

    def prev_page(current_path)
      keys = @routes.keys
      current_index = keys.find_index(current_path)
      return nil unless current_index || current_index == 0
      keys[current_index - 1]
    end

    def get_route_for_file(file)
      @routes.key(file)
    end
  end
end
