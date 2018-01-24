require 'date'

def days2Xmas
  # TODO: return the age expressed in days given the day, month, and year of birth
  (Date.new(Date.today.year, 12, 25) - Date.today).to_i
end

puts days2Xmas
