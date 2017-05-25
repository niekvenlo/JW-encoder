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


class JW
  @cypher = "The quick brown fox jumps over the lazy dog"
  def self.encode(input_string)

    return [0]
    # an array of numbers:
      # no number should be longer than the cypher string
      # no number should be negative
      # output array should be of equal length to the input_string
  end

  def self.decode(number_array)

    return "T"
    # string of letters:
      # no letter should fail to appear in the cypher string
      # output string should be of equal length to the number_array
      # calling encode and decode in sequence should return the input as output
  end
end





describe JW do
  describe "#encode" do
    context "correct input" do
      it "returns an array of numbers" do
        expect(JW.encode("")).to be_an_instance_of(Array)
        expect(JW.encode("d")).to be_an_instance_of(Array)
      end
      if "returns output of equal length to the input"
        expect(JW.encode("aa")).to
    end
  end
end
