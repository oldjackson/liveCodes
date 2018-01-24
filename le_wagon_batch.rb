class LeWagonBatch
  def initialize(wagoners,location, number)
    @wagoners = wagoners
    @location = location
    @number = number
    @skills = {
      "Ruby" => 0.2,
      "OOP" => 0.25,
      "DB" => 0.1,
      "Front End" => 0.05,
      "Rails" => 0.1,
      "Pitching" => 0.01
    }
    @hired_during_bootcamp = 0

    puts "Le Wagon #{@location} \##{@number} is off to a great start!\n\n"
  end

  attr_reader :wagoners, :location, :hired_during_bootcamp, :number

  def skills
    @skills.keys
  end

  def hire_wagoner
    if @wagoners > 0
      @hired_during_bootcamp += 1
      puts "Great! Someone from Le Wagon #{@location} \##{@number} has been hired!"
      puts "We have a total of #{@hired_during_bootcamp} hired people in this batch." if @hired_during_bootcamp > 1
    else
      puts "You're late, there's no one left."
    end
    puts "\n"
  end

  def teach_skill(skill)
    if @skills.key? skill
      giveuppers = 0
      @wagoners.times { giveuppers += 1 if rand < @skills[skill] }
      if giveuppers > 0
        puts "Oh no! #{giveuppers} wagoners got scared and gave up while studying #{skill}."
        puts "There are #{@wagoners - giveuppers} left.\n\n"
      end
      @wagoners -= giveuppers
    else
      puts "Sorry, #{skill} is outside Le Wagon curriculum.\n\n"
    end
  end

end

lisbon_122 = LeWagonBatch.new(25,"Lisbon",122)

["Ruby","OOP","Climbing","DB"].each { |sk| lisbon_122.teach_skill(sk) }
lisbon_122.hire_wagoner
["Mixology","Front End","Rails"].each { |sk| lisbon_122.teach_skill(sk) }
lisbon_122.hire_wagoner
lisbon_122.teach_skill("Pitching")
