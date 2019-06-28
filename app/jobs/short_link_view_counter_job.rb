class ShortLinkViewCounterJob < ApplicationJob
  queue_as :default

  def perform(short_link)
    short_link.increment!(:view_count)
  end
end
