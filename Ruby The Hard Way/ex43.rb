class Scene
  def enter()
    puts "This scene is not yet configured. Subclass it and implement enter()"
    exit(1)
  end
end

class Engine
  def initialize(scene_map)
    @scene_map = scene_map
  end

  def play()
    current_scene = @scene_map.opening_scene()
    last_scene = @scene_map.next_scene('finished')

    while current_scene != last_scene
      next_scene_name = current_scene.enter()
      current_scene = @scene_map.next_scene(next_scene_name)
    end

    current_scene.enter()
  end
end

class YouLose < Scene

  @@messages = [
    "You lost. Your little lip quivers with sadness and a single tear rolls down your little mouse cheek.",
    "You lost. Looking out into the sunset, you wonder if you'll ever see your family again.",
    "You lost. Everyone was counting on you and you let them down. How ever will little Samantha mouse survive the mouse-fever now?",
    "You lost. You think back to the last time you saw your mouse wife. Did you remember to tell her how much you loved her? You can't recall..."
  ]

  def enter()
    puts ""
    puts @@messages[rand(0..(@@messages.length - 1))]
    exit(1)
  end
end

class Hall < Scene

  @@messages = [
    "Hello there good mouse! Unfortunately I must be on my way as I am very busy today.",
    "I dare say, what a busy day! I apologize that I am not able to linger and pass the time, as you look like a friendly sort of mouse. Ah well.",
    "Terribly sorry, but I have no time to chat today, little friend."
  ]

  def enter()
    puts """A quiet shuffling noise is coming from somewhere inside the house. You are returning from a foraging expedition, bringing supper back to your family."""
    sleep(3)
    puts ""
    puts """Your little mouse backpack weighs heavy on your back, but curiosity gets the best of you and you pad forward on little mouse feet to investigate further."""
    sleep(3)
    puts ""
    puts """As you enter the hall you find an ant. He is wearing a top hat and monocle and appears to be traveling with some urgency. What do you do?"""
    sleep(3)
    puts ""
    print "> "

    action = $stdin.gets.chomp.gsub('.', '')
    # split input into an array of words
    action_array = action.split(' ')

    # set up answer arrays
    greetings = ["greeting", "hi", "hello", "good day", "how are you"]
    directions = ["where", "how far", "what are", "how do"]

    # set up check variables to use in if-else branching below
    greeting = false
    direction = false

    # check if any of the input words are in the answer arrays
    action_array.each do |i|
      if greetings.include?(i.downcase)
        greeting = true
      end

      if directions.include?(i.downcase)
        direction = true
      end
    end

    if greeting == true
      puts ""
      puts "The ant responds in a surprisingly deep voice:"
      puts "\"#{@@messages[rand(0..(@@messages.length - 1))]}\""
      sleep(3)
      puts ""
      return 'living_room'
    elsif direction == true
      puts """The ant pauses his march and regards you with interest. \"We don't often have visitors to these parts,\" he lifts up one of his legs and all of the sudden appears to be brandishing an ant-sized sword. He pokes you terribly hard and you turn and run away."""
      sleep(4)
      puts ""
      return 'you_lose'
    else
      puts "Try something else!"
      puts ""
      return 'hall'
    end
  end
end

class LivingRoom < Scene

  def enter()
    puts "You walk into the living room and peek around. It looks like there's nobody here."
    sleep(1.5)
    puts "You start to back up and all of a sudden you bump into something soft and fuzzy."
    sleep(1.5)
    puts ""
    puts "Quick, what do you do?"
    sleep(1.5)
    puts ""
    print "> "

    action = $stdin.gets.chomp.gsub('.', '')

    # split input into an array of words
    action_array = action.split(' ')

    # set up answer arrays
    right_choice = ["turn", "around", "spin", "look", "peek", "pet", "poke"]
    wrong_choice = ["run", "hide", "scamper", "away", "jump", "scream", "squeak", "still"]

    # set up check variables to use in if-else branching below
    right = false
    wrong = false

    # check if any of the input words are in the answer arrays
    action_array.each do |i|
      if right_choice.include?(i.downcase)
        right = true
      end

      if wrong_choice.include?(i.downcase)
        wrong = true
      end
    end



    if right == true
      puts ""
      puts "You #{action} and realize it's just a stuffed sheep."
      sleep(1.5)
      puts ""
      puts "You breathe a sigh of relief and turn towards the kitchen."
      sleep(2)
      puts ""
      return 'kitchen'
    elsif wrong == true
      puts "You #{action}. Just then, a Roomba comes roaring into the living room."
      sleep(1.5)
      puts "You panic and star to run!"
      sleep(3)
      return 'you_lose'
    else
      puts ""
      puts "Try something else!"
      return 'living_room'
    end
  end
end

class Kitchen < Scene

  def enter()
    puts ""
    puts "You pad into the kitchen and find yourself faced with several dry storage"
    puts "containers up on a shelf."
    sleep(3)
    puts ""
    puts "You smell the faint scent of Cheerios, and feel your little belly rumble."
    sleep(3)
    puts ""
    puts "It's been so long since you've last eaten and you know your family is"
    puts "hungry as well. If you could find some food it would be a miracle."
    sleep(3)
    puts ""
    puts "Which of the 5 containers do you try?"
    sleep(1.5)

    good_container = rand(1..5)

    while true  
      print "[container #, or 'hint']> "

      # using regex to remove # or .
      guess = $stdin.gets.chomp.gsub(/[.#]/, '')

      if guess == ""
        puts "Try something else!"
        puts ""
      elsif guess.downcase == "hint"
        puts "The right answer is #{good_container}."
        sleep(1)
        puts ""
      elsif guess.downcase == "one"
        chosen_container = 1
        break
      elsif guess.downcase == "two"
        chosen_container = 2
        break
      elsif guess.downcase == "three"
        chosen_container = 3
        break
      elsif guess.downcase == "four"
        chosen_container = 4
        break
      elsif guess.downcase == "five"
        chosen_container = 5
        break
      else 
        chosen_container = guess.to_i
        break
      end
    end

    if chosen_container != good_container
      puts ""
      puts "You pull yourself up the legs of the shelf. As you approach container #{guess},"
      puts "your little paws start to shake. Your family could really use a food supply this"
      puts "sizable."
      sleep(4)
      puts ""
      puts "You chew into container #{guess} and start to get a sinking feeling in your"
      puts "little mouse belly."
      sleep(4)
      puts ""
      print "All the sudden, you realize"
      sleep(1)
      print "."
      sleep(1)
      print "."
      sleep(1)
      print "."
      sleep(1)
      print "it's mouse poison! Your vision starts to swim and"
      puts "you fall backwards from the shelf. The lights start to dim as you feel the cold"
      puts "air rushing past, blowing your little mouse fur."
      sleep(6)
      return 'you_lose'
    else
      puts ""
      print "You climb up the shelf and quickly chew through the bottom of container #{guess}"
      sleep(1)
      print "."
      sleep(1)
      print "."
      sleep(1)
      print "."
      sleep(1)
      puts ""
      puts ""
      puts "It's full of Honey Cheerios! You stuff your little mouse bag as full as you can."
      puts "This is just what you were looking for! At last your little mouse babies won't"
      puts "need to go hungry!"
      sleep(3)
      puts ""
      puts "You climb down the shelf and turn to head out of the kitchen to the bedroom."
      sleep(3)
      return 'bedroom'
    end
  end
end

class Bedroom < Scene

  def enter()
    puts ""
    puts "You pad into the bedroom. You hear a light breathing sound."
    sleep(1.5)
    puts ""
    puts "It appears to be coming from the bed."
    sleep(1.5)
    puts ""
    puts "This might be your last chance to escape with your life. Maybe it's not worth"
    puts "the danger. What should you do?"
    sleep(1)
    puts ""
    print "> "

    choice = $stdin.gets.chomp

    # split input into an array of words
    choice_array = choice.split(' ')

    # set up answer array
    right_choice = ["look", "climb", "walk", "explore", "bed", "peek", "sneak", "crawl", "see", "investigate"]

    # set up check varaible to use in if-else branching below
    right = false

    # check if any of the input words are in the answer arrays
    choice_array.each do |i|
      if right_choice.include?(i.downcase)
        right = true
      end
    end


    if choice == ""
      puts ""
      puts "Try something else!"
      return 'bedroom'
    elsif right == true
      puts ""
      puts "You #{choice}. As you move closer to the bed, you see a tuft of brown fuzz."
      sleep(2)
      puts "You realize it's one of your own! Sure, she looks to be the size of a human"
      puts "but she is clearly a rodent. You snuggle up with her and drift off to sleep."
      sleep(5)
      puts ""
      return 'finished'
    else
      puts "You decide to #{choice}."
      sleep(1)
      puts ""
      puts "Oh no! Here comes the Roomba! You try to escape but it starts to pull you in by"
      puts "your tail. As you turn to look back, you think of your family and how they wait"
      puts "by the window for your return each day. What will they think when nobody returns"
      puts "by tonight?"
      sleep(3)
      return 'you_lose'
    end
  end
end

class Finished < Scene
  def enter()
    puts "You won! Good job."
  end
end

class Map

  @@scenes = {
    'hall' => Hall.new(),
    'living_room' => LivingRoom.new(),
    'kitchen' => Kitchen.new(),
    'bedroom' => Bedroom.new(),
    'you_lose' => YouLose.new(),
    'finished' => Finished.new()
  }

  def initialize(start_scene)
    @start_scene = start_scene
  end

  def next_scene(scene_name)
    val = @@scenes[scene_name]
    return val
  end

  def opening_scene()
    system('clear')
    return next_scene(@start_scene)
  end
end

a_map = Map.new('hall')
a_game = Engine.new(a_map)
a_game.play()