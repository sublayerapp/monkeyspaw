require 'spec_helper'

RSpec.describe MonkeysPaw::Config do
  subject(:config) { described_class.new }

  it 'initializes with default values' do
    expect(config.pages_dir).to eq('wishes')
    expect(config.components_dir).to eq('components')
    expect(config.assets_dir).to eq('assets')
    expect(config.port).to eq(1337)
    expect(config.host).to eq('localhost')
  end

  it 'can be converted to a hash' do
    expect(config.to_h).to include(
      pages_dir: 'wishes',
      components_dir: 'components',
      assets_dir: 'assets',
      port: 1337,
      host: 'localhost'
    )
  end
end
