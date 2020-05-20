require 'pg'

class User
  attr_reader :first_name, :last_name, :email, :password

  def initialize(first_name, last_name, email, password)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @password = password
  end

  def self.create(first_name:, last_name:, email:, password:)
    if ENV['RACK_ENV'] = 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    connection.exec("INSERT INTO users (first_name, last_name, email, password) VALUES('#{first_name}', '#{last_name}', '#{email}', '#{password}') RETURNING first_name, last_name, email, password")
  end

  def self.authenticate(email:, password:)
    if ENV['RACK_ENV'] = 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec("SELECT * FROM users WHERE email = '#{email}' AND password = '#{password}'")
    User.new(result[0]['first_name'], result[0]['last_name'], result[0]['email'], result[0]['password'])
  end
end
