require 'pg'
require 'bcrypt'

class User
  attr_reader :id, :first_name, :last_name, :email, :password

  def initialize(id, first_name, last_name, email, password)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @password = password
    @id = id
  end

  def self.password_same?(password:, confirm_password:)
    if password == confirm_password
      return true
    else
      return false
    end
  end

  def self.create(first_name:, last_name:, email:, password:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test', :user => 'postgres', password: 'Pg5429671')
    else
      connection = PG.connect(dbname: 'makersbnb', :user => 'postgres', password: 'Pg5429671')
    end

    encrypted_password = BCrypt::Password.create(password)

    result = connection.exec("INSERT INTO users (first_name, last_name, email, password) VALUES('#{first_name}', '#{last_name}', '#{email}', '#{encrypted_password}') RETURNING userID, first_name, last_name, email, password")
    User.new(result[0]['userID'], result[0]['first_name'], result[0]['last_name'], result[0]['email'], result[0]['password'])
  end

  def self.authenticate(email:, password:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test', :user => 'postgres', password: 'Pg5429671')
    else
      connection = PG.connect(dbname: 'makersbnb', :user => 'postgres', password: 'Pg5429671')
    end

    result = connection.exec("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(result[0]['userID'], result[0]['first_name'], result[0]['last_name'], result[0]['email'], result[0]['password'])
  end


end
