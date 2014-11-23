require_relative 'player'

class Bot < Player

  attr_reader :selection

  def initialize(name, object_set = DEFAULT_SET)
    super(object_set)
    @name = ["Hamish", "Angus", "Ivy", "Hercules"].sample
    @selection = @object_set.sample
  end

end
