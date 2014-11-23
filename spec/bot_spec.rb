require 'bot'

describe Bot do

  let(:bot) { Bot.new("Hamish") }

  it "should make a selection" do

    expect(Bot::DEFAULT_SET).to include(bot.selection)

  end

end
