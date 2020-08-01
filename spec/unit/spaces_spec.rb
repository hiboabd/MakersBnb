require 'spaces'
require './spec/webhelper_spec.rb'

describe Spaces do
  it 'Lets me add a space' do
    empty_tables
    fill_tables
    space = Spaces.add_space(name: 'Home', description: 'No place like home', price: 50, userID: 1)
    p space
    expect(space.name).to eq "Home"
    expect(space.description).to eq 'No place like home'
    expect(space.price).to eq '50'
  end

  it 'can add another space' do
    space = Spaces.add_space(name: 'Home2', description: 'No place like home2', price: 52, userID: 1)
    p space
    expect(space.name).to eq "Home2"
    expect(space.description).to eq 'No place like home2'
    expect(space.price).to eq '52'
  end

  describe '#all' do
    it 'returns all spaces as array' do
      space = Spaces.all
      expect(space.length).to eq 3
    end
  end

  describe '#find' do
    it 'retrieves a specific space' do
      space = Spaces.find(1)
      expect(space).to be_a(Spaces)
      expect(space.id).to eq('1')
      expect(space.name).to eq('Home')
      expect(space.description).to eq('No place like home')
    end
  end
end
