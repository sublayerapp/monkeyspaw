module MonkeysPaw
  class HtmlFromDescriptionGenerator < Sublayer::Generators::Base
    llm_output_adapter type: :single_string,
      name: "html_code",
      description: "The generated HTML code for the web page"

    def initialize(description:)
      @description = description
    end

    def generate
      super
    end

    def prompt
      <<-PROMPT
        You are an expert HTML developer.

        You are tasked with writing HTML code based on the following description:

        #{@description}

        Take a deep breath and think step by step before you start coding. Ensure the HTML is well-formed and valid.
      PROMPT
    end
  end
end
