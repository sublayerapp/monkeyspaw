require 'spec_helper'

RSpec.describe MonkeysPaw::PromptManager do
  let(:app) { MonkeysPaw::Application.new }
  subject(:prompt_manager) { described_class.new(app) }

  it 'initializes with an application' do
    expect(prompt_manager.app).to eq(app)
  end

  it 'loads default components when initialized' do
    expect(prompt_manager.layout_prompt).not_to be_nil
    expect(prompt_manager.style_prompt).not_to be_nil
  end

  describe '#load_layout_prompt' do
    it 'provides a default layout prompt when no file exists' do
      prompt_manager.load_layout_prompt
      expect(prompt_manager.layout_prompt).to include('Layout Component')
      expect(prompt_manager.layout_prompt).to include('responsive header')
    end
  end

  describe '#load_style_prompt' do
    it 'provides a default style prompt when no file exists' do
      prompt_manager.load_style_prompt
      expect(prompt_manager.style_prompt).to include('Style Component')
      expect(prompt_manager.style_prompt).to include('clean, minimalist design')
    end
  end
end
