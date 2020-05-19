require 'sinatra/base'

class Makersbnb < Sinatra::Base

  get '/' do
    erb(:index)
  end

  run! if app_file == $0
end
