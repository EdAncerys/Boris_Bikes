require_relative 'bike'

class DockingStation
  attr_accessor :capacity 

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bike_station = []
  end
  
  def release_bike
    fail 'No bikes available' if empty?
    
    fail 'Bike is broken' if broken?

    @bike_station.shift
  end
  
  def dock(bike)
    fail 'Docking station full' if full?
    
    @bike_station << bike
  end
  
  def empty?
    @bike_station.empty?
  end

  def full?
    @bike_station.length >= capacity
  end

  def broken?
    Bike.new.broken.class
  end

end
