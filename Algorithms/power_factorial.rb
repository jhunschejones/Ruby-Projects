# 3^3 = 3 x 3 x 3 = 27
def power(num, pwr)
  if pwr == 0
    1
  else
    num * power(num, pwr - 1)
  end
end
8
# 5! = 5 x 4 x 3 x 2 x 1 = 120
def factorial(num)
  if num == 0
    1
  else
    num * factorial(num - 1)
  end
end

puts "5 to the power of 3 is #{power(5, 3)}"
puts "1 to the power of 5 is #{power(1, 5)}"
puts "4! is #{factorial(4)}"
puts "0! is #{factorial(0)}" # the answer is correct, this is a special case!
