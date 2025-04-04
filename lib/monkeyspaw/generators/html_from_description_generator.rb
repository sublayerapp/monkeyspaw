module MonkeysPaw
  class HtmlFromDescriptionGenerator < Sublayer::Generators::Base
    llm_output_adapter type: :single_string,
      name: "html_code",
      description: "The generated HTML code for the web page"

    def initialize(description:, layout_prompt: nil, style_prompt: nil)
      @description = description
      @layout_prompt = layout_prompt
      @style_prompt = style_prompt
    end

    def generate
      max_retries = 3
      retry_count = 0
      
      begin
        super
      rescue => e
        retry_count += 1
        if retry_count <= max_retries
          puts "Generator attempt #{retry_count}/#{max_retries} failed: #{e.message}. Retrying..."
          sleep(1) # Add a small delay between retries
          retry
        else
          puts "Generator failed after #{max_retries} attempts. Last error: #{e.message}"
          raise
        end
      end
    end

    def prompt
      layout_section = ""
      style_section = ""

      if @layout_prompt
        layout_section = <<~LAYOUT_SECTION
          ## Layout Requirements:
          #{@layout_prompt}
        LAYOUT_SECTION
      end

      if @style_prompt
        style_section = <<~STYLE_SECTION
          ## Style Guidelines:
          #{@style_prompt}
        STYLE_SECTION
      end

      <<~PROMPT
        You are an expert HTML developer.

        You are tasked with writing HTML code based on the following description:

        #{@description}

        #{layout_section}
        #{style_section}

        Take a deep breath and think step by step before you start coding. Ensure the HTML is well-formed and valid.
        
        The three components work together as follows:
        1. The page description provides the specific content and features this page should have
        2. The layout requirements define the structural organization and placement of elements
        3. The style guidelines inform the visual presentation and aesthetic choices
        
        Harmonize these elements to create a cohesive and effective web page that fulfills the intended purpose.
      PROMPT
    end
  end
end