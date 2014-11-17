require 'player'

describe Player do

  let(:player1) { Player.new("Angus") }

  it "should have a name" do
    expect(player1.name).to eq("Angus")
  end

  it "should be able to make a selection" do
    player1.selection=("Rock")
    expect(player1.selection).to eq("Rock")
  end

  it "should be able to receive points" do
    expect{player1.add_point}.to change{player1.points}.by(1)
  end

end