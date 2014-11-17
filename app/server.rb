require 'sinatra/base'
require_relative '../lib/game'
require_relative '../lib/player'
require_relative '../lib/bot'

class RockPaperScissors < Sinatra::Base

  enable :sessions

  GAME = Game.new

  get '/' do
    @player = GAME.player1 if session[:player] == GAME.player1.object_id

    erb :index
  end

  post '/game' do
    unless session[:player] == GAME.player1.object_id
      # make new player
      @player = Player.new(params[:username])
      GAME.player1 = @player
      # add game and player to session
      session[:player] = @player.object_id
      session[:game] = GAME.object_id
      # add computer player
      @botnames = ["Hamish", "Angus", "Ivy", "Hercules"]
      @bot = Bot.new(@botnames.sample)
      GAME.player2 = @bot
    end
    @player = GAME.player1
    @opponent = GAME.player2
    # check values in console
      # p session
      # p @player
      # p GAME.player1.object_id
      # p GAME
      # p GAME.object_id
    if params[:selection]
      # get player selection
      @player.selection=(params[:selection])
      @opponent.select_object
      # trigger computer slection
      GAME.turn
      @round_winner = GAME.round_winner
      if GAME.round_winner
        p @round_winner.name
      end
    end
      erb :game

  end

  post '/reset' do
    GAME = Game.new
    session[:player] = nil
    session[:game] = GAME.object_id
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end