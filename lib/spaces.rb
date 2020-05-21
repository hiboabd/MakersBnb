class Spaces

  attr_reader :name, :description, :price, :userID

  def initialize(name:, description:, price:, userID:)
    @name = name
    @description = description
    @price = price
    @userID = userID
  end

  def self.add_space(name:,description:,price:, userID:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test', :user => 'postgres', password: 'Pg5429671')
    else
      connection = PG.connect(dbname: 'makersbnb', :user => 'postgres', password: 'Pg5429671')
    end

    result = connection.exec("INSERT INTO Spaces (name, description, price, userID) VALUES ('#{name}', '#{description}', '#{price}', '#{userID}') RETURNING name, description, price, date, userID")

  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test', :user => 'postgres', password: 'Pg5429671')
    else
      connection = PG.connect(dbname: 'makersbnb', :user => 'postgres', password: 'Pg5429671')
    end

    result = connection.exec ('SELECT * FROM Spaces;')
    result.map do |result|
      Spaces.new(name: result['name'], description: result['description'], price: result['price'], userID: result['userID'])
    end
  end


end
