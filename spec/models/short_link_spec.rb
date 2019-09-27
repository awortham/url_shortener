require 'rails_helper'

RSpec.describe ShortLink, type: :model do
  describe '#convert_to_short_link' do
    context 'when not given a url' do
      it 'is not valid' do
        expect(ShortLink.new).to_not be_valid
      end
    end

    context 'when given a url' do
      let(:long_url) { 'https://kapost.com' }
      let(:short_link) { ShortLink.create(original_url: long_url) }

      it 'creates a shortened version' do
        expect(short_link).to_not be nil
        expect(short_link.short_url.length).to eq 6
      end
    end
  end
end
