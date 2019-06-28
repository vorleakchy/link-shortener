require 'rails_helper'

RSpec.describe SlugGenerator, type: :lib do
  describe '.generate' do
    let(:slug) { SlugGenerator.generate }

    it 'returns 6 chars' do
      expect(slug.size).to be 6
    end

    it 'returns not empty' do
      expect(slug).not_to be_empty
    end
  end
end
