require 'rails_helper'

feature 'Group Size' do 
  scenario 'group size is set when groups are created' do 
    sign_up
    click_link 'Taverns'
    click_link 'New Group'
    fill_in 'Name', with: 'test group'
    select "10", from: 'Party size'
    click_button "Create Group"
    expect(page).to have_content 'Party Size: 1/10'
  end

  scenario 'group size increases when a user request to join is accepted' do
    sign_up
    click_link 'Taverns'
    click_link 'New Group'
    fill_in 'Name', with: 'test group'
    select "10", from: 'Party size'
    click_button "Create Group"
    log_out
    sign_up_2nd_user
    send_group_request
    expect(page).to have_content 'Party Size: 1/10'
    log_out
    log_in
    enter_group
    click_link 'Accept'
    expect(page).to have_content 'Party Size: 2/10'
  end

  scenario 'users cannot request to join a full game' do 
    sign_up
    click_link 'Taverns'
    click_link 'New Group'
    fill_in 'Name', with: 'test group'
    select "2", from: 'Party size'
    click_button "Create Group"
    log_out
    sign_up_2nd_user
    send_group_request
    log_out
    log_in
    enter_group
    click_link 'Accept'
    log_out
    sign_up_3rd_user
    enter_group 
    expect(page).not_to have_button 'Request'
  end
end 