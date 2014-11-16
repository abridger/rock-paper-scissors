class Player

  attr_reader :name, :selection, :points

  def initialize(name)
    @name = name
    @points = 0
  end
  
  def selection=(object)
    @selection = object
  end

  def add_point
    @points += 1
  end

end