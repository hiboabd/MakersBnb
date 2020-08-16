feature 'Listing spaces' do
  scenario 'User can see all spaces available' do
    empty_tables
    fill_tables
    visit('/')
    click_button 'Log in'
    fill_in 'email', with: 'john.doe@example.com'
    fill_in 'password', with: '12345'
    click_button 'Log in'
    visit('/spaces')
    expect(page).to have_content('Book one of our amazing spaces')
    expect(page).to have_content('Home')
    expect(page).to have_content('No place like home')
  end
end
