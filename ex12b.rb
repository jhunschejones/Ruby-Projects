print "I have a deal you can't refuse!"
x = gets
print "Give me some money and I will give you 10% back: "
money = gets.chomp.to_f
change = money * 0.10
puts "Here is $#{change}. Enjoy!"