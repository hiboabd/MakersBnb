require 'date'

class Availability
  attr_reader :id, :date, :spaceid

  def initialize(id, date, spaceid)
    @id = id
    @date = date
    @spaceid = spaceid
  end

  attr_reader :id, :date, :spaceid

  def initialize(id, date, spaceid)
    @id = id
    @date = date
    @spaceid = spaceid
  end

  def self.add(start_date:, end_date:, spaceID:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test', :user => 'postgres', password: 'Pg5429671')
    else
      connection = PG.connect(dbname: 'makersbnb', :user => 'postgres', password: 'Pg5429671')
    end
    Date.parse(start_date).upto(Date.parse(end_date)) do |date|
      result = connection.exec("INSERT INTO Availabilities (date, spaceid) VALUES ('#{date}', #{spaceID}) RETURNING date;")
      p result
    end
  end

  def self.retrieve_availability(id)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test', :user => 'postgres', password: 'Pg5429671')
    else
      connection = PG.connect(dbname: 'makersbnb', :user => 'postgres', password: 'Pg5429671')
    end

    result = connection.exec("SELECT * FROM availabilities WHERE spaceid = '#{id}'")
    availability_array = result.map do |result|
      Availability.new(result['availabilityid'], result['date'], result['spaceid'])
    end
    return availability_array
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test', :user => 'postgres', password: 'Pg5429671')
    else
      connection = PG.connect(dbname: 'makersbnb', :user => 'postgres', password: 'Pg5429671')
    end

    result = connection.exec ('SELECT * FROM availabilities;')
    availabilities_array = result.map do |result|
      Availability.new(result['availabilityid'], result['date'], result['spaceid'])
    end
    return availabilities_array
  end

end
