require 'spaces'
require './spec/webhelper_spec.rb'

describe Spaces do
  it 'Lets me add a spaces' do
    empty_tables
    fill_tables
    # space = Spaces.add_space(name: 'Home', description: 'No place like home', price: 50, userid: 1).first
    # expect(space['name']).to eq "Home"
    # expect(space['description']).to eq 'No place like home'
    # expect(space['price']).to eq '50'
    # expect(space['userid']).to eq '1'
    # space = Spaces.add_space(name: 'Home', description: 'No place like home', price: 50, userid: 1)
    space = Spaces.add_space('Home', 'No place like home', 50, 1)

    # expect(space.name).to eq "Home"
    # expect(space['description']).to eq 'No place like home'
    # expect(space['price']).to eq '50'
    # expect(space['userid']).to eq '1'    
  end

  it 'can add another space' do
    # space = Spaces.add_space(name: 'Home2', description: 'No place like home2', price: 52, userid: 1).first
    # expect(space['name']).to eq "Home2"
    # expect(space['description']).to eq 'No place like home2'
    # expect(space['price']).to eq '52'
    # expect(space['userid']).to eq '1'
  end

  it 'can list spaces' do
    # space = Spaces.all
    # p "this is my space"
    # p space.first
    # expect(space.length).to eq 3
  end
end
