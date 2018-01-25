require_relative 'doctor'

class Surgeon < Doctor
  def initialize(name, hospital, specialty, basic, extra)
    super(name, hospital, basic)
    @specialty = specialty
    @extra = extra
  end

  attr_reader :specialty

  def earnings
    @salary + @extra
  end

  def self.specialties
    ["Neuro","Heart ","Abdominal ","Orthopedic"].to_s
  end

  def to_s
    "#{@name} is a surgeon specializing in #{specialty}surgery, works at #{hospital} and earns #{earnings}."
  end
end
