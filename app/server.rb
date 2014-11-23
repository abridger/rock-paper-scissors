require 'sinatra/base'
require_relative '../lib/game'
require_relative '../lib/player'
require_relative '../lib/bot'

class RockPaperScissors < Sinatra::Base

  enable :sessions

  GAME = Game.new

  get '/' do
    check_current_player
    erb :index
  end

  post '/game' do
    session[:game] = GAME.object_id
    add_player unless GAME.player1
    add_bot unless GAME.player2
    check_current_player

    if params[:selection]
      @current_player.selection=(params[:selection])
      @opponent.selection if @opponent.is_a? Bot

      if @opponent.selection
        GAME.turn
        @round_winner = GAME.round_winner
        erb :game
      end
    end
      erb :game
  end

  get '/reset' do
    GAME = Game.new
    session[:player] = nil
    session[:game] = GAME.object_id
    erb :index
  end

  helpers do
    def add_player
      @player = Player.new(params[:username])
      GAME.add_player(@player)
      session[:player] = @player.object_id
    end

    def add_bot
      @bot = Bot.new
      GAME.add_player(@bot)
    end

    def check_current_player
      if GAME.player1.object_id == session[:player]
        @current_player = GAME.player1
        @opponent = GAME.player2
      else
        @current_player = GAME.player2
        @opponent = GAME.player1
      end
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
