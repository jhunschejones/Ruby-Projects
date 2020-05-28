class Room
  attr_reader :name, :paths, :clue

  def initialize(name, paths, clue = nil)
    @name = name
    @paths = paths
    @clue = clue
  end
end
