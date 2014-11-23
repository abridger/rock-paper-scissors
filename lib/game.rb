class Game

  attr_accessor :player1, :player2, :round_winner
  attr_reader :round

  def initialize
    player1, player2 = nil
    @round = 1
    @winning_combinations = {rock: :scissors, scissors: :paper, paper: :rock}
  end

  def add_player(player)
    if self.player1
      self.player2 = player
    else
      self.player1 = player
    end
  end

  def turn
    raise "The game is over" if @round >= 3
    evaluate
    @round_winner.add_point unless @round_winner.nil?
    @round += 1
  end

  def evaluate
    @winning_combinations.each do |key, value|
      @round_winner = player1 if player1.selection == key && player2.selection == value
      @round_winner = player2 if player2.selection == key && player1.selection == value
    end
  end

  def overall_winner
    return player1 if player1.points >= 2
    return player2 if player2.points >= 2
  end

end
