class Spaces

  attr_reader :name, :description, :price, :date, :userID

  def initialize(name, description, price, date, userID)
    @name = name
    @description = description
    @price = price
    @date = date
    @userID = userID
  end

def self.add_space(name:,description:,price:,date:,userID:)
  if ENV['RACK_ENV'] == 'test'
    connection = PG.connect(dbname: 'makersbnb_test', :user => 'postgres', password: 'Pg5429671')
  else
    connection = PG.connect(dbname: 'makersbnb', :user => 'postgres', password: 'Pg5429671')
  end

  result = connection.exec("INSERT INTO Spaces (name, description, price, date, userID) VALUES ('#{name}', '#{description}', '#{price}', '#{date}', '#{userID}') RETURNING name, description, price, date, userID")

end


  # connection = PG.connect(dbname: 'makersbnb', :user => 'postgres', password: 'Pg5429671')
  # result = conection.exec ('SELECT * FROM Spaces;')
  # result.map do
  #   Spaces.new(id: space['id'], title: space['name'], description: space['description'], price: space['price'], date: space['date'], userID: space['userID'])
  #
  # end

end
