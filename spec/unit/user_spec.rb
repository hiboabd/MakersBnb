require 'user'

describe User do
  it 'Says Bye' do
    expect(subject.bye).to eq('Bye!')
  end
end
