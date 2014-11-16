class Player

  attr_reader :name

  def initialize(name)
    @name = name
  end
  
  def selection(object)
    @selection = object
  end

end