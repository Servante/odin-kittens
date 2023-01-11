require 'rails_helper'

RSpec.describe 'Adding a kitten', type: :system do
  before do
    visit new_kitten_path
  end

  xscenario 'valid inputs' do    
    fill_in 'Name', with: 'Lion-o'
    fill_in 'age', with: '19'
    fill_in 'cuteness', with: 10
    fill_in 'softness', with: 10
    click_on 'Add Kitten'

    expect(page).to have_content('Kittens')
  end

  xscenario 'invalid inputs' do
    click_on 'Add Kitten'

    expect(page).to have_content("Name can't be blank")
  end
end

RSpec.describe 'Updating a kitten', type: :system do
  before do 
    kitten = create(:kitten)
    visit edit_kitten_path(kitten.id)
  end

  xscenario 'valid inputs' do
    fill_in 'Name', with: "bob"
    click_on 'Save Edits'

    expect(page).to have_content('Kittens')
  end
end

RSpec.describe 'Deleting a kitten', type: :system do
  xscenario 'success' do
    Kitten.create!(name: 'Bob')
    visit kitten_path
    expect(page).to have_content('Bob')

    click_on 'Delete'
    accept_alert
    expect(page).not_to have_content('Bob')
  end
end
