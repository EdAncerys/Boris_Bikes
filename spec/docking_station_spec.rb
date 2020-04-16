require 'docking_station'
require 'bikes'

describe DockingStation do
  # Step 8 Unit test
  it { is_expected.to respond_to :release_bike}

  it 'release working bikes' do
    # dock = DockingStation.new
    bike = subject.release_bike
    expect(bike).to be_working
  end

  # it { is_expected.to respond_to(:dock).with(1).argument }

  # it { is_expected.to respond_to(:bike) }

  it 'dock something ' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      # Let's not dock a bike first:
      # remember subject == DockingStation.new
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

end
