def acronymize(sentence)
  words = sentence.split
  acronym = words.map { |word| word[0].upcase }.join('')
end

puts "Enter phrase to acronymize:"
print "> "

input = gets.chomp
p acronymize(input)
