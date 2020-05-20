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
end
