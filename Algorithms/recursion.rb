def countdown(x)
  if x == 0
    puts "done!"
  else
    puts "#{x}..."
    countdown(x - 1)
    puts "unwinding call stack"
  end
end

countdown(4)
