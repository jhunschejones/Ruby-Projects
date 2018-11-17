puts "Mary had a little lamb."
# " (double-quote)  replacees variables it finds within the #{}, 
# but ' (single-quote) leaves the string alone / ignores any variables inside it
puts "Its fleece was white as #{'snow'}."
puts "And everywhere that Mary went."
# This gives me 10 asterisks 
puts "." * 10

end1 = "C"
end2 = "h"
end3 = "e"
end4 = "e"
end5 = "s"
end6 = "e"
end7 = "B"
end8 = "u"
end9 = "r"
end10 = "g"
end11 = "e"
end12 = "r"

# print leaves the carriage on the same line, i.e. no line break after
print end1 + end2 + end3 +end4 + end5 + end6
# puts adds a line break after the line, moving down to the next line
puts end7 + end8 + end9 + end10 + end11 + end12