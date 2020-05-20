require 'sinatra/base'
require 'sinatra/flash'
require './lib/user'

class Makersbnb < Sinatra::Base
  register Sinatra::Flash

  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/user/login' do
    erb(:log_in)
  end

  post '/user/login' do
    user = User.authenticate(email: params['email'], password: params['password'])
    if user
      session[:user] = user
      redirect '/spaces'
    else
       flash[:notice] = 'Please check your email or password.'
       redirect('/user/login')
    end

  end

  get '/user/new' do
    erb(:sign_up)
  end

  post '/user/new' do
    session[:user] = User.create(first_name: params['first_name'], last_name: params['last_name'], email: params['email'], password: params['password'])
    redirect '/spaces'
  end

  get '/spaces' do
    @user = session[:user]
    erb(:list_spaces)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
