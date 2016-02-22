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
    link = Link.first(code: params[:code])
    @original_url = link.original_url
    erb :'/links/link'
  end

  get '/:code' do
    link = Link.first(code: params[:code])
    original_url = link.original_url
    redirect original_url
  end
end
