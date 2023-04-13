def encode(plaintext, key)
  cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
  ciphertext_chars = plaintext.chars.map do |char|
   (65 + cipher.find_index(char)).chr
  end
  return ciphertext_chars.join
end

def decode(ciphertext, key)
  cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
  plaintext_chars = ciphertext.chars.map do |char|
    cipher[(65 - char.ord).abs]
  end
  return plaintext_chars.join
end

# Intended output:
#
# > encode("theswiftfoxjumpedoverthelazydog", "secretkey")
# => "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
#
# > decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
# => "theswiftfoxjumpedoverthelazydog"

puts encode("theswiftfoxjumpedoverthelazydog", "secretkey")
puts decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")

# _____________________________________________________________________

# key.chars.uniq => ["s", "e", "c", "r", "t", "k", "y"]
# which is a list of unique characters from the key 'secretkey'

# ('a'..'z').to_a is the alphabet in lower case in an array
# key.chars is key in an array
# (('a'..'z').to_a - key.chars) is the alphabet array minus the characters in key
# key.chars.uniq + (('a'..'z').to_a - key.chars) is an array that starts with the unique
#characters in key followed by the remaining alphabet letters
# cipher = ["s", "e", "c", "r", "t", "k", "y", "a", "b", "d", "f", "g", "h", "i", "j", "l", 
# "m", "n", "o", "p", "q", "u", "v", "w", "x", "z"]

# decode("E", "secretkey")
# cipher[65 - char.ord] returns v for E instead of t because E.ord is 69
#and cipher[-4] is the letter 'v' in the cipher array