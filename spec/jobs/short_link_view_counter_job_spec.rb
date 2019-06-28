require 'rails_helper'

RSpec.describe ShortLinkViewCounterJob, type: :job do
  it 'increments view count' do
    short_link = create(:short_link)

    expect {
      ShortLinkViewCounterJob.perform_now(short_link)
    }.to change {short_link.reload.view_count}.by(1)
  end
end
