require 'spec_helper'

RSpec.describe MonkeysPaw::Application do
  subject(:application) { described_class.new }
  
  it 'initializes with default values' do
    expect(application.config).to be_a(MonkeysPaw::Config)
    expect(application.root).to be_a(Pathname)
  end

  describe '#configure' do
    it 'yields the config object to the block' do
      expect { |b| application.configure(&b) }.to yield_with_args(application.config)
    end

    it 'allows setting configuration values' do
      application.configure do |config|
        config.port = 8080
        config.host = '127.0.0.1'
      end

      expect(application.config.port).to eq(8080)
      expect(application.config.host).to eq('127.0.0.1')
    end
  end

  describe 'directory methods' do
    it 'returns the pages directory' do
      expect(application.pages_dir).to eq(application.root.join('wishes'))
    end

    it 'returns the components directory' do
      expect(application.components_dir).to eq(application.root.join('components'))
    end

    it 'returns the assets directory' do
      expect(application.assets_dir).to eq(application.root.join('assets'))
    end

    it 'allows changing the root directory' do
      new_path = Pathname.new('/tmp/monkeyspaw-test')
      application.root = new_path
      expect(application.root).to eq(new_path)
      expect(application.pages_dir).to eq(new_path.join('wishes'))
    end
  end
end
