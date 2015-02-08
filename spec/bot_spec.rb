require 'bot'

describe Bot do
  it 'should make a selection' do
    bot = Bot.new
    expect(Bot::DEFAULT_SET).to include(bot.select)
  end
end
