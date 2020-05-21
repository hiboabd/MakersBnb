require 'requests'

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

  describe '#owner_view_requests' do

    it 'returns array of requests for a space' do
    #   empty_tables()
    #   fill_request_table_with_1_request
    #   # [[ '2001-01-01', 1, 1], [...]]

    #   requests = Array.new
    #   request = Hash.new


    #   # expect(Requests.owner_view_requests(space_id)).to eq
    end

  end

end