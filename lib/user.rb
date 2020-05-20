class User
  attr_reader :first_name, :last_name, :email, :password
  
  def initialize(first_name, last_name, email, password)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @password = password
  end
end
