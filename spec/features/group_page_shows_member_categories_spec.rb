require 'rails_helper'

feature 'Group Roles' do 
  scenario 'group roles are visible in the group page' do
    sign_up
    create_group
    log_out
    sign_up_2nd_user
    send_group_request
    log_out
    sign_in
    accept_group_request
    expect(page).to have_content "Admin: testuser"
    expect(page).to have_content "Players: testuser2"
  end

  scenario 'admin can assign DM role' do 
    sign_up
    create_group
    log_out
    sign_up_2nd_user
    send_group_request
    log_out
    sign_in
    accept_group_request
    click_link 'Assign DM'
    expect(page).to have_content "DM: testuser2"
  end
end