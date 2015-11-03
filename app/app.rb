require 'sinatra/base'
require_relative 'models/bookmark'

class BookmarkManager < Sinatra::Base
  get '/links' do
    @links = Bookmark.all
    erb :'links/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
