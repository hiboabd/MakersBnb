require 'requests'
require './spec/webhelper_spec.rb'

describe Requests do

  describe '#all' do

    it 'returns all requests as array' do
      empty_tables()
      fill_request_table_with_1_request

      requests = Requests.all
      expect(requests[0].date).to eq('2001-01-01')
      expect(requests[0].spaceid).to eq(1)
      expect(requests[0].userid).to eq(1)
    end

  end

  describe '#add' do

    it 'adds a request to the requests table' do
      empty_tables()
      fill_request_table_with_1_request
      Requests.add('2001-01-01', 1, 1)
      Requests.add('2001-01-01', 1, 2)

      requests = Requests.all
      expect(requests[1].date).to eq('2001-01-01')
      expect(requests[1].spaceid).to eq(1)
      expect(requests[1].userid).to eq(1)

      expect(requests[2].date).to eq('2001-01-01')
      expect(requests[2].spaceid).to eq(1)
      expect(requests[2].userid).to eq(2)
    end

  end

  # describe '#get_by_id' do

  #   it 'returns id for request' do
  #     empty_tables()
  #     fill_request_table_with_1_request
  #     request = Requests.add('2001-01-04', 1, 2)
  #     result = Requests.get_by_id(2)
  #     expect(result).to eq(2)
  #   end

  # end


  #   describe '.get_by_id' do
  #   it 'gets a specific bookmark' do
  #     connection = PG.connect(dbname: 'bookmark_manager_test')
  #     connection.exec("INSERT INTO bookmarks(id, url, title) VALUES (1, 'http://www.makersacademy.com', 'Makers Academy');")
  #     bookmark = Bookmark.get_by_id(1)
  #     expect(bookmark.id).to eq(1)
  #   end
  # end


  describe '#delete' do

    it 'deletes a request' do
      empty_tables()
      fill_request_table_with_1_request
      request_1 = Requests.add('2001-01-04', 1, 1)
      request_2 = Requests.add('2001-01-04', 1, 2)

      # delete all date AND spaceid don't care about user id
      Requests.delete('2001-01-04', 1)
      requests = Requests.all
      # puts "requests: "; p requests
      # puts "request_1: "; p request_1

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

  describe '#owner_view_requests' do

    it 'returns array of requests for a space' do
      empty_tables()
      fill_bookings_table_with_3_bookings
      request_1 = Requests.add('2001-01-04', 2, 1)
      spaceid_want = 1

      # requests = Requests.owner_view_requests(1)
      requests = Requests.owner_view_requests(2)
      # requests = Requests.all
      requests.each do |request| 
        expect(request.spaceid).to eq(spaceid_want)
      end
      # expect(requests[0].date).to eq('2001-01-01')
      # expect(requests[0].spaceid).to eq(1)
      # expect(requests[0].userid).to eq(1)
    #   empty_tables()
    #   fill_request_table_with_1_request
    #   # [[ '2001-01-01', 1, 1], [...]]

    #   requests = Array.new
    #   request = Hash.new



    #   # expect(Requests.owner_view_requests(space_id)).to eq
    end

  end

end