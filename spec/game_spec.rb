require 'game'

describe Game do

  let (:game)   { Game.new       }
  let (:angus)  { double :Player }
  let (:hamish) { double :Player }

  context "starting the game" do

    it "should begin without any players" do
      expect(game.player1).to eq nil
    end

    it "should be possible to add a player" do
      game.add_player(angus)
      expect(game.player1).to eq angus
    end

  end

  context "playing the game" do

    before(:each) do
      game.add_player(angus)
      game.add_player(hamish)
      allow(hamish).to receive(:selection).and_return(:scissors)
      allow(angus).to receive(:selection).and_return(:paper)
      allow(hamish).to receive(:add_point)
    end

    it "should allow players to take a turn" do
      expect(hamish).to receive(:add_point)
      game.turn
    end

    it "should select the winner of each round" do
      game.check_winner
      expect(game.round_winner).to eq(hamish)
    end

    it "should select an overall winner" do
      allow(hamish).to receive(:points).and_return(1)
      allow(angus).to receive(:points).and_return(2)
      game.choose_winner
      expect(game.overall_winner).to eq(angus)
    end

    it "should only allow 3 rounds" do
      game.max_rounds.times{game.turn}
      expect(lambda {game.turn}).to raise_error("The game is over")
    end

  end

end
