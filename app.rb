require 'sinatra/base'

class User < Sinatra::Base
  run! if app_file == $0
end
