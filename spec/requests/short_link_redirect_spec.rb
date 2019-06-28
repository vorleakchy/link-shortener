require 'rails_helper'

RSpec.describe 'Short link redirect', type: :request do
  context 'when short link is active' do
    it 'redirects to original url' do
      short_link = create(:short_link)
      get short_path(short_link.slug)

      expect(response).to redirect_to(short_link.original_url)
    end

    it 'increments view count' do
      short_link = create(:short_link)

      expect {
        get short_path(short_link.slug)
      }.to change {short_link.reload.view_count}.by(1)
    end
  end

  context 'when short link is expired' do
    it 'renders 404' do
      short_link = create(:short_link, :expired)
      short_link.expire
      get short_path(short_link.slug)

      expect(response).to have_http_status(404)
    end
  end
end
