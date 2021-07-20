require 'rails_helper'

feature 'Edit Groups' do 
  scenario 'admin can edit a group' do 
    sign_up
    create_group
    click_link 'Edit Game Information'
    fill_in('Name', with: 'edited test group')
    click_button 'Submit'
    expect(page).to have_content 'edited test group'
  end

  scenario 'an regular group user cannot edit the group' do 
    sign_up
    create_group
    sign_out
    sign_up_2nd_user
    send_group_request
    sign_out
    sign_in
    accept_group_request
    sign_out
    sign_in_second_user
    enter_group
    expect(page).not_to have_link 'Edit Game Information'
  end

  scenario 'a regular user who is not int he group cannot edit the group' do 
    sign_up
    create_group
    sign_out
    sign_up_2nd_user
    enter_group
    expect(page).not_to have_link 'Edit Game Information'
  end
end