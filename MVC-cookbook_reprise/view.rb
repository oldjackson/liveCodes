class View
  def display(recipes)
    recipes.each_with_index do |rec, index|
      puts " #{index + 1} - #{rec.name}:"
      puts "#{rec.description}\n\n"
    end
  end

  def ask_user_for_name
    puts "Enter a name for your recipe:"
    print '> '
    gets.chomp
  end

  def ask_user_for_description
    puts "Enter a description for your recipe:"
    print '> '
    gets.chomp
  end

end
