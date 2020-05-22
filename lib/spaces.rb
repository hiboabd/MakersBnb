class Spaces

  attr_reader :id, :name, :description, :price, :userid

  def initialize(id, name, description, price, userid)
    @id = id
    @name = name
    @description = description
    @price = price
    @userid = userid
  end

  def self.add_space(name, description, price, userid)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test', :user => 'postgres', password: 'Pg5429671')
    else
      connection = PG.connect(dbname: 'makersbnb', :user => 'postgres', password: 'Pg5429671')
    end

    result = connection.exec("INSERT INTO Spaces (name, description, price, userid) VALUES ('#{name}', '#{description}', #{price}, #{userid}) RETURNING spaceid, name, description, price, date, userid").first
    # p result
    # ret = Spaces.new(id: result['spaceid'], name: result['name'], description: result['description'], price: result['price'], userid: result['userid'])
    ret = Spaces.new(result['spaceid'].to_i, result['name'], result['description'], result['price'].to_i, result['userid'].to_i)
    # p ret
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test', :user => 'postgres', password: 'Pg5429671')
    else
      connection = PG.connect(dbname: 'makersbnb', :user => 'postgres', password: 'Pg5429671')
    end

    result = connection.exec ('SELECT * FROM Spaces;')
    spaces_array = result.map do |result|
      # Spaces.new(id: result['spaceid'].to_i, name: result['name'], description: result['description'], price: result['price'].to_i, userid: result['userid'].to_i)
      Spaces.new(result['spaceid'].to_i, result['name'], result['description'], result['price'].to_i, result['userid'].to_i)
    end
    return spaces_array
  end
end
