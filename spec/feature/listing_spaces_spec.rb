feature 'Listing spaces' do
  scenario 'User can see all spaces available' do
    empty_tables
    fill_tables
    visit('/spaces')
    expect(page).to have_content('Book one of our amazing spaces')
    expect(page).to have_link 'Home', href: "/spaces/1"
    # click_link('Home')
    # List all bookable spaces
  end

  scenario 'User can see all spaces available' do
    visit('/')
    click_button 'Log in'
    fill_in 'email', with: 'john.doe@example.com'
    fill_in 'password', with: '12345'
    click_button 'Log in'
    click_button 'List your own space'
    fill_in 'name', with: 'Home'
    fill_in 'description', with: 'No place like home'
    fill_in 'price', with: '50'
    fill_in 'start_date', with: '2001-01-01'
    fill_in 'end_date', with: '2001-01-20'
    click_button 'submit'
    expect(page).to have_content('Your listing has been added')
    expect(page).to have_content('Home')
    expect(page).to have_content('No place like home')
  end
end
