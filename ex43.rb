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
    "You lost. Your little lip quivers with sadness.",
    "You lost. Looking into the sunset you wonder if you'll ever see your family again.",
    "You lost. This was your last shot, and they were really counting on you.",
    "You lost. It's hard to be really bad at something."
  ]

  def enter()
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
    sleep(1.5)
    puts """Your little mouse backpack weighs heavy on your back, but curiosity gets the best of you and you pad forward on little mouse feet to investigate further."""
    sleep(1.5)
    puts """As you enter the hall you find an ant. He is wearing a top hat and monocle and appears to be traveling with some urgency. What do you do?"""
    sleep(1.5)
    print "> "

    action = $stdin.gets.chomp

    greetings = ["greeting", "hi", "hello", "good day", "how are you"]
    directions = ["where", "how far", "what are", "how do"]

    if greetings.include?(action.downcase)
      puts "The ant responds in a suprisingly deep voice:"
      puts "\"#{@@messages[rand(0..(@@messages.length - 1))]}\""
      sleep(1.5)
      return 'living_room'
    elsif directions.include?(action.downcase)
      puts """The ant pauses his march and regards you with interest. \"We don't often have visiters to these parts,\" he lifts up one of his legs and all of the sudden appears to be brandishing an ant-sized sword. He pokes you terribly hard and you turn and run away!"""
      sleep(3)
      return 'you_lose'
    else
      puts "Try something else!"
      return 'hall'
    end
  end
end

class LivingRoom < Scene

  def enter()
  end
end

class Kitchen < Scene

  def enter()
  end
end

class Bedroom < Scene

  def enter()
  end
end

class Map
  def initialize(start_scene)
  end

  def next_scene(scene_name)
  end

  def opening_scene()
  end
end

a_map = Map.new('hall')
a_game = Engine.new(a_map)
a_game.play()