
loop do
  options = %w(rock paper scissors)

  user_pick = nil
  until options.include?(user_pick) || user_pick == 'exit'
    puts "What's your pick? (#{options.join(', ')} or exit)"
    print '> '
    user_pick = gets.chomp
  end
  puts "hey"
  break if user_pick == 'exit'

  comp_pick = options.sample
  puts "Computer picked #{comp_pick}."

  if comp_pick == user_pick
    puts "It's a draw!"
  else
    winning_combo = []
    winning_combo.push(%w(rock scissors))
    winning_combo.push(%w(scissors paper))
    winning_combo.push(%w(paper rock))

    combo = [user_pick,comp_pick]

    puts winning_combo.include?(combo) ? "You win!" : "You lose!"
  end
end
