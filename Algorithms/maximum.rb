# using recursion to find max value in a list of numbers
items = [6, 20, 8, 19, 56, 23, 87, 41, 49, 53]

def maximum_in(list)
  a = list[0]
  return a if list.length == 1
  b = maximum_in(list[1..-1])

  a > b ? a : b
end

puts maximum_in(items)
