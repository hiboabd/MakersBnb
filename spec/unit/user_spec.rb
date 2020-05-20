require 'user'
require 'pg'

describe User do
  let(:user) {User.new("John", 'Doe', 'john.doe@example.com','12345')}
  it 'has a name, email, password' do
    expect(user.first_name).to eq "John"
    expect(user.last_name).to eq 'Doe'
    expect(user.email).to eq 'john.doe@example.com'
    expect(user.password).to eq '12345'
  end

  describe '.create' do
    it 'adds user to database' do
      empty_tables
      fill_tables
      user = User.create(first_name: "John", last_name: 'Doe', email: 'john.doe@example.com', password: '12345')
      expect(user.first_name).to eq "John"
      expect(user.last_name).to eq 'Doe'
      expect(user.email).to eq 'john.doe@example.com'
      expect(user.password).to eq '12345'
    end
  end

  describe '.password_same?' do
    it 'returns true when passwords match' do
      check = User.password_same?(password: '12345', confirm_password: '12345')
      expect(check).to eq(true)
    end

    it 'returns false when passwords do not match' do
      check = User.password_same?(password: '12345', confirm_password: '11111')
      expect(check).to eq(false)
    end
  end

  describe '.authenticate' do
    it 'success: user in database' do
      empty_tables
      fill_tables
      check_user = User.authenticate(email: 'john.doe@example.com', password: '12345')
      expect(check_user.first_name).to eq "John"
    end

    it 'returns nil given an incorrect email address' do
      user = User.create(first_name: "John", last_name: 'Doe', email: 'john.doe@example.com', password: '12345')

      expect(User.authenticate(email: 'nottherightemail@me.com', password: 'password123')).to be_nil
    end
  end
end
