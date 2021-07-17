require 'rails_helper'

feature 'Deleting a group' do 
  scenario 'an admin can delete the group' do 
    sign_up
    create_group
    click_link 'Delete Group'
    expect(page).to_not have_content 'test group'
  end

  scenario 'an regular group user cannot delete the group' do 
    sign_up
    create_group
    log_out
    sign_up_2nd_user
    send_group_request
    log_out
    sign_in
    accept_group_request
    log_out
    sign_in_second_user
    enter_group
    expect(page).not_to have_link 'Delete Group'
  end

  scenario 'a regular user who is not int he group cannot delete the group' do 
    sign_up
    create_group
    log_out
    sign_up_2nd_user
    enter_group
    expect(page).not_to have_link 'Delete Group'
  end
end