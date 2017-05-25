# I'm writing an encoder/decoder couple
# This is an exercise in using the following tools:
# - RSpec
# - ByeBug
# - Git


# The encoder works as follows:
# 1. A cypher string that contains all the unique characters that are to be encoded.
#    ex: "The quick brown fox jumps over the lazy dog"
# 2. An input string, to be encoded
# 3. Starting at index 0, look for the first instance of the first character
#    of the input string
# 4. Record the index found
# 5. From that index, search for the first instance of the second character
# 6. Record the index found. Repeat. Wrap the cypher string around as necessary.
# 7. Result: input string encoded as a string of numbers.

# To decode, similar process, self explanatory.

require "byebug.rb"

class JW
  @cypher = "ruby is a dynamic, reflective, object-oriented, general-purpose programming language. it was designed and developed in the mid-1990s by yukihiro 'matz' matsumoto in japan."
  #@cypher = "  a  ta  t"
  #puts @cypher.length
  def self.encode(input_string)
    idx = 0
    steps = []
    #byebug
    input_string.each_char do |c|
      # Starting at the index of the previous char, find the next char we need
      next_idx = (@cypher*2).index(c,idx) # cypher*2 to wrap-around
      # Subtract to find how far we've moved along the cypher string
      steps << next_idx - idx
      idx = next_idx % @cypher.length # % to wrap-around
    end
    return steps
    # an array of numbers:
      # no number should be longer than the cypher string
      # no number should be negative
      # output array should be of equal length to the input_string
  end

  def self.decode(number_array)

    return "T"*number_array.length
    # string of letters:
      # no letter should fail to appear in the cypher string
      # output string should be of equal length to the number_array
      # calling encode and decode in sequence should return the input as output
  end
end

p JW.encode("nick")
p JW.decode([12, 3, 1, 122])

=begin
str = "fffsdfg"
idx = 0
4.times do
  p idx = str.index("f", idx)+1

end
=end
