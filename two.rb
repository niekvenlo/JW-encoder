# Public: Methods to encode/decode text using an original algorithm.
#
# Examples
#
#   JW.encode("nick")
#   # => [12, 3, 1, 122]
#
#   JW.decode([12, 3, 1, 122])
#   # => "nick"
class JW
  @cypher = %q{ruby is a dynamic, reflective, object-oriented, general-purpose programming language. it was designed and developed in the mid-1990s by yukihiro 'matz' tsumoto in japan.}

  # Public: Sets a new cypher.
  #
  # new_cypher - The new cypher String.
  #
  # Examples
  #
  #   JW.cypher= "Lorem ipsum dolor sit amet"
  #
  #  Returns the cypher String
  def self.cypher=(new_cypher)
    @cypher = new_cypher.downcase
  end

  # Public: Encodes text using an original algorithm.
  #
  # input_string - The String to be encoded.
  #
  # Examples
  #
  #   JW.encode("nick")
  #   # => [12, 3, 1, 122]
  #
  #  Returns an Array of Integers
  def self.encode(input_string)
    idx = 0
    steps = []
    available_letters = @cypher.chars.uniq.join
    input_string.downcase.each_char do |c|
      c = " " unless available_letters.include?(c)
      next_idx = (@cypher*2).index(c,idx)
      steps << next_idx - idx
      idx = next_idx % @cypher.length
    end
    return steps
  end

  # Public: Decodes encoded text using an original algorithm.
  #
  # number_array - An Array of Integers
  #
  # Examples
  #
  #   JW.decode([12, 3, 1, 122])
  #   # => "nick"
  #
  #  Returns a decoded String
  def self.decode(number_array)
    idx = 0
    letters = []
    number_array.each do |n|
      idx = (idx + n) % @cypher.length
      letters << (@cypher*2)[idx]
    end
    return letters.join
  end
end

p JW.encode("nick")
p JW.decode([12, 3, 1, 122])
p JW.decode(JW.encode("example string"))
p JW.cypher= "Ruby modules allow you to create groups of methods that you can then include or mix into any number of classes. Modules only hold behaviour, unlike classes, which hold both behaviour and state."
p JW.decode(JW.encode("example string"))
