items = [20, 6, 8, 53, 56, 23, 87, 41, 49, 19]

# setting defaults so method can be called without first and last initially
def quick_sort(dataset, first=0, last=dataset.length-1)
  if first < last
    # calculate the split point
    pivot_index = partition(dataset, first, last)

    # sort the two partitions
    quick_sort(dataset, first, pivot_index - 1)
    quick_sort(dataset, pivot_index + 1, last)
  end

  dataset
end

def partition(data_values, first, last)
  pivot_value = data_values[first]
  # create upper and lower indecies
  lower = first + 1
  upper = last

  done = false
  while !done
    # advance the lower index
    while lower <= upper && data_values[lower] <= pivot_value
      lower = lower + 1
    end
    # advance the upper index
    while upper >= lower && data_values[upper] >= pivot_value
      upper = upper - 1
    end

    if upper < lower
      # split point is when the two indexes cross
      done = true
    else
      # if this is not the index point yet, swop the two values
      temp = data_values[lower]
      data_values[lower] = data_values[upper]
      data_values[upper] = temp
    end
  end

  # when the split point is found, switch the pivot point
  temp = data_values[first]
  data_values[first] = data_values[upper]
  data_values[upper] = temp

  # return the index for the split point
  return upper
end

puts "Unsorted: #{items.inspect}"
quick_sort(items)
puts "Sorted:   #{items.inspect}"
