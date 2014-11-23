require_relative 'player'

class Bot < Player

  attr_reader :selection

  def initialize(name, object_set = DEFAULT_SET)
    super(name, object_set)
    @selection = @object_set.sample
  end

end
