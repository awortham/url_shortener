require 'rails_helper'

RSpec.describe ShortLinksController, type: :controller do
  let(:long_url) { 'https://kapost.com' }
  let(:request) { post :create, body: { long_url: long_url }.to_json, as: :json }

  describe 'POST create' do
    it 'creates a ShortLink' do
      expect { request }.to change { ShortLink.count }.by 1

      expect(JSON.parse(response.body).keys).to eq(['long_url', 'short_link'])
    end

    context 'when ShortLink has already been created' do
      let!(:short_link) { ShortLink.create(original_url: long_url) }

      it 'does not create a new ShortLink' do
        expect { request }.to_not change { ShortLink.count }
      end
    end
  end

  describe 'GET show' do
    let!(:short_link) { ShortLink.create(original_url: long_url) }

    it 'is a redirect' do
      get :show, params: { short_url: short_link.short_url }

      expect(response.status).to eq 301
    end
  end
end
