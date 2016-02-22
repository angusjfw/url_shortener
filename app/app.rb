ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'

require_relative 'data_mapper_setup'

class URLShortener < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    @link = Link.new(original_url: params[:url])
    @link.generate_code
    @link.save
    @code = @link.code
    redirect "/links/#{@code}"
  end

  get '/links/:code' do
    @code = params[:code]
    erb :'/links/link'
  end
end
