module MonkeysPaw
  class PromptManager
    attr_reader :app
    attr_accessor :layout_prompt, :style_prompt

    def initialize(app)
      @app = app
      load_default_components
    end

    def get_page_prompt(path)
      path = "/" if path.empty?
      app.router.get_file(path)
    end

    def get_component_prompt(component_name)
      component_file = app.components_dir.join("#{component_name}.md")
      component_file if component_file.exist?
    end

    def load_layout_prompt
      layout_file = get_component_prompt('layout')
      if layout_file
        @layout_prompt = File.read(layout_file)
      else
        @layout_prompt = default_layout_prompt
      end
    end

    def load_style_prompt
      style_file = get_component_prompt('style')
      if style_file
        @style_prompt = File.read(style_file)
      else
        @style_prompt = default_style_prompt
      end
    end

    def load_default_components
      load_layout_prompt
      load_style_prompt
    end

    private

    def default_layout_prompt
      <<~LAYOUT
        # Layout Component

        Create a simple and clean layout with:
        - A responsive header at the top with the page title
        - A main content area that contains the primary content
        - A footer with copyright information
        - Navigation links if appropriate for the context

        The layout should be responsive and work well on mobile and desktop devices.
      LAYOUT
    end

    def default_style_prompt
      <<~STYLE
        # Style Component

        Apply these styling guidelines:
        - Use a clean, minimalist design with ample white space
        - Color scheme: soft blues (#4A90E2) for primary elements, light gray (#F5F5F5) for backgrounds
        - Typography: Sans-serif fonts (system-ui) with good readability
        - Interactive elements should have subtle hover effects
        - Content should be well-structured with clear hierarchy
        - Ensure good contrast for accessibility
      STYLE
    end
  end
end