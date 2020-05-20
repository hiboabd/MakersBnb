require 'Bookings'

describe Bookings do

  describe '#isBookbale' do
    context 'when Owner confirms a booking' do
      it 'creates a booking in the Bookings table' do
        empty_tables()
        fill_bookings_table()

        expect(Bookings.all).to include('2001/01/01 1 1')
        # expect(Bookings.all).to include('2001/01/01')
        # expect(Bookings.all).to include(1)
        # expect(Bookings.all).to include(1)
      end
    end
  end

end
