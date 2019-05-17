items_1 = { key1: 1, key2: 2, key3: "three" }
puts items_1.inspect

items_2 = {}
items_2[:key1] = 1
items_2[:key2] = 2
items_2[:key3] = "three"
puts items_2.inspect

items_2[:key2] = "two"
puts items_2.inspect

items_2.each do |k, v|
  puts "key: #{k}, value: #{v}"
end
