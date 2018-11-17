# to run this script use ruby ex13.rb argumentOne argumentTwo argumentThree
# replacing the three arguments with strings
first, second, third = ARGV

puts "Your first variable is: #{first}"
puts "Your second variable is: #{second}"
puts "Your third variable is: #{third}"

print "Are you hungry? "
hungry = $stdin.gets.chomp

puts "Let's get some breakfast going this guy is #{hungry} hungry!"