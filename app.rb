require 'sinatra/base'
require 'sinatra/flash'
require './lib/user'
require './lib/spaces.rb'
require './lib/availability.rb'

# Global for verbose output
# $verbose = true


class Makersbnb < Sinatra::Base
  register Sinatra::Flash

  enable :sessions

  before '/' do
    verbose_output(request) if $verbose
  end

  get '/' do
    erb(:index)
  end

  get '/sessions/new' do
    erb(:log_in)
  end

  post '/sessions' do
    user = User.authenticate(email: params['email'], password: params['password'])
    if user
      session[:user] = user
      redirect '/spaces'
    else
       flash[:notice] = 'Please check your email or password.'
       redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/')
  end

  get '/user/new' do
    erb(:sign_up)
  end

  post '/user' do
    if User.password_same?(password: params['password'], confirm_password: params['confirm_password'])
      session[:user] = User.create(first_name: params['first_name'], last_name: params['last_name'], email: params['email'], password: params['password'])
      redirect '/spaces'
    else
       flash[:notice] = 'Please ensure your passwords match.'
       redirect('/user/new')
    end
  end

  get '/spaces' do
    @user = session[:user]
    @spaces = Spaces.all
    # p @user
    erb(:list_spaces)
  end

  get '/spaces/new' do
    @user = session[:user]
    # p @user
    erb(:add_space)
  end

  get '/spaces/:id' do
    @user = session[:user]
    @spaces = Spaces.all
    @availability = Availability.retrieve_availability(params[:id].to_i)
    p @availability

    @spaces.each do |space|
      if space.id == params[:id].to_i
        @space = space
      end
    end
    erb(:view_space)
  end

  post '/confirm_add' do
    @user = session[:user]
    # p @user
    space = Spaces.add_space(params['name'], params['description'], params['price'], @user.id)
    Availability.add(start_date: params['start_date'], end_date: params['end_date'], spaceID: space.id)

    flash[:notice] = 'Your listing has been added'
    redirect('/spaces')
  end

  get '/confirm' do
    @user = session[:user]
    erb(:confirm)
  end


  # start the server if ruby file executed directly
  run! if app_file == $0

  private

  # :nocov:
  def verbose_output(request)
    puts "\n#{request.request_method}: #{request.path}"
    puts "session: "; p session
    puts "params: "; p params
  end
  # :nocov:


end
