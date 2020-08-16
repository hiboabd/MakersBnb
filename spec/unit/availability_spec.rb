require 'availability'

describe Availability do
  it 'stores available dates' do
    empty_tables
    fill_tables
    available = Availability.add(start_date: '2001-01-02', end_date: '2001-01-20', spaceID: 1)
    expect(available).to be_a(Date)
  end

  describe 'retrieve_availability' do
    it 'returns array of available times if space is available' do
      available_space = Availability.retrieve_availability(1)
      expect(available_space).to be_a(Array)
      expect(available_space.length).to eq 20
      expect(available_space[1].date).to eq '2001-01-02'
    end

    it 'returns empty array if space has no available dates' do
      available_space = Availability.retrieve_availability(2)
      expect(available_space).to be_a(Array)
      expect(available_space.length).to eq 0
    end
  end

  describe 'all' do
    it 'returns all available spaces and dates' do
      all_availabilities = Availability.all
      expect(all_availabilities.length).to eq 20
    end
  end

end
