require 'date'
class Availability

  def self.add(start_date:, end_date:, spaceID:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test', :user => 'postgres', password: 'Pg5429671')
    else
      connection = PG.connect(dbname: 'makersbnb', :user => 'postgres', password: 'Pg5429671')
    end

    Date.parse(start_date).upto(Date.parse(end_date)) do |date|
      result = connection.exec("INSERT INTO Availabilities (date, spaceID) VALUES ('#{date}', '#{spaceID}') RETURNING date;")
    end

  end
end
