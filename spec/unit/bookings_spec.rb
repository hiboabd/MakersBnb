require 'bookings'

describe Bookings do

  describe '#isBookable?' do

    context 'when Owner wants to make booking' do

      it 'returns true if no Bookigns entry' do
        space_id = 1
        date = "2001-01-01"
        empty_tables()
        expect(Bookings.bookable?(date, space_id)).to eq(true)
      end

      it 'returns false if Bookings entry' do
        space_id = 1
        date = "2001-01-01"
        empty_tables()
        fill_bookings_table_with_3_bookings
        expect(Bookings.bookable?(date, space_id)).to eq(false)
      end

    end

  end

  # describe '#self.all' do
  #   it 'returns all of the owners confirmed bookings' do
  #     empty_tables()
  #     fill_bookings_table_with_3_bookings()
  #     expect(Bookings.all(2)).to eq('2001-01-01, 2, 1')
  #     # expect(Bookings.all(2)).to eq('2001-01-02, 2, 1')
  #     # expect(Bookings.all(2)).to eq('2001-01-03, 2, 1')
  #   end
  # end

end
