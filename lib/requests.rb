class Requests
  attr_reader :date, :space_id, :user_id

  def initialize(date, space_id, user_id)
    @date = date
    @space_id = space_id
    @user_id = user_id
  end

  def self.all
    requests = Array.new

    con = PG.connect :dbname => 'makersbnb_test', :user => 'postgres'#, :password => 'Pg5429671'
    request_data = con.exec('SELECT * FROM requests;')

    p request_data
    request_data.each do |row|
      requests.push(Requests.new(row['date'], row['spaceid'].to_i, row['userid'].to_i))
    end

    requests
  end

end