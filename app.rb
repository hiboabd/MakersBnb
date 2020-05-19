require 'sinatra/base'

class User < Sinatra::Base

  get '/' do
    'hello!'
  end 
  
  run! if app_file == $0
end
