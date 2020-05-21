require 'spaces'

describe Spaces do
  it 'Lets me add a spaces' do
    empty_tables
    fill_tables
    space = Spaces.add_space(name: 'Home', description: 'No place like home', price: 50, date: '2001-01-01', userID: 1).first
    expect(space['name']).to eq "Home"
    expect(space['description']).to eq 'No place like home'
    expect(space['price']).to eq '50'
    expect(space['date']).to eq '2001-01-01'
    expect(space['userid']).to eq '1'
  end

  it 'can add another space' do
    space = Spaces.add_space(name: 'Home2', description: 'No place like home2', price: 52, date: '2001-01-02', userID: 1).first
    expect(space['name']).to eq "Home2"
    expect(space['description']).to eq 'No place like home2'
    expect(space['price']).to eq '52'
    expect(space['date']).to eq '2001-01-02'
    expect(space['userid']).to eq '1'
  end

  it 'can list spaces' do
    space = Spaces.all
    expect(space.length).to eq 3
  end
end
