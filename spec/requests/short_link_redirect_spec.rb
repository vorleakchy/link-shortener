require 'rails_helper'

RSpec.describe 'Short link redirect', type: :request do
  context 'when short link is active' do
    it 'redirects to original url' do
      short_link = create(:short_link)
      get short_path(short_link.slug)

      expect(response).to redirect_to(short_link.original_url)
    end

    it 'calls short link view counter job' do
      short_link = create(:short_link)

      expect {
        get short_path(short_link.slug)
      }.to have_enqueued_job(ShortLinkViewCounterJob).with(short_link)
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
