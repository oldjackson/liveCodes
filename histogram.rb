def word_frequency(text)
  words = text.split(/\b/)
  my_hash = {}
  words.each do |w|
    if w[/[a-zA-Z]+/] == w
      if my_hash.key? w
        my_hash[w] += 1
      else
        my_hash[w] = 1
      end
    end
  end
  my_hash
end


text = "Sopra la panca la capra campa, sotto la panca la capra crepa"
p word_frequency(text)
