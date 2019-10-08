require 'openssl'
require_relative '../lib/helper_functions'

cipher = OpenSSL::Cipher::AES256.new :CBC
cipher.encrypt
iv = cipher.random_iv

puts "====== File Encryptor ======\n"
sleep 0.5
puts "There are two availible Key modes:"
puts "\s\s1. Generate a new key"
puts "\s\s2. Enter an existing key"
print "\nKey mode: "
key_mode = $stdin.gets.chomp

if key_mode == "1"
  secret_key = cipher.random_key
  cipher.key = secret_key
elsif key_mode == "2"
  print "Enter your previously generated key: "
  secret_key = base64_decode($stdin.gets.chomp)
  cipher.key = secret_key
else
  raise "Unexpected key mode"
end

print "Input file: "
input_file = $stdin.gets.chomp
raise "Input file name is required" if input_file == ""

print "Output file: "
output_file = $stdin.gets.chomp
output_file = "./encrypted.txt" if output_file == "" # provide a default file name

encrypt_file(cipher, input_file, output_file)

puts "\n====== Process Completed ======"
puts "'#{input_file}' has been encrypted to '#{output_file}'"

puts "\n====== Important Values ======"
puts "Key: #{base64_encode(secret_key)}"
puts "IV: #{base64_encode(iv)}\n\n"
