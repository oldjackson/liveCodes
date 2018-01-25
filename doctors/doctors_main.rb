require_relative 'repository'
require_relative 'surgeon'
require_relative 'anaesthetist'


dr_jones = Doctor.new("Dr. Jones", "Central Hospital", 80000)
# puts dr_jones.salary
puts dr_jones.earnings

dr_smith = Surgeon.new("Dr. Smith", "Central Hospital", "Neuro", 80000, 30000)
puts dr_smith.earnings

dr_paulson = Anaesthetist.new("Dr. Paulson", "Central Hospital", 70000, 1000, 20)
puts dr_paulson.earnings

puts "Surgeon specialties are #{Surgeon.specialties}"

repo = Repository.new

repo.add_thing(dr_jones)
repo.add_thing(dr_smith)
repo.add_thing(dr_paulson)

puts repo.count_all
puts repo.count_surgeons
puts repo.count_anaesthetists

puts repo.to_s
