require 'digest'
require 'fileutils'

module MonkeysPaw
  class CacheManager
    attr_reader :app, :cache_dir
    
    def initialize(app)
      @app = app
      @cache_dir = app.root.join('.monkeyspaw_cache')
      @cache_dir.mkpath unless @cache_dir.exist?
    end
    
    def get_cached_page(path, prompt_file)
      cache_key = generate_cache_key(path, prompt_file)
      cache_file = cache_dir.join("#{cache_key}.html")
      
      return nil unless cache_file.exist?
      
      # If the cache exists, check if any dependencies have changed
      if dependencies_changed?(path, prompt_file)
        puts "Dependencies changed for #{path}, regenerating..."
        return nil
      end
      
      puts "Using cached version of #{path}"
      File.read(cache_file)
    end
    
    def cache_page(path, prompt_file, html_content)
      cache_key = generate_cache_key(path, prompt_file)
      cache_file = cache_dir.join("#{cache_key}.html")
      
      # Save the HTML content
      File.write(cache_file, html_content)
      
      # Save dependency information
      save_dependencies(path, prompt_file)
      
      puts "Cached page #{path}"
    end
    
    def clear_cache
      FileUtils.rm_rf(cache_dir)
      cache_dir.mkpath
      puts "Cache cleared"
    end
    
    private
    
    def generate_cache_key(path, prompt_file)
      # Create a unique but readable key based on the path
      safe_path = path.gsub(/[^a-zA-Z0-9_-]/, '_')
      safe_path = 'index' if safe_path == '_'
      safe_path
    end
    
    def dependencies_changed?(path, prompt_file)
      deps_file = cache_dir.join("#{generate_cache_key(path, prompt_file)}.deps")
      return true unless deps_file.exist?
      
      current_deps = get_current_dependencies(path, prompt_file)
      stored_deps = JSON.parse(File.read(deps_file))
      
      # Compare the stored and current dependencies
      current_deps != stored_deps
    end
    
    def get_current_dependencies(path, prompt_file)
      deps = {}
      
      # Page content dependency
      deps["page"] = file_signature(prompt_file)
      
      # Layout component dependency
      layout_file = app.prompt_manager.get_component_prompt('layout')
      deps["layout"] = layout_file ? file_signature(layout_file) : app.prompt_manager.default_layout_prompt
      
      # Style component dependency
      style_file = app.prompt_manager.get_component_prompt('style')
      deps["style"] = style_file ? file_signature(style_file) : app.prompt_manager.default_style_prompt
      
      deps
    end
    
    def save_dependencies(path, prompt_file)
      deps_file = cache_dir.join("#{generate_cache_key(path, prompt_file)}.deps")
      deps = get_current_dependencies(path, prompt_file)
      
      File.write(deps_file, JSON.generate(deps))
    end
    
    def file_signature(file_path)
      content = File.read(file_path)
      Digest::MD5.hexdigest(content)
    end
  end
end