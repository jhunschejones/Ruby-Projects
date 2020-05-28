class Path
  attr_reader :direction, :room

  def initialize(direction, room)
    @direction = direction
    @room = room
  end
end
