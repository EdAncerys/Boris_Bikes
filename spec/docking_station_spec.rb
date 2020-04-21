require 'docking_station'
require 'bike'

describe DockingStation do

  before(:each) { @bike = Bike.new }

  it { is_expected.to respond_to(:dock).with(1).argument }
  
  it { is_expected.to respond_to :release_bike }

  # it { is_expected.to respond_to(:bike) }
  
  it 'should be able to #dock bike at the station' do
    subject.dock @bike
    expect(subject.empty?).to eq false
  end

  it 'should able to see #docked bikes' do
    bike_double = double()
    allow(subject).to receive(:dock) { bike_double }
    expect(subject.dock(bike_double)).to eq bike_double
  end
  
  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      message = 'No bikes available'
      expect { subject.release_bike }.to raise_error message
    end
  end

  describe '#dock' do
    it 'raises an error when full' do
      message = 'Docking station full'
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(@bike) }
      expect { subject.dock @bike }.to raise_error message
    end
  end

  it 'default capacity should be DEFAULT_CAPACITY' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'should be able to have variable capacity' do
    message = 'Docking station full'
    new_capacity = 50
    subject.capacity = new_capacity
    new_capacity.times { subject.dock @bike }
    expect{ subject.dock @bike }.to raise_error message
  end

  it 'should be able report broken bike on #dock' do
    message = 'Bike is broken'
    expect { subject.dock(@bike, true) }.to output(message).to_stdout
  end

  it 'should not #release_bike if broken' do
    message = 'Bike is broken'
    subject.dock(@bike, true)
    expect{ subject.release_bike }.to raise_error message
  end

  it 'should dock bike if #broken?' do
    subject.dock(@bike, true)
    expect(subject.broken?).to eq @bike.report_broken
  end

end
