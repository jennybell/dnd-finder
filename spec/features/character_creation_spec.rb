require 'rails_helper' 

feature 'Character Creation' do
  scenario 'an admin can create their character when they create the group' do 
    sign_up
    click_link 'Taverns'
    click_link 'New Group'
    fill_in 'Name', with: 'test group'
    select "2", from: 'Party size'
    fill_in 'Character name', with: 'Charlie'
    fill_in 'Character race', with: 'Human'
    select "Barbarian", from: 'Character class'
    click_button "Create Group"
    expect(page).to have_content 'testuser - Charlie, Human Barbarian'
  end
end