class Spaces

  attr_reader  :id, :name, :description, :price, :userID

  def initialize(id, name, description, price, userID)
    @id = id
    @name = name
    @description = description
    @price = price
    @userid = userID
  end

  def self.add_space(name:, description:, price:, userID:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test', :user => 'postgres', password: 'Pg5429671')
    else
      connection = PG.connect(dbname: 'makersbnb', :user => 'postgres', password: 'Pg5429671')
    end

    result = connection.exec("INSERT INTO Spaces (name, description, price, userID) VALUES ('#{name}', '#{description}', '#{price}', '#{userID}') RETURNING spaceid, name, description, price, date, userID")
    Spaces.new(result[0]['spaceid'], result[0]['name'], result[0]['description'], result[0]['price'], result[0]['userID'])
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test', :user => 'postgres', password: 'Pg5429671')
    else
      connection = PG.connect(dbname: 'makersbnb', :user => 'postgres', password: 'Pg5429671')
    end

    result = connection.exec ('SELECT * FROM Spaces;')
    spaces_array = result.map do |result|
      Spaces.new(result['spaceid'], result['name'], result['description'], result['price'], result['userID'])
    end
    return spaces_array
  end

  def self.find(id)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test', :user => 'postgres', password: 'Pg5429671')
    else
      connection = PG.connect(dbname: 'makersbnb', :user => 'postgres', password: 'Pg5429671')
    end

    result = connection.exec ("SELECT * FROM Spaces WHERE spaceid = '#{id}' ")
    Spaces.new(result[0]['spaceid'], result[0]['name'], result[0]['description'], result[0]['price'], result[0]['userID'])
  end
end
