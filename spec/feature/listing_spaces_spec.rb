feature 'Listing spaces' do
  scenario 'User can see all spaces available' do
    visit('/spaces')
    expect(page).to have_content('Book one of our amazing spaces')
  end
end
