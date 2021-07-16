require 'rails_helper'

feature 'Group Roles' do 
  scenario 'group roles are visible in the group page' do
    sign_up_create_group_and_sign_up_2nd_user
    click_link 'Taverns'
    click_link 'Show'
    click_button 'Request'
    click_link 'Profile'
    click_link 'Log Out'
    log_in
    click_link 'Taverns'
    click_link 'Show'
    click_link 'Accept'
    expect(page).to have_content "Admin: testuser"
    expect(page).to have_content "Players: testuser2"
  end
end