
class Bike
  attr_accessor :broken

  def initialize
    @broken
  end

  def working?
    @working = true
  end

  def report_broken
    @broken = true
  end

  def report_fixed
    @broken = false
  end

  def broken?
    @broken
  end

end
