require 'openssl'
require_relative '../lib/helper_functions'

decipher = OpenSSL::Cipher::AES256.new :CBC
decipher.decrypt

puts "====== File Decryptor ======"
print "Key: "
user_key = base64_decode($stdin.gets.chomp)
decipher.key = user_key

print "IV: "
iv = base64_decode($stdin.gets.chomp)
decipher.iv = iv

print "Input file: "
input_file = $stdin.gets.chomp
raise "Input file name is required" if input_file == ""

print "Output file: "
output_file = $stdin.gets.chomp
output_file = "./decrypted.txt" if output_file == "" # provide a default file name

decrypt_file(decipher, input_file, output_file)

puts "\n====== Process Completed ======"
puts "'#{input_file}' has been decrypted to '#{output_file}'"
