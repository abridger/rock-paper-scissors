class Game

  DEFAULT_MAX_ROUNDS = 3

  attr_accessor :player1, :player2, :players, :max_rounds
  attr_reader :round, :round_winner, :overall_winner

  def initialize
    player1, player2 = nil
    @round = 1
    @max_rounds = DEFAULT_MAX_ROUNDS
    @winning_combinations = {rock: :scissors, scissors: :paper, paper: :rock}
  end

  def add_player(player)
    self.player1 ? self.player2 = player : self.player1 = player
  end

  def turn
    raise "The game is over" if @round > @max_rounds
    self.check_winner
    @round_winner.add_point unless @round_winner.nil?
    @round += 1
  end

  def check_winner
    if self.player1_wins
      @round_winner = player1
    elsif self.player2_wins
      @round_winner = player2
    else
      @round_winner = nil
    end
  end

  def player1_wins
    @winning_combinations[player1.selection] == player2.selection
  end

  def player2_wins
    @winning_combinations[player2.selection] == player1.selection
  end

  def choose_winner
    @overall_winner = player1 if player1.points >= 2
    @overall_winner = player2 if player2.points >= 2
  end

end
