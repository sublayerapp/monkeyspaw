module MonkeysPaw
  class Config
    attr_accessor :provider,
                  :model,
                  :pages_dir,
                  :components_dir,
                  :assets_dir,
                  :port,
                  :host,
                  :caching_enabled

    def initialize
      @provider = nil
      @model = nil
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
