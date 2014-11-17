require_relative 'player'

class Bot < Player

  attr_reader :selection

  DEFAULT_SET = ["Rock", "Paper", "Scissors"]

  def initialize(name, object_set = DEFAULT_SET)
    @name = name
    @points = 0
    @object_set = DEFAULT_SET
  end

  def select_object
    @selection=(@object_set.sample)
  end

end