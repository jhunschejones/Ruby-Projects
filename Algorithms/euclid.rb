def greatest_common_denominator(a, b)
  while b != 0
    temp = a
    a = b
    b = temp % b
  end

  return a
end

puts greatest_common_denominator(20, 8)
