require 'sinatra/base'

class RockPaperScissors < Sinatra::Base

  enable :sessions

  get '/' do
    'Welcome to Rock, Paper Scissors!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end