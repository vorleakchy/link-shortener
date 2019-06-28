class ShortLink < ApplicationRecord
  validates :original_url, presence: true, uniqueness: true, url: true
  before_create :generate_slug

  def expire
    self.expires_at = Time.now
    save
  end

  def active?
    expires_at.blank?
  end

  private

  def generate_slug
    self.slug = SlugGenerator.generate
  end
end
