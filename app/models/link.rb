require 'securerandom'

class Link
  include DataMapper::Resource

  property :id,               Serial
  property :original_url,     URI
  property :code,             String

  def generate_code
    self.code = SecureRandom.urlsafe_base64(6)
  end
end
