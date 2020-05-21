feature 'Registration' do
  scenario 'redirects to sign up page' do
    visit('/')
    click_button 'Sign up'
    expect(page).to have_content('Sign up below')
  end
  scenario 'user signs up' do
    visit('/user/new')
    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Smith'
    fill_in 'Email', with: 'Johnsmith@example.com'
    fill_in 'Password', with: 'Password123'
    fill_in 'Confirm password', with: 'Password123'
    click_button 'Submit'
    expect(page).to have_content('Book one of our amazing spaces')
  end

  scenario 'user cannot sign up with ' do
    visit('/user/new')
    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Smith'
    fill_in 'Email', with: 'Johnsmith@example.com'
    fill_in 'Password', with: 'Password123'
    fill_in 'Confirm password', with: '12345'
    click_button 'Submit'
    expect(page).not_to have_content('Book one of our amazing spaces')
    expect(page).to have_content('Please ensure your passwords match.')
  end
end
