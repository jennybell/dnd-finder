require 'rails_helper'

feature 'Group Roles' do 
  scenario 'group roles are visible in the group page' do
    sign_up
    create_group
    sign_out
    sign_up_2nd_user
    send_group_request
    sign_out
    sign_in
    accept_group_request
    expect(page).to have_content "Admin:"
    expect(page).to have_content "Players:"
  end

  scenario 'admin can assign DM role' do 
    sign_up
    create_group
    sign_out
    sign_up_2nd_user
    send_group_request
    sign_out
    sign_in
    accept_group_request
    click_link 'Assign DM'
    expect(page).to have_content "DM:"
  end
end