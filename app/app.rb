ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'datamapper_setter'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Bookmark.all
    erb :'links/index'
  end

  get '/links/new' do
  	erb :'links/new'
  end

  post '/links' do
    bookmark = Bookmark.create(url: params[:url], name: params[:name])
    params[:tags].split(' ').each do |element|
      bookmark.tags << Tag.create(name: element)
    end
    bookmark.save
    redirect to('/links')
  end

  get '/tags/:name' do
    tag = Tag.all(name: params[:name])
    @links = tag ? tag.bookmarks : []
    erb :'links/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
