require 'rails_helper'

RSpec.describe ShortLink, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:original_url) }
  end

  context 'when create short link' do
    subject { create(:short_link) }

    it 'generates slug' do
      expect(subject.slug).not_to be_empty
    end
  end

  describe '#active?' do
    subject { create(:short_link) }

    it 'returns true when not expired' do
      expect(subject.active?).to eq true
    end

    it 'return false when set to expired' do
      subject.expire
      expect(subject.active?).to eq false
    end
  end
end
