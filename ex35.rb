# ex34 was an array exercise completed on paper

def gold_room
  puts "This room is full of gold. How much do you take?"

  print "> "
  choice = $stdin.gets.chomp

  # choice.to_i will return 0 if it is not a number
  if choice != 0 && choice.to_i != 0
    how_much = choice.to_i
  else
    dead("Man, learn to type a number.")
  end

  if how_much < 50
    puts "Nice, you're not greedy, you win!"
    exit(0)
  else
    dead("You greedy bastard!")
  end
end

def bear_room
  puts "There is a bear here."
  puts "The bear has a bunch of honey."
  puts "The fat bear is in front of another door."
  puts "How are you going to move the bear?"
  bear_moved = false

  while true
    print "> "
    choice = $stdin.gets.chomp
    
    if choice.include?("take") || choice.include?("honey")
      dead("The bear looks at you then slaps your face off.")
    elsif choice.include?("bear") && !bear_moved
      puts "The bear has moved from the door. You can go through it now."
      bear_moved = true
    elsif choice.include?("bear") && bear_moved
      dead("The bear gets pissed off and chews your leg off.")
    elsif choice.include?("open") && bear_moved
      gold_room
    else
      puts "Nope! Try something else."
    end
  end
end

def scary_room
  puts "Here you see a big scary monster."
  puts "It starts to drool as soon as you enter the room."
  puts "Do you faint, or flee for your life?"

  print "> "
  choice = $stdin.gets.chomp

  if choice.include?("flee") || choice.include?("run")
    puts "You run back to the first room."
    start
  elsif choice.include?("faint")
    dead("You fainted in front of a big scary monster.")
  else
    puts "You are still in the scary room."
    scary_room
  end
end

def dead(why)
  puts why, "Good job!"
  exit(0)
end

def start
  puts "You are in a dark room."
  puts "There is a door to your right and left."
  puts "Which one do you take?"

  print "> "
  choice = $stdin.gets.chomp
  
  if choice.include?("left")
    bear_room
  elsif choice.include?("right")
    scary_room
  else 
    dead("You stumble around the room until you starve.")
  end
end

start
