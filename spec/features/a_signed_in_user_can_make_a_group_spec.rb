require 'rails_helper'

feature 'Groups' do 
  scenario 'user can create a group' do 
    visit '/' 
    click_link 'Sign up'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Username', with: 'user 1'  
    fill_in 'Password', with: 'password123' 
    fill_in 'Password confirmation', with: 'password123' 
    fill_in 'Location', with: "London"
    click_button 'Sign up'
    click_link 'Taverns'
    click_link 'New Group'
    fill_in 'Name', with: 'test group'
    click_button 'Create Group'
    expect(page).to have_content 'test group'
  end

  scenario 'other users can join groups' do
    visit '/' 
    click_link 'Sign up'
    fill_in 'Email', with: 'test1@example.com' 
    fill_in 'Username', with: 'user 1' 
    fill_in 'Password', with: 'password123' 
    fill_in 'Password confirmation', with: 'password123' 
    fill_in 'Location', with: "London"
    click_button 'Sign up'
    click_link 'Taverns'
    click_link 'New Group'
    fill_in 'Name', with: 'test group'
    click_button 'Create Group'
    visit '/' 
    click_link 'Sign Out'
    click_link 'Sign up'
    fill_in 'Email', with: 'test2@example.com'
    fill_in 'Username', with: 'user 2' 
    fill_in 'Password', with: 'password123' 
    fill_in 'Password confirmation', with: 'password123' 
    fill_in 'Location', with: "London"
    click_button 'Sign up'
    click_link 'Taverns'
    click_link 'Show'
    click_button 'Join'
    expect(page).to have_content 'user 1'
    expect(page).to have_content 'user 2'
  end   
end