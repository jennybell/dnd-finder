require 'rails_helper'

feature 'About Me' do 
  scenario 'information can be added when a group is made' do 
    sign_up
    create_group
    expect(page).to have_content 'Hello noobs!'
  end

  scenario 'a DM can update game information' do 
    sign_up
    create_group
    sign_out 
    sign_up_2nd_user
    send_group_request
    sign_out
    sign_in
    accept_group_request
    click_link 'Assign DM'
    sign_out
    sign_in_second_user
    enter_group
    click_link 'Edit Game Information'
    fill_in 'Information', with: 'blaaaaah'
    click_button 'Submit'
    expect(page).to have_content 'blaaaaah'
  end

  scenario 'game edition can be set in group creation' do 
    sign_up
    create_group
    expect(page).to have_content 'Game Edition: 5e'
  end

  scenario 'party level can be set in group creation' do 
    sign_up
    create_group
    expect(page).to have_content 'Current Party Level: 4'
  end

  scenario 'game edition can be updated in the edit page' do 
    sign_up
    create_group
    click_link 'Edit Game Information'
    select "3e", from: 'Game edition'
    click_button 'Submit'
    expect(page).to have_content 'Game Edition: 3e'
  end

  scenario 'campaign type can be set in group creation' do 
    sign_up
    create_group
    expect(page).to have_content 'Campaign Type: Homebrew'
  end

  scenario 'campaign type can be updated in the edit page' do 
    sign_up
    create_group
    click_link 'Edit Game Information'
    select "Module", from: 'Campaign type'
    click_button 'Submit'
    expect(page).to have_content 'Campaign Type: Module'
  end  

  scenario 'party level can be updated in the edit page' do 
    sign_up
    create_group
    click_link 'Edit Game Information'
    select "7", from: 'Party level'
    click_button 'Submit'
    expect(page).to have_content 'Current Party Level: 7'
  end
end