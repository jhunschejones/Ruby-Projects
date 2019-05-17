# uses the hash table data-structure unique key constraint to count a list of items containing duplicates

items = ["apple", "pear", "orange", "banana", "apple", "orange", "apple", "pear", "banana", "orange", "apple", "kiwi", "pear", "apple", "orange"]

counter = {}
items.each do |item|
  if counter[item]
    counter[item] = counter[item] + 1
  else
    counter[item] = 1
  end
end

puts counter.inspect
