ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'

require_relative 'data_mapper_setup'

class URLShortener < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/links' do
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    redirect '/links'
  end
end
