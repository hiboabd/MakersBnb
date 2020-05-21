require 'bookings'
require './spec/webhelper_spec.rb'

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


  describe '#all' do

    it 'returns all bookings as array' do
      empty_tables()
      fill_bookings_table_with_3_bookings

      bookings = Bookings.all
      expect(bookings[0].date).to eq('2001-01-01')
      expect(bookings[1].date).to eq('2001-01-02')
      expect(bookings[2].date).to eq('2001-01-03')

    end

  end

  describe '#add' do

    it 'adds a booking to the bookings table' do
      empty_tables()
      fill_request_table_with_1_request
      Bookings.add('2001-01-04', 1, 2)
      
      bookings = Bookings.all
      expect(bookings[0].date).to eq('2001-01-04')
      expect(bookings[0].spaceid).to eq(1)
      expect(bookings[0].userid).to eq(2)

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
