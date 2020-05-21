feature 'add space' do
  scenario 'user can add space' do
    visit ('/spaces/new')
    fill_in 'name', with: 'Home'
    fill_in 'description', with: 'No place like home'
    fill_in 'price', with: '50'
    fill_in 'start_date', with: '2001-01-01'
    fill_in 'end_date', with: '2001-01-20'
    click_button 'submit'
    expect(page).to have_content('Your listing has been added')
  end
end
