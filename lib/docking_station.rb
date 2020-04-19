require_relative 'bike'

class DockingStation
  attr_accessor :capacity 

  def initialize(capacity = 20)
    @capacity = capacity
    @bike_station = []
  end
  
  def release_bike
    fail 'No bikes available' if empty?
    
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

end
