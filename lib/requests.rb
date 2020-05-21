class Requests
  # TODO: spaceid should be spaceid, but db has spaceid column so leaving for now. Same for userid / userid
  attr_reader :id, :date, :spaceid, :userid

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
    result = con.exec("INSERT INTO requests (date, spaceid, userid) VALUES ('#{date}', #{spaceid}, #{userid}) RETURNING requestid, date, spaceid, userid").first
    Requests.new(result['date'], result['spaceid'].to_i, result['userid'].to_i)
  end

  def self.delete(date, spaceid)
    con = PG.connect :dbname => 'makersbnb_test', :user => 'postgres'#, :password => 'Pg5429671'
    con.exec("DELETE FROM requests WHERE date = '#{date}' AND spaceid = #{spaceid}").first
    # TODO: return something meaningful
  end

  # def self.get_by_id(id)
  #   con = PG.connect :dbname => 'makersbnb_test', :user => 'postgres'#, :password => 'Pg5429671'
  #   result = con.exec("SELECT * FROM requests WHERE requestid = #{id}").first
  #   Requests.new(result['date'], result['spaceid'].to_i, result['userid'].to_i)
  # end


end












