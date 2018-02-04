require "sqlite3"

db_file_path = File.join(File.dirname(__FILE__), "tasks.db")
DB = SQLite3::Database.new(db_file_path)
# above lines must be kept

require_relative 'task'


p Task.all

new_task = Task.new(title: 'Go to the party thing tonight', description: 'Not really sure what its going to be like but worst case I will just hang out with lewagon people.')
new_task.save

p Task.all

























# task = Task.new(title: "Fill the beers rack in the fridge", description: "Vegetables should be moved somewhere else.")
# task.save

# task = Task.find(1)
# puts task.title

# Task.all.each do |task|
#   puts "#{task.id}. [#{task.done ? 'X' : ' ' }] #{task.title}"
# end

# task = Task.find(2)
# task.destroy

# task = Task.find(3)
# task.done = true
# task.save
