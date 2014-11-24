require 'sinatra/base'
require_relative '../lib/game'
require_relative '../lib/player'
require_relative '../lib/bot'
require_relative './helpers'

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
      make_selections
      if @opponent.selection
        play_round
        redirect('/game-over') if GAME.round > GAME.max_rounds
      end
    end
    erb :game
  end

  get '/game-over' do
    GAME.choose_winner
    check_current_player
    choose_winner
    erb :"game-over"
  end

  get '/new-game' do
    check_current_player
    GAME = Game.new
    session[:game] = GAME.object_id
    erb :index
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

    def make_selections
      @current_player.selection=(params[:selection]).to_sym
      @opponent.select if @opponent.is_a? Bot
    end

    def play_round
      GAME.turn
    end

    def choose_winner
      @winner = @current_player if GAME.overall_winner.object_id == @current_player.object_id
      @winner = @opponent if GAME.overall_winner.object_id == @opponent.object_id
    end

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
