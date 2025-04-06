require 'spec_helper'
require 'json'
require 'fileutils'

RSpec.describe MonkeysPaw::CacheManager do
  let(:app) { MonkeysPaw::Application.new }
  let(:cache_manager) { described_class.new(app) }
  let(:test_prompt_path) { Pathname.new(Dir.mktmpdir).join('test_prompt.md') }
  let(:temp_dir) { Pathname.new(Dir.mktmpdir) }

  before do
    # Set up a temporary root directory
    app.root = temp_dir

    # Create necessary directories
    FileUtils.mkdir_p(app.pages_dir)
    FileUtils.mkdir_p(app.components_dir)

    # Create a test prompt file
    File.write(test_prompt_path, "# Test Page\n\nThis is a test page.")
  end

  after do
    # Clean up temporary files
    FileUtils.rm_rf(temp_dir)
    FileUtils.rm_rf(test_prompt_path.dirname)
  end

  describe '#get_current_dependencies' do
    context 'when component files exist' do
      before do
        # Create layout and style component files
        File.write(app.components_dir.join('layout.md'), "# Custom Layout")
        File.write(app.components_dir.join('style.md'), "# Custom Style")

        # Reload the components to recognize the new files
        app.prompt_manager.load_default_components
      end

      it 'includes file signatures for custom components' do
        deps = cache_manager.send(:get_current_dependencies, '/test', test_prompt_path)

        expect(deps['page']).to eq(Digest::MD5.hexdigest(File.read(test_prompt_path)))
        expect(deps['layout']).to eq(Digest::MD5.hexdigest("# Custom Layout"))
        expect(deps['style']).to eq(Digest::MD5.hexdigest("# Custom Style"))
      end
    end

    context 'when component files do not exist' do
      it 'uses default component prompts' do
        deps = cache_manager.send(:get_current_dependencies, '/test', test_prompt_path)

        expect(deps['page']).to eq(Digest::MD5.hexdigest(File.read(test_prompt_path)))
        expect(deps['layout']).to eq(app.prompt_manager.default_layout_prompt)
        expect(deps['style']).to eq(app.prompt_manager.default_style_prompt)
      end
    end
  end

  describe '#dependencies_changed?' do
    before do
      # Create a mock dependencies file
      deps = {
        'page' => 'test_hash',
        'layout' => app.prompt_manager.default_layout_prompt,
        'style' => app.prompt_manager.default_style_prompt
      }

      cache_key = cache_manager.send(:generate_cache_key, '/test', test_prompt_path)
      deps_file = cache_manager.cache_dir.join("#{cache_key}.deps")

      File.write(deps_file, JSON.generate(deps))
    end

    it 'detects when dependencies have changed' do
      # Change the test prompt file
      File.write(test_prompt_path, "# Modified Test Page\n\nThis page was modified.")

      expect(cache_manager.send(:dependencies_changed?, '/test', test_prompt_path)).to be true
    end

    it 'detects when dependencies have not changed' do
      # Mock the get_current_dependencies method to return consistent results
      allow(cache_manager).to receive(:get_current_dependencies).and_return({
        'page' => 'test_hash',
        'layout' => app.prompt_manager.default_layout_prompt,
        'style' => app.prompt_manager.default_style_prompt
      })

      expect(cache_manager.send(:dependencies_changed?, '/test', test_prompt_path)).to be false
    end
  end

  describe 'caching workflow' do
    it 'correctly caches and retrieves pages' do
      html_content = "<html><body>Test content</body></html>"

      # Cache the page
      cache_manager.cache_page('/test', test_prompt_path, html_content)

      # Retrieve the cached content
      cached_content = cache_manager.get_cached_page('/test', test_prompt_path)

      expect(cached_content).to eq(html_content)
    end

    it 'works correctly when no component files exist' do
      # Ensure no component files exist
      expect(File.exist?(app.components_dir.join('layout.md'))).to be false
      expect(File.exist?(app.components_dir.join('style.md'))).to be false

      html_content = "<html><body>Test content</body></html>"

      # This should not raise any errors
      expect {
        cache_manager.cache_page('/test', test_prompt_path, html_content)
        cached_content = cache_manager.get_cached_page('/test', test_prompt_path)
      }.not_to raise_error

      # Verify cached content
      cached_content = cache_manager.get_cached_page('/test', test_prompt_path)
      expect(cached_content).to eq(html_content)
    end
  end
end
