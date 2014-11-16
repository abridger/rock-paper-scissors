class Game

  attr_accessor :player1, :player2
  attr_reader :round

  def initialize
    player1, player2 = nil
    @round = 1
  end

  def add_player(player)
    if self.player1
      self.player2 = player
    else
      self.player1 = player
    end
  end

  def turn
    raise "The game is over" if @round > 3
    evaluate(player1, player2)
    @round += 1
  end

  def evaluate(player1, player2)
    player1.add_point if player1.selection == "Rock" && player2.selection == "Scissors" || player1.selection == "Paper" && player2.selection == "Rock" || player1.selection == "Scissors" && player2.selection == "Paper"
    player2.add_point if player2.selection == "Rock" && player1.selection == "Scissors" || player2.selection == "Paper" && player1.selection == "Rock" || player2.selection == "Scissors" && player1.selection == "Paper"
  end

  def winner
    return player1 if player1.points >= 2
    return player2 if player2.points >= 2
  end

end