feature 'add request' do
  scenario 'user can add a request' do
    visit('/')
    click_button 'Log in'
    fill_in 'email', with: 'john.doe@example.com'
    fill_in 'password', with: '12345'
    click_button 'Log in'
    visit ('/request/new')

  end
end