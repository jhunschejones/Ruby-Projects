# these two do the same thing, the first uses the ARGV structure
def print_two(*args)
  arg1, arg2 = args
  puts "arg1: #{arg1}, arg2: #{arg2}"
end

# that structure isn't necisary though, you can just do this:
def print_two_again(arg1, arg2)
  puts "arg1: #{arg1}, arg2: #{arg2}"
end

def print_one(arg1)
  puts "arg1: #{arg1}"
end

def print_none()
  puts "I got nothin'."
end

print_two("Josh", "Jones")
print_two_again("Danielle", "Jones")
print_one("First!")
print_none()
