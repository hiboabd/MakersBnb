require 'bookings'

describe Bookings do

  describe '#isBookable?' do
    context 'when Owner wants to make booking' do
      it 'returns false if no Bookigns entry' do
        owner_id = double("owner_id")
        space_id = 1
        date = "2001-01-01"
        empty_tables()
        expect(Bookings.isBookable?(owner_id, space_id, date)).to eq(true)
      end
      it 'returns true if Bookings entry' do
        owner_id = double("owner_id")
        space_id = 1
        date = "2001-01-01"
        empty_tables()
        fill_bookings_table_with_3_bookings
        expect(Bookings.isBookable?(owner_id, space_id, date)).to eq(false)
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
