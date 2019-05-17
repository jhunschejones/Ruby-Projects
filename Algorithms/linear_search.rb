# searching for an item in an unordered list

items = [6, 20, 8, 19, 56, 23, 87, 41, 49, 53]

def find_item(item, list)
  i = 0
  while i < list.length - 1
    return i if item == list[i]
    i = i + 1
  end

  nil
end

puts find_item(87, items) || "Not found!"
puts find_item(250, items) || "Not found!"
