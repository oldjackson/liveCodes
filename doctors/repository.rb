class Repository
  def initialize
    @content = []
  end

  def add_thing(thing)
    @content << thing
  end

  def get_thing(i)
    @content[i - 1]
  end

  def get_all
    @content
  end

  def count_all
    @content.size
  end

  def count_surgeons
    @content.select { |d| d.class == Surgeon }.size
  end

  def count_anaesthetists
    @content.select { |d| d.class == Anaesthetist }.size
  end

  def to_s
    str = ''
    @content.each{ |c| str += c.to_s + "\n"}
    str
  end

end
