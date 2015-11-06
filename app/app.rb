ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'datamapper_setter'

class BookmarkManager < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/links' do
    @links = Bookmark.all
    @user = session[:user]
    erb :'links/index'
  end

  get '/links/new' do
    p @user
    erb :'links/new'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect to('/links')
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

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id	])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
