class SlugGenerator
  CHARSETS = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a
  SLUG_LENGTH = 6

  def self.generate
    (1..SLUG_LENGTH).map { CHARSETS.sample }.join
  end
end
