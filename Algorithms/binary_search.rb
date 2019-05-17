items = [6, 8, 19, 20, 23, 41, 49, 53, 56, 87]

def binary_search(item, list)
  lower_index = 0
  upper_index = list.length - 1

  while lower_index <= upper_index
    midpoint = ((lower_index + upper_index) / 2.to_f).floor
    # if the item is found, return the index
    return midpoint if list[midpoint] == item

    # move the indecies
    if item > list[midpoint]
      lower_index = midpoint + 1
    else
      upper_index = midpoint - 1
    end
  end

  # item does not exist in the list
  return nil if lower_index > upper_index
end

puts binary_search(23, items) || "Not found!"
puts binary_search(87, items) || "Not found!"
puts binary_search(250, items) || "Not found!"
