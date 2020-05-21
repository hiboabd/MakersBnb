require 'pg'

class Bookings

  def initialize(date, spaceid, userid)
    @date = date
    @spaceid = spaceid
    @userid = userid
  end

  def self.isBookable?(owner_id, space_id, date)

    con = PG.connect :dbname => 'makersbnb_test', :user => 'postgres'#, :password => 'Pg5429671'
    booking_data = con.exec("SELECT * FROM Bookings WHERE spaceID = #{space_id} AND date = '#{date}'").first
    
    return !booking_data

  end


  # def self.all(owner_id)
  #   bookings = []
  #   bookings_mock = [ "space id = 2, 2001-01-01","space id = 2, 2001-01-02", "space id = 2, 2001-01-03" ]
  #
  #   con = PG.connect :dbname => 'makersbnb_test', :user => 'postgres'#, :password => 'Pg5429671'
  #   puts space_bookings = con.exec("SELECT * FROM Spaces WHERE userid = #{owner_id}")
  #
  #   space_bookings.each do |row|
  #     bookings << Bookings.new(row['date'], row['spaceID'], row['userID'])
  #   end
  #
  #   # owner_space_id = space_data['spaceid'].to_i
  #   # booking_data = con.exec("SELECT * FROM Bookings WHERE spaceid = #{owner_space_id}").first
  #   # p booking_date = booking_data['date'].to_s
  #   # "2001/01/01 1 1"
  # end

end
