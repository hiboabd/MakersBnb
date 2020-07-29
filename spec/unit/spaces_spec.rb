require 'spaces'

describe Spaces do
  it 'Lets me add a space' do
    empty_tables
    fill_tables
    space = Spaces.add_space(name: 'Home', description: 'No place like home', price: 50, userID: 1)
    expect(space.name).to eq "Home"
    expect(space.description).to eq 'No place like home'
    expect(space.price).to eq '50'
  end

  it 'can add another space' do
    space = Spaces.add_space(name: 'Home2', description: 'No place like home2', price: 52, userID: 1)
    expect(space.name).to eq "Home2"
    expect(space.description).to eq 'No place like home2'
    expect(space.price).to eq '52'
  end

  it 'returns all spaces as array' do
    space = Spaces.all
    p "this is my space"
    p space.first
    expect(space.length).to eq 3
  end
end
