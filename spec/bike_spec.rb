require 'bike'

describe Bike do

  it { is_expected.to respond_to :working?}

  # I'd like to see if a bike is working
  it 'release working bikes' do
    expect(subject).to be_working
  end
  
  # I'd like to report a bike as broken when I return it.
  it 'can be reported broken' do
    subject.report_broken
    expect(subject).to be_broken
  end

end
