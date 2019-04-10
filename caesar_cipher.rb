# Caesar cipher, also known as Caesar's cipher, the shift cipher, 
# Caesar's code or Caesar shift, is one of the simplest and most widely known encryption techniques.
#It is a type of substitution cipher in which each letter in the plaintext is replaced by a letter
#some fixed number of positions down the alphabet. 
#For example, with a left shift of 3, D would be replaced by A, E would become B, and so on. 

def caesar_cipher(input_string, shift_factor)
  positions = input_string.unpack('C*')
  shifted_positions = positions.map do |pos|
    case pos
      when (65..90), (97..122)
        shifted = pos + (shift_factor % 26) # use % 26 to account for shift factors over 26
        if (shifted > 90 && shifted < 97) || (shifted > 122) # loop around
          shifted = shifted - 26
        end
        pos = shifted
      else
        pos # ignore non-alphabet chars
    end
  end
  result_string = shifted_positions.pack('C*')
  puts result_string
end

puts "Input string:"
string_to_encrypt = gets.chomp
puts "Shift factor:"
shift_factor = gets.chomp.to_i
puts "Caesar Cipher:"
caesar_cipher(string_to_encrypt, shift_factor)