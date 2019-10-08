require_relative '../lib/helper_functions'

# based on https://medium.com/@Bakku1505/playing-with-symmetric-encryption-algorithms-in-ruby-8652f105341e
require 'openssl'

decipher = OpenSSL::Cipher::AES256.new :CBC
decipher.decrypt

puts "====== Decryptor ======"
print "Key: "
user_key = base64_decode($stdin.gets.chomp)
print "IV: "
iv = base64_decode($stdin.gets.chomp)
print "Message to decrypt: "
cipher_text = base64_decode($stdin.gets.chomp)

decipher.iv = iv
# convert user key into 32-character string when using for human-readable keys
# decipher.key = Digest::SHA1.digest(user_key).unpack('B32').first
decipher.key = user_key
plain_text = decipher.update(cipher_text) + decipher.final

puts "Decrypted message: '#{plain_text}'"
