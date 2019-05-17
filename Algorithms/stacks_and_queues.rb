# stacks are last in first out
puts "--- STACK ---"

stack = []
stack.push(1)
stack.push(2)
stack.push(3)
stack.push(4)

puts stack.inspect

x = stack.pop
puts x
puts stack.inspect

# queues are first in first out
puts "\n--- QUEUE ---"

queue = []
queue.push(1)
queue.push(2)
queue.push(3)
queue.push(4)

puts queue.inspect

y = queue.shift
puts y
puts queue.inspect
