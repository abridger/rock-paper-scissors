require 'sinatra/base'
require_relative '../lib/game'

class RockPaperScissors < Sinatra::Base

  enable :sessions

  GAME = Game.new

  get '/' do
    erb :index
  end

  post '/game' do
    # make new player
    @username = params[:username]
    GAME.player1 = @username
    # add game and player to session
    session[:username] = @username.object_id
    session[:game] = GAME.object_id
    
    # check values in console
    p session
    p @username
    p GAME.player1.object_id
    p GAME
    p GAME.object_id

    erb :game
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end