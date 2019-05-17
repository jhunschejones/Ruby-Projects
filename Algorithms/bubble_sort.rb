def bubble_sort(dataset)
  i = dataset.length - 1
  while i > 0 do
    j = 0
    while j < dataset.length - 1 do
      if dataset[j] > dataset[j + 1]
        temp = dataset[j]
        dataset[j] = dataset[j + 1]
        dataset[j + 1] = temp
      end
      j = j + 1
    end
    i = i - 1
    puts "Current state: #{dataset.inspect}"
  end
end

list_1 = [6, 20, 8, 19, 56, 23, 87, 41, 49, 53]
bubble_sort(list_1)
puts "\nResult: #{list_1}"
