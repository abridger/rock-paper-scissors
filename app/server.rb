require 'sinatra/base'
require_relative '../lib/game'
require_relative '../lib/player'

class RockPaperScissors < Sinatra::Base

  enable :sessions

  GAME = Game.new

  get '/' do
    @player = GAME.player1 if session[:player] == GAME.player1.object_id

    erb :index
  end

  post '/game' do
    if session[:player] == GAME.player1.object_id  
      @player = GAME.player1
    else
      # make new player
      @player = Player.new(params[:username])
      
      GAME.player1 = @player
      # add game and player to session
      session[:player] = @player.object_id
      session[:game] = GAME.object_id
    end
    # check values in console
    p session
    p @player
    p GAME.player1.object_id
    p GAME
    p GAME.object_id

    erb :game
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end