class Player

  attr_reader :name, :selection, :points

  DEFAULT_SET = ["Rock", "Paper", "Scissors"]

  def initialize(name, object_set = DEFAULT_SET)
    @name = name
    @points = 0
    @object_set = object_set
  end

  def selection=(object)
    @selection = object
  end

  def add_point
    @points += 1
  end

end
