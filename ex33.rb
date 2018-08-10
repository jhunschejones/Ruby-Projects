def counting(counter, length)
  # counter = 0
  numbers = []

  while counter < length
    puts "At the top i is #{counter}"
    numbers.push(counter)

    counter += 1
    puts "Numbers now: ", numbers
    puts "At the bottom i is #{counter}"
  end

  puts "The numbers: "

  numbers.each {|num| puts num}

  # numbers.each do |num|
  #   puts num
  # end
end

counting(0, 6)
