require 'bot'

describe Bot do

  let(:bot) { Bot.new("Hamish") }

  it "should have a name" do
    expect(bot.name).to eq("Hamish")
  end

  it "should make a selection" do
    bot.select_object
    expect(["Rock", "Paper", "Scissors"]).to include(bot.selection)
  end

  it "should be able to receive points" do
    expect{bot.add_point}.to change{bot.points}.by(1)
  end

end