feature 'Log in' do
  scenario 'redirects to log in page' do
    visit('/')
    click_button 'Log in'
    expect(page).to have_content('Log in below')
  end
  scenario 'user logs in' do
    visit('/user/login')
    fill_in 'Email', with: 'john.doe@example.com'
    fill_in 'Password', with: '12345'
    click_button 'Log in'
    expect(page).to have_content('Book one of our amazing spaces')
    expect(page).to have_content('Welcome, John')
  end

  scenario 'a user sees an error if they get their email wrong' do
    User.create(first_name: 'John', last_name: 'Walters', email: 'test@example.com', password: 'password123')

    visit '/user/login'
    fill_in(:email, with: 'nottherightemail@me.com')
    fill_in(:password, with: 'password123')
    click_button('Log in')

    expect(page).not_to have_content 'Welcome, John'
    expect(page).to have_content 'Please check your email or password.'
  end
end
