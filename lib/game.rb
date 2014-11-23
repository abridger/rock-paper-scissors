class Game

  attr_accessor :player1, :player2, :players
  attr_reader :round, :round_winner

  def initialize
    player1, player2 = nil
    @round = 1
    @winning_combinations = {rock: :scissors, scissors: :paper, paper: :rock}
  end

  def add_player(player)
    self.player1 ? self.player2 = player : self.player1 = player
  end

  def turn
    raise "The game is over" if @round >= 3
    check_winner
    @round_winner.add_point unless @round_winner.nil?
    @round += 1
  end

  def check_winner
    @winning_combinations.each do |key, value|
      @round_winner = player1 if player1_wins(key, value)
      @round_winner = player2 if player2_wins(key, value)
    end
  end

  def player1_wins(selection, opponent_selection)
    player1.selection == selection && player2.selection == opponent_selection
  end

  def player2_wins(selection, opponent_selection)
    player2.selection == selection && player1.selection == opponent_selection
  end

  def overall_winner
    return player1 if player1.points >= 2
    return player2 if player2.points >= 2
  end

end
