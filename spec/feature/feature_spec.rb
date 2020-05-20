feature 'feature' do

  scenario 'says hello' do
    visit('/')
    expect(page).to have_content('Hello Breakers!')
  end

  scenario 'testing helper' do
    empty_tables
    fill_tables
  end
end
