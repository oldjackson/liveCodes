class Task
  attr_accessor :title, :description, :done
  attr_reader :id

  def initialize(attr = {})
    @id = attr[:id]
    @title = attr[:title]
    @description = attr[:description]
    @done = attr[:done] || 0
  end

  def self.all
    # returns an array of arrays
    results = DB.execute("SELECT * FROM tasks")
    # .map
    results.map do |row|
      Task.new(id: row[0], title: row[1], description: row[2], done: row[3])
    end
  end

  def save
    if @id.nil?
      query = "INSERT INTO tasks (title, description, done) VALUES ('#{@title}', '#{@description}', #{@done})"
      DB.execute(query)
      @id = DB.last_insert_row_id
    else
      query = "UPDATE tasks SET title = '#{@title}', description = '#{@description}', done = #{@done} WHERE id = #{@id}"
      DB.execute(query)
    end
  end

  # update
  # destroy
  # create
  # all
  # save
  # find
end
