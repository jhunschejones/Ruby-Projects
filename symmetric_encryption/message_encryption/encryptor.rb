require_relative '../lib/helper_functions'

# based on https://medium.com/@Bakku1505/playing-with-symmetric-encryption-algorithms-in-ruby-8652f105341e
require 'openssl'
require 'securerandom'

puts "====== Encryptor ======"

cipher = OpenSSL::Cipher::AES256.new :CBC
cipher.encrypt
iv = cipher.random_iv
# Option 1: allow the user to enter their own, human-readable key
# cipher.key = Digest::SHA1.digest(user_key).unpack('B32').first # convert input into 32-character string
# Option 2: generate a fully random key on the spot
# cipher.key = cipher.random_key
# Option 3: generate or pass in a previously generated key
puts "Secure, random key: #{base64_encode(cipher.random_key)}"
print "Key: "
secret_key = $stdin.gets.chomp
cipher.key = base64_decode(secret_key)

print "Message: "
message = $stdin.gets.chomp
cipher_text = cipher.update(message) + cipher.final

puts "\n====== Output ======"
puts "Key: #{secret_key}"
puts "IV: #{base64_encode(iv)}"
puts "Encrypted message: #{base64_encode(cipher_text)}"
