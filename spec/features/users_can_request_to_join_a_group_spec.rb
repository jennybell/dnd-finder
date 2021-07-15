require 'rails_helper'

feature 'Joining groups' do 
  scenario 'admins can see user requests to join their groups' do
    sign_up_create_group_and_sign_up_2nd_user
    click_link 'Taverns'
    click_link 'Show'
    click_button 'Request'
    click_link 'Profile'
    click_link 'Log Out'
    fill_in 'Email', with: 'test@example.com' 
    fill_in 'Password', with: 'password123'
    click_button 'Log in'
    click_link 'Taverns'
    click_link 'Show'
    expect(page).to have_content 'testuser2'
  end

  scenario 'admins can accept requests for users to join their group' do
    sign_up_create_group_and_sign_up_2nd_user
    click_link 'Taverns'
    click_link 'Show'
    click_button 'Request'
    click_link 'Profile'
    click_link 'Log Out'
    fill_in 'Email', with: 'test@example.com' 
    fill_in 'Password', with: 'password123'
    click_button 'Log in'
    click_link 'Taverns'
    click_link 'Show'
    click_link 'Accept'
    expect(page).to have_content 'testuser2'
  end
end