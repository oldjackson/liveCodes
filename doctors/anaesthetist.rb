require_relative 'doctor'

class Anaesthetist < Doctor
  def initialize(name, hospital, base, amount_per_shift, shifts)
    super(name, hospital, base)
    @amount_per_shift = amount_per_shift
    @shifts = shifts
  end

  def earnings
    @salary + @shifts * @amount_per_shift
  end

  def to_s
    "#{@name} is an anaesthetist working at #{hospital} and earns about #{earnings}."
  end

end
