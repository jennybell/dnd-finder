require 'rails_helper'

feature 'Group Size' do 
  scenario 'group size is set when groups are created' do 
    sign_up
    click_link 'Taverns'
    find('a', class: 'link_btn').click
    fill_in 'Name', with: 'test group'
    select "2", from: 'Party size'
    click_button "Create Group"
    expect(page).to have_content 'Party Size: 1/2'
  end

  scenario 'group size increases when a user request to join is accepted' do
    sign_up
    click_link 'Taverns'
    find('a', class: 'link_btn').click
    fill_in 'Name', with: 'test group'
    select "2", from: 'Party size'
    click_button "Create Group"
    sign_out
    sign_up_2nd_user
    send_group_request
    expect(page).to have_content 'Party Size: 1/2'
    sign_out
    sign_in
    enter_group
    click_link 'Accept'
    expect(page).to have_content 'Party Size: 2/2'
  end

  scenario 'users cannot request to join a full game' do 
    sign_up
    click_link 'Taverns'
    find('a', class: 'link_btn').click
    fill_in 'Name', with: 'test group'
    select "2", from: 'Party size'
    click_button "Create Group"
    sign_out
    sign_up_2nd_user
    send_group_request
    sign_out
    sign_in
    enter_group
    click_link 'Accept'
    sign_out
    sign_up_3rd_user
    enter_group 
    expect(page).not_to have_button 'Request'
  end

  scenario 'group size is set when groups are created' do 
    sign_up
    click_link 'Taverns'
    find('a', class: 'link_btn').click
    fill_in 'Name', with: 'test group'
    select "2", from: 'Party size'
    click_button "Create Group"
    click_link "Back"
    expect(page).to have_content '1 Ally of 2'
  end
end 