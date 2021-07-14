require 'rails_helper'

feature 'Groups' do 
  scenario 'a signed in user can create a group' do 
    sign_up
    click_link 'Taverns'
    click_link 'New Group'
    fill_in 'Name', with: 'test group'
    click_button 'Create Group'
    expect(page).to have_content 'test group'
  end
end