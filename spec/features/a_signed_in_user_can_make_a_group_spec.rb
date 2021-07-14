require 'rails_helper'

feature 'Groups' do 
  scenario 'user can create a group' do 
    sign_up
    click_link 'Taverns'
    click_link 'New Group'
    fill_in 'Name', with: 'test group'
    click_button 'Create Group'
    expect(page).to have_content 'test group'
  end

  scenario 'other users can join groups' do
    sign_up_create_group_and_sign_up_2nd_user
    click_link 'Taverns'
    click_link 'Show'
    click_button 'Join'
    expect(page).to have_content 'testuser'
    expect(page).to have_content 'testuser2'
  end   
end