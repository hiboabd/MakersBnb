require 'availability'

describe Availability do
  it 'stores available dates' do
    empty_tables
    fill_tables
    available = Availability.add(start_date: '2001-01-02', end_date: '2001-01-20', spaceID: 1)
    expect(available).to be_a(Date)
  end

  describe '#is_available?' do
    it 'returns true if space is available' do
      
    end

    it 'returns false if space is available' do
    end
  end
end
