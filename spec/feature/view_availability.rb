feature 'checking availability' do
  scenario 'user checks availability' do
    visit('/')
    click_button 'Log in'
    fill_in 'email', with: 'john.doe@example.com'
    fill_in 'password', with: '12345'
    click_button 'Log in'

    visit ('/spaces/new')
    fill_in 'name', with: 'Home'
    fill_in 'description', with: 'No place like home'
    fill_in 'price', with: '50'
    fill_in 'start_date', with: '2001-01-01'
    fill_in 'end_date', with: '2001-01-20'
    click_button 'submit'
    expect(page).to have_content('Your listing has been added')

    click_button 'check availability'
    expect(page).to have_content('Availability for Home')
  end
end
