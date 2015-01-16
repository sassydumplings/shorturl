class ShortUrl < ActiveRecord::Base
  validates_presence_of :full, :short
  validates_format_of :full,
    with: /\Ahttps?:\/\/([\da-z\.]+)\.([a-z\.]{2,6})([\/\w \.])\/?\z/,
    message: "url is not a valid url"

  before_validation :ensure_existence_of_short
  before_validation :ensure_protocol

  def ensure_existence_of_short
    # 64 ^ 6 options
    self.short ||= SecureRandom.urlsafe_base64 4
  end

  def ensure_protocol
    unless self.full.match /\Ahttps?:\/\//
      self.full = 'http://' + self.full
    end
  end

end
