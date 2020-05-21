feature 'add space' do
  scenario 'user can add space' do
    visit ('/spaces/new')
    fill_in 'name', with: 'Home'
    fill_in 'description', with: 'No place like home'
    fill_in 'price', with: '50'
    click_button 'submit'
    expect(page).to have_content('Your listing has been added')
  end
end
