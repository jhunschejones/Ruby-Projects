# based on gem docs: https://github.com/attr-encrypted/encryptor
require 'encryptor'
require 'securerandom'
require_relative '../../lib/helper_functions'

cipher = OpenSSL::Cipher.new('aes-256-gcm')
cipher.encrypt # Required before '#random_key' or '#random_iv' can be called. http://ruby-doc.org/stdlib-2.0.0/libdoc/openssl/rdoc/OpenSSL/Cipher.html#method-i-encrypt
secret_key = cipher.random_key # Insures that the key is the correct length respective to the algorithm used.
iv = cipher.random_iv # Insures that the IV is the correct length respective to the algorithm used.
salt = SecureRandom.random_bytes(16)
puts "====== Encrypt ======"
print "Message to encrypt: "
user_message = $stdin.gets.chomp
encrypted_value = Encryptor.encrypt(value: user_message, key: secret_key, iv: iv, salt: salt)
puts "Key: " << base64_encode(secret_key)
puts "IV: " << base64_encode(iv)

puts "\n====== Decrypt ======"
print "Key: "
user_key = base64_decode($stdin.gets.chomp)
print "IV: "
user_iv = base64_decode($stdin.gets.chomp)
decrypted_value = Encryptor.decrypt(value: encrypted_value, key: user_key, iv: user_iv, salt: salt)
puts "Decrypted message: '#{decrypted_value}'"
