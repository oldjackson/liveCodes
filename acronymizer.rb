def acronymize(sentence)

  words = sentence.split
  acronym = ""
  words.each do |word|
    acronym << word[0].upcase
  end

  return acronym
end

puts "Enter phrase to acronymize:"
print "> "

input = gets.chomp
puts acronymize(input)
