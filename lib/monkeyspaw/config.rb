module MonkeysPaw
  class Config
    attr_accessor :ai_provider,
                  :ai_model,
                  :pages_dir,
                  :components_dir,
                  :assets_dir,
                  :port,
                  :host,
                  :caching_enabled

    def initialize
      @ai_provider = :gemini
      @ai_model = 'gemini-2.0-flash-exp'
      @pages_dir = 'wishes'
      @components_dir = 'components'
      @assets_dir = 'assets'
      @port = 1337
      @host = "localhost"
      @caching_enabled = true
    end

    def to_h
      instance_variables.each_with_object({}) do |var, hash|
        hash[var.to_s.delete('@').to_sym] = instance_variable_get(var)
      end
    end
  end
end
