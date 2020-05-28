class Map
  class CantGoBack < StandardError; end

  def find_in_map(room_name_to_find)
    room_stack = [starting_map]

    loop do
      room = room_stack.pop
      return nil  if room.nil?
      return room if room.name == room_name_to_find

      attached_rooms = room.paths.map(&:room)
      room_stack += attached_rooms
    end
  end

  def find_previous_room(current_room_name)
    room_stack = [starting_map]

    loop do
      room = room_stack.pop

      return nil if room.nil?
      raise CantGoBack if current_room_name == room.name
      return room unless room.paths.find { |path| path.room.name == current_room_name }.nil?

      attached_rooms = room.paths.map(&:room)
      room_stack += attached_rooms
    end
  end

  def availible_directions(current_room_name)
    directions = find_in_map(current_room_name).paths.map(&:direction)
    current_room_name == "Living Room" ? directions : directions + ["back"]
  end

  def take_path(current_room_name, direction)
    return find_previous_room(current_room_name) if direction == "back"

    current_room = find_in_map(current_room_name)
    current_room.paths.find { |path| path.direction == direction }.room
  end

  private

  def starting_map
    clues = ["You hear a quiet ticking", "The ticking is getting louder...", "Under a pile of clothes... there it is, the long lost watch!"]
    false_clues = ["You find a bit of cheese, does this mean the watch is near?", "Some birdseed trickles down from a small house... could this be a clue?"]
    Room.new("Living Room", [
      Path.new("right", Room.new("Entry", [])),
      Path.new("behind", Room.new("Porch", [], false_clues[1])),
      Path.new("left", Room.new("Kitchen", [], false_clues[0])),
      Path.new("ahead", Room.new("Hall", [
        Path.new("right", Room.new("Guest Bathroom", [])),
        Path.new("left", Room.new("Master Bedroom", [
          Path.new("left", Room.new("Master Bathroom", [])),
          Path.new("right", Room.new("Closet", [], clues[2]))
        ], clues[1])),
        Path.new("ahead", Room.new("Guest Bedroom", []))
      ], clues[0]))
    ])
  end
end


# {
#   name: "Living Room",
#   leaves: [
#     {
#       direction: "right",
#       room: {
#         name: "Entry",
#         leaves: []
#       }
#     },
#     {
#       direction: "behind",
#       room: {
#         name: "Porch",
#         leaves: []
#       }
#     },
#     {
#       direction: "left",
#       room: {
#         name: "Kitchen",
#         leaves: []
#       },
#     },
#     {
#       direction: "ahead",
#       room: {
#         name: "Hall",
#         leaves: [
#           {
#             direction: "left",
#             room: {
#               name: "Master Bedroom",
#               leaves: [
#                 {
#                   direction: "left",
#                   room: {
#                     name: "Master Bathroom",
#                     leaves: []
#                   }
#                 }
#               ]
#             }
#           },
#           {
#             direction: "ahead",
#             room: {
#               name: "Guest Room",
#               leaves: []
#             }
#           },
#           {
#             direction: "right",
#             room: {
#               name: "Guest Bathroom",
#               leaves: []
#             }
#           }
#         ]
#       }
#     }
#   ]
# }







