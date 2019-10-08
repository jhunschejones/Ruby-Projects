# https://github.com/attr-encrypted/encryptor/blob/c3a62c4a9e74686dd95e0548f9dc2a361fdc95d1/test/compatibility_test.rb#L11
def base64_encode(value)
  [value].pack('m').strip
end

# https://github.com/attr-encrypted/encryptor/blob/c3a62c4a9e74686dd95e0548f9dc2a361fdc95d1/test/compatibility_test.rb#L15
def base64_decode(value)
  value.unpack('m').first
end

def encrypt_file(cipher, input_file, output_file)
  File.open(output_file, "w") do |output|
    File.foreach(input_file) do |line|
      output.write(cipher.update(line))
    end
    output << cipher.final
  end
end

# same method works for both encryption and decryption as long as
# the cipher is set for the propper mode before being passed in
alias decrypt_file encrypt_file

# colorize console output for strings
class String
  def black;   "\e[30m#{self}\e[0m" end
  def red;     "\e[31m#{self}\e[0m" end
  def green;   "\e[32m#{self}\e[0m" end
  def brown;   "\e[33m#{self}\e[0m" end
  def blue;    "\e[34m#{self}\e[0m" end
  def magenta; "\e[35m#{self}\e[0m" end
  def cyan;    "\e[36m#{self}\e[0m" end
  def gray;    "\e[37m#{self}\e[0m" end
end
