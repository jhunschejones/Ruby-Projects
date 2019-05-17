items = [6, 20, 8, 19, 56, 23, 87, 41, 49, 53]

def merge_sort(dataset)
  # recursivly break down arrays until they have only one element
  if dataset.length > 1
    mid = (dataset.length / 2.to_f).ceil
    left_arr = dataset[0...mid]
    right_arr = dataset[mid..(dataset.length - 1)]

    merge_sort(left_arr)
    merge_sort(right_arr)

    i = 0 # left array index
    j = 0 # right array index
    k = 0 # merged array index

    # while both arrays have elements, merge them
    while i < left_arr.length && j < right_arr.length
      if left_arr[i] < right_arr[j]
        dataset[k] = left_arr[i]
        i = i + 1
      else
        dataset[k] = right_arr[j]
        j = j + 1
      end
      k = k + 1
    end

    # merge leftover elements in left array
    while i < left_arr.length
      dataset[k] = left_arr[i]
      i = i + 1
      k = k + 1
    end

    # merge leftover elements in right array
    while j < right_arr.length
      dataset[k] = right_arr[j]
      j = j + 1
      k = k + 1
    end
  end

  dataset
end

puts "Unsorted: #{items.inspect}"
merge_sort(items)
puts "Sorted:   #{items.inspect}"
