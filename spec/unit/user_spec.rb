require 'user'
require 'pg'

describe User do
  let(:user) {User.new("John", "Smith", "JohnSmith@example.com","Password123")}
  it 'has a name, email, password' do
    expect(user.first_name).to eq "John"
    expect(user.last_name).to eq "Smith"
    expect(user.email).to eq "JohnSmith@example.com"
    expect(user.password).to eq "Password123"
  end

  describe '.create' do
    it 'adds user to database' do
      user = User.create(first_name: "John", last_name: "Smith", email: "JohnSmith@example.com", password: "Password123").first
      expect(user['first_name']).to eq "John"
      expect(user['last_name']).to eq "Smith"
      expect(user['email']).to eq "JohnSmith@example.com"
      expect(user['password']).to eq "Password123"
    end
  end

  describe '.authenticate' do
    it 'checks for user in database' do
      user = User.create(first_name: "John", last_name: "Smith", email: "JohnSmith@example.com", password: "Password123").first
      user = User.check(email: "JohnSmith@example.com", password: "Password123")
    end
  end
end
