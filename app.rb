require 'sinatra/base'

class Makersbnb < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/user' do
    redirect '/user/new'
  end

  get '/user/new' do
    erb(:sign_up)
  end

  post '/user/new' do
    redirect '/spaces'
  end

  get '/spaces' do
    erb(:list_spaces)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
