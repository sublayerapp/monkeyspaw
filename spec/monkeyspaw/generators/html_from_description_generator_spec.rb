require 'spec_helper'

RSpec.describe MonkeysPaw::HtmlFromDescriptionGenerator do
  subject(:generator) do 
    described_class.new(
      description: page_description,
      layout_prompt: layout_prompt,
      style_prompt: style_prompt
    )
  end

  let(:page_description) { 'Create a simple hello world page' }
  let(:layout_prompt) { 'Use a centered layout with header and footer' }
  let(:style_prompt) { 'Use blue colors and sans-serif fonts' }

  describe '#prompt' do
    it 'includes the page description' do
      expect(generator.prompt).to include(page_description)
    end

    it 'includes the layout requirements when provided' do
      expect(generator.prompt).to include('Layout Requirements')
      expect(generator.prompt).to include(layout_prompt)
    end

    it 'includes the style guidelines when provided' do
      expect(generator.prompt).to include('Style Guidelines')
      expect(generator.prompt).to include(style_prompt)
    end

    it 'explains how the components work together' do
      expect(generator.prompt).to include('The three components work together')
      expect(generator.prompt).to include('page description provides')
      expect(generator.prompt).to include('layout requirements define')
      expect(generator.prompt).to include('style guidelines inform')
    end
  end
end
