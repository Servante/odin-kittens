require 'rails_helper'

RSpec.describe 'Add a kitten', type: :system do
    
  scenario 'valid inputs' do   
    visit new_kitten_path 
    fill_in 'Name', with: 'Lion-o'
    fill_in 'Age', with: '19'
    fill_in 'Cuteness', with: 10
    fill_in 'Softness', with: 10
    click_on 'Create Kitten'

    expect(page).to have_content('Lion-o')
  end

  scenario 'invalid inputs' do
    visit new_kitten_path
    click_on 'Create Kitten'

    expect(page).to have_content("Name can't be blank")
  end
end

RSpec.describe 'Updating a kitten', type: :system do

  scenario 'valid inputs' do
    kitten = Kitten.create!(name: "Bill", age: 15, cuteness: 10, softness: 10)
    visit edit_kitten_path(kitten.id)
    fill_in 'Name', with: "bob"
    click_on 'Update Kitten'

    expect(page).to have_content("Bob")
  end
end

RSpec.describe 'Deleting a kitten', type: :system do
  scenario 'success' do
    kitten = Kitten.create!(name: "Bill", age: 15, cuteness: 10, softness: 10)
    visit kitten_path(kitten.id)
    click_on "Delete"
    accept_alert

    expect(page).not_to have_content('Bob')
  end
end
