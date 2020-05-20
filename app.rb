require 'sinatra/base'
require './lib/user'

class Makersbnb < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/' do
    redirect '/user/new'
  end

  post '/login' do
    redirect '/user/login'
  end

  get '/user/login' do
    erb(:log_in)
  end

  post '/user/login' do
    @user = User.authenticate(email: params['email'], password: params['password'])
    redirect '/spaces'
  end

  get '/user/new' do
    erb(:sign_up)
  end

  post '/user/new' do
    User.create(first_name: params['first_name'], last_name: params['last_name'], email: params['email'], password: params['password'])
    redirect '/spaces'
  end

  get '/spaces' do
    erb(:list_spaces)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
