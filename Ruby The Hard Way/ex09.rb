days = "Mon Tue Wed Thu Fri Sat Sun"
# the \n characters designate a new line
months = "Jan\nFeb\nMar\nApr\nMay\nJune\nJul\nAug"

puts "Here are the days: #{days}"
puts "Here are the months: #{months}"

# sometimes refered to as "percent literals" this is another way of using strings
# the 'q' here is a modifier, making this notation mean 'Non-interpolated String'
# source: https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Literals#The_.25_Notation
puts %q{
There's something going on here.
With this weird quote
We'll be able to type as much as we like.
Even 4 lines if we want, or 5, or 6.
}