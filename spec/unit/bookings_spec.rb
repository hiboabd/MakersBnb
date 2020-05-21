require 'bookings'
require 'requests'
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

  describe '#owner_book' do

    it 'adds a booking and deletes all requests' do
      empty_tables()
      fill_request_table_with_1_request
      request_1 = Requests.add('2001-01-04', 1, 1)
      request_2 = Requests.add('2001-01-04', 1, 2)
      
      # Bookings.add('2001-01-04', 1, 2)
      Bookings.owner_confirm_booking('2001-01-04', 1, 2)
      bookings = Bookings.all
      expect(bookings[0].date).to eq('2001-01-04')
      expect(bookings[0].spaceid).to eq(1)
      expect(bookings[0].userid).to eq(2)

      # Requests.delete('2001-01-04', 1)
      requests = Requests.all

      date_match = false;
      requests.each do |request| 
        if request.date == request_1.date && request.spaceid == request_1.spaceid
          date_match = true
        end
        if request.date == request_2.date && request.spaceid == request_2.spaceid
          date_match = true
        end
      end

      expect(date_match).to eq(false)
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
