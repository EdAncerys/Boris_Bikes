require 'bike'

describe Bike do
  
  it { is_expected.to respond_to :working?}

end



# describe 'TDD' do

#   it 'instance of the DockingStation should respond to release_bike' do
#     station = DockingStation.new
#     expect(station).to respond_to(:release_bike)
#   end

#   it 'instance of Bike should respond to working' do 
#     bike = Bike.new
#     expect(bike).to respond_to(:working?)
#   end
  
# end