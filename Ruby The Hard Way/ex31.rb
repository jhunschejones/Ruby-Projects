puts "You enter a dark room with two doors. Do you go through door #1 or door #2?"

print "> "
door = $stdin.gets.chomp
sleeping = false

if door == "1"
  puts "There's a giant bear here eating a cheese cake. What do you do?"
  puts "1. Take the cake."
  puts "2. Pet at the bear."

  print "> "
  bear = $stdin.gets.chomp

  if bear == "1"
    puts "The bear eats your arm off. Good job!"
  elsif bear == "2"
    puts "The bear snuggles up and falls asleep."
    sleeping = true
  else
    puts "Well, doing %s was a little unexpected! The bear runs away." % bear
  end

elsif door =="2"
  puts "You enter an empty, white room. What's there to do here?"
  puts "1. Color on the walls."
  puts "2. Slowly back out of the room."
  puts "3. Curl up and take a nap."

  print "> "
  white = $stdin.gets.chomp

  if white == "1" || white == "2"
    puts "Your cleverness has helped you survive! Nothing bad happens!"
  else
    puts "You fall asleep and awake well rested."
  end

else
  puts "You are not good at following directions. But who says that's a bad way to live!"
end

if sleeping == true
  puts "Now what do you do?"
  puts "1. Slowly back out of the room."
  puts "2. Snuggle up and take a nap."
  print "> "
  naptime = $stdin.gets.chomp

  if naptime == "1"
    puts "Nice job, you escaped the bear!"
  end

  if naptime == "2"
    puts "How cute! The bear snuggles you and you fall fast asleep!"
  end
end