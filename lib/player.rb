class Player

  attr_reader :name, :selection, :points

  DEFAULT_SET = [:rock, :paper, :scissors]

  def initialize(name, object_set = DEFAULT_SET)
    @name = name
    @points = 0
    @object_set = object_set
  end

  def selection=(object)
    raise "Object not allowed - please only select rock, paper or scissors" unless @object_set.include?(object)
    @selection = object
  end

  def add_point
    @points += 1
  end

end
