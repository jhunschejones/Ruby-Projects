class Game
  class Winner < StandardError; end

  attr_accessor :map, :playing, :current_room_name, :current_clue

  def initialize
    @map = Map.new
    @playing = true
    @current_room_name = "Living Room"
    @current_clue = nil
    title = ":: Welcome to detective pistachio ::"
    puts "\n\e[36m#{"\s" * ((80 - title.length) / 2)}#{title}\e[0m"
    puts "\e[37m"
    print_to_console "Pistachio's father gave him a watch on his second birthday. Upon returning home from his fathers tragic funeral, Pistachio discovers his watch is gone! Help him find the watch by looking around the apartment."
    puts "\e[0m"
  end

  def play
    until !playing do
      # respond to current attributes
      availible_directions = @map.availible_directions(@current_room_name).sort
      puts "You are now in the \e[32m#{@current_room_name}\e[0m"
      if @current_clue
        print "\e[37m"
        3.times { print "."; sleep 0.4 }
        print @current_clue
        puts "\e[0m"
      end
      raise Winner if @current_clue&.include? "the long lost watch"

      # gather input
      puts "Pick a direction: #{availible_directions}"
      print "> "
      selection = $stdin.gets.chomp.downcase
      break if ["quit", "exit", "stop"].include? selection

      # set new attributes
      if availible_directions.include? selection
        current_room = @map.take_path(current_room_name, selection)
        @current_room_name = current_room.name
        @current_clue = current_room.clue
      else
        puts "Sorry, I didn't recognize the direction '#{selection}'"
      end
    end
  rescue Map::CantGoBack
    puts "You can't go farther back"
    play
  rescue Winner
    puts "\e[36m"
    print_to_console "Congratulations!!! Pistachios little chest fills with a renewed hope, the ticking watch a reminder of his fathers strong, beating heart, urging him to push onward. What bright future awaits this young mouse? Only time will tell."
    puts "\e[0m"
  end

  private

  def print_to_console(string)
    return puts string if string.length < 80

    words = string.split(" ")
    lines = []
    line = ""

    while words.length > 0 do
      word = words.shift
      line = "#{line} #{word}".strip
      if (word.length + line.length) > 80
        lines += [line]
        line = ""
      end
    end

    lines.each { |line| puts line }
    puts line if line.length > 0
  end
end
