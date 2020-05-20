require 'user'

describe User do
  let(:user) {User.new("John", "Smith", "JohnSmith@example.com","Password123")}
  it 'has a name, email, password' do
    expect(user.first_name).to eq "John"
    expect(user.last_name).to eq "Smith"
    expect(user.email).to eq "JohnSmith@example.com"
    expect(user.password).to eq "Password123"
  end
end
