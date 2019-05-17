items1 = [6, 8, 19, 20, 23, 41, 49, 53, 56, 87]
items2 = [6, 20, 8, 19, 56, 23, 87, 41, 49, 53]

def is_sorted(list)
  # i = 0
  # while i < list.length - 1
  #   # list is unordered!
  #   return false if list[i] > list[i + 1]
  #   i = i + 1
  # end

  list.each_with_index do |item, index|
    if list[index + 1] && item > list[index + 1]
      return false
    end
  end

  true
end

puts "Is items1 sorted... #{is_sorted(items1)}"
puts "Is items2 sorted... #{is_sorted(items2)}"
