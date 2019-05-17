# uses the hash table data-structure unique key constraint to filter a list of items and remove duplicates

items = ["apple", "pear", "orange", "banana", "apple", "orange", "apple", "pear", "banana", "orange", "apple", "kiwi", "pear", "apple", "orange"]

filter = {}
items.each {|item| filter[item] = 0}
result = filter.keys

puts result
