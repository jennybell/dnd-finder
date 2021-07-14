require 'rails_helper'

feature 'Groups' do 
  scenario 'a signed in user can create a group' do 
    visit '/' 
    click_link 'Sign up'
    fill_in 'Email', with: 'test@example.com' 
    fill_in 'Password', with: 'password123' 
    fill_in 'Password confirmation', with: 'password123' 
    click_button 'Sign up'
    click_link 'Taverns'
    click_link 'New Group'
    fill_in 'Name', with: 'test group'
    click_button 'Create Group'
    expect(page).to have_content 'test group'
  end
end