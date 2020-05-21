class Requests
  # TODO: spaceid should be spaceid, but db has spaceid column so leaving for now. Same for userid / userid
  attr_reader :date, :spaceid, :userid

  def initialize(date, spaceid, userid)
    @date = date
    @spaceid = spaceid
    @userid = userid
  end

  def self.all
    requests = Array.new

    con = PG.connect :dbname => 'makersbnb_test', :user => 'postgres'#, :password => 'Pg5429671'
    request_data = con.exec('SELECT * FROM requests;')

    request_data.each do |row|
      requests.push(Requests.new(row['date'], row['spaceid'].to_i, row['userid'].to_i))
    end

    requests
  end

  def self.add(date, spaceid, userid)
    con = PG.connect :dbname => 'makersbnb_test', :user => 'postgres'#, :password => 'Pg5429671'
    con.exec("INSERT INTO requests (date, spaceid, userid) VALUES ('#{date}', #{spaceid}, #{userid}) RETURNING requestid, date, spaceid, userid")
  end

end












