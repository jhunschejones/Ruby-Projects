from_file, to_file = ARGV

# puts "Copying from #{from_file} to #{to_file}"

# in_file = open(from_file)
# indata = in_file.read

# puts "The input file is #{indata.length} bytes long"

# puts "does the output file exist? #{File.exist?(to_file)}"
# puts "Ready, hit RETURN to continue, CTRL-C to abort."
# $stdin.gets.chomp

# out_file = open(to_file, 'w')
# out_file.write(indata)

# puts "Alright, all done."

# out_file.close
# in_file.close

# re-writing the script to one file with less printing on the screen
in_file = open(from_file); indata = in_file.read; out_file = open(to_file, 'w'); out_file.write(indata); out_file.close; in_file.close