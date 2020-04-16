require_relative 'bikes'

class DockingStation
  attr_reader :bike 

  def release_bike
    Bike.new
  end

  def dock(bike)
     @bike = bike
  end
end

station1 = DockingStation.new
bike1 = Bike.new
station1.dock(bike1)

read = DockingStation.new

# p read.dock("Boris bike")
# p read.bike

bike = station1.release_bike
p bike.working? == true