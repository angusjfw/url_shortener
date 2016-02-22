require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/link'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/url_shortener_#{ENV['RACK_ENV']}")
DataMapper.finalize
