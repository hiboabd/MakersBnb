require 'user'
require 'pg'

describe User do
<<<<<<< HEAD
  let(:user) {User.new("John", 'Doe', 'john.doe@example.com','12345')}
  it 'has a name, email, password' do
    expect(user.first_name).to eq "John"
    expect(user.last_name).to eq 'Doe'
    expect(user.email).to eq 'john.doe@example.com'
    expect(user.password).to eq '12345'
=======
  let(:user) {User.new("John", "Smith", "JohnSmith@example.com","Password123")}
  it 'has a name, email, password' do
    expect(user.first_name).to eq "John"
    expect(user.last_name).to eq "Smith"
    expect(user.email).to eq "JohnSmith@example.com"
    expect(user.password).to eq "Password123"
>>>>>>> 6e2a5c05d2e0c3dbdb1a12fdca4857261d4cb585
  end

  describe '.create' do
    it 'adds user to database' do
<<<<<<< HEAD
      empty_tables
      fill_tables
      user = User.create(first_name: "John", last_name: 'Doe', email: 'john.doe@example.com', password: '12345').first
      expect(user['first_name']).to eq "John"
      expect(user['last_name']).to eq 'Doe'
      expect(user['email']).to eq 'john.doe@example.com'
      expect(user['password']).to eq '12345'
    end
  end

  describe '.authenticate' do
    it 'success: user in database' do
      empty_tables
      fill_tables
      new_user = User.create(first_name: "John", last_name: 'Doe', email: 'john.doe@example.com', password: '12345').first
      check_user = User.authenticate(email: 'john.doe@example.com', password: '12345')
      expect(check_user.first_name).to eq "John"
=======
      user = User.create(first_name: "John", last_name: "Smith", email: "JohnSmith@example.com", password: "Password123").first
      expect(user['first_name']).to eq "John"
      expect(user['last_name']).to eq "Smith"
      expect(user['email']).to eq "JohnSmith@example.com"
      expect(user['password']).to eq "Password123"
>>>>>>> 6e2a5c05d2e0c3dbdb1a12fdca4857261d4cb585
    end
  end
end
