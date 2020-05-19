feature 'feature' do
  scenario 'says hello' do 
    visit('/')
    expect(page).to have_content('hello!')
  end 
  
end
