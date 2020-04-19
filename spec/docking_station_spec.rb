require 'docking_station'
require 'bike'

describe DockingStation do

  # I'd like to see if a bike is working
  it 'release working bikes' do
    bike = Bike.new
    expect(bike.working?).to eq true
  end
  
  # I'd like to get a bike from a docking station.
  it { is_expected.to respond_to(:dock).with(1).argument }
  
  # expects DockingStation instances to respond_to #release_bike
  it { is_expected.to respond_to :release_bike }

  # it { is_expected.to respond_to(:bike) }
  
  # I want to dock my bike at the docking station
  it 'dock bike at the docking station' do
    bike = Bike.new
    expect(subject.dock(bike)).not_to eq nil
  end

  # I want to see a bike that has been docked
  it 'returns docked bikes' do
    bike = Bike.new
    expect(subject.dock(bike).shift).to eq bike
  end
  
  # I'd like docking stations not to release bikes when there are none available.
  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  # I'd like docking stations not to accept more bikes than their capacity.
  describe '#dock' do
    it 'raises an error when full' do
      bike = Bike.new
      subject.capacity.times { subject.dock(bike) }
      expect { subject.dock bike }.to raise_error 'Docking station full'
    end
  end

  # I want a docking station to have a default capacity of 20 bikes.
  it 'default capacity should be 20' do
    expect(subject.capacity).to eq 20
  end

end
