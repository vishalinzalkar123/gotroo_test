class ShortenedUrl < ApplicationRecord
  validates :original_url, presence: true, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])

  before_create :shorten_original_url

  private

  def shorten_original_url
    self.short_url ||= SecureRandom.urlsafe_base64(6)
  end
end
