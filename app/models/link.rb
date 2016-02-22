class Link
  include DataMapper::Resource

  property :id,               Serial
  property :original_url,     URI
end
