class Doctor
  def initialize(name, hospital, salary)
    @name, @hospital, @salary = name, hospital, salary
  end

  attr_reader :name, :hospital

  def earnings
    @salary
  end

  def to_s
    "#{@name} is a general practitioner working at #{hospital} and earns #{earnings}."
  end

end
