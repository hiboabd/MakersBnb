feature 'Log in' do
  scenario 'redirects to log in page' do
    visit('/')
    click_button 'Log in'
    expect(page).to have_content('Log in below')
  end
  scenario 'user logs in' do
    visit('/user/login')
    fill_in 'Email', with: 'Johnsmith@example.com'
    fill_in 'Password', with: 'Password123'
    click_button 'Log in'
    expect(page).to have_content('Book one of our amazing spaces')
<<<<<<< HEAD
    expect(page).to have_content('Welcome, John')
=======
>>>>>>> 6e2a5c05d2e0c3dbdb1a12fdca4857261d4cb585
  end
end
