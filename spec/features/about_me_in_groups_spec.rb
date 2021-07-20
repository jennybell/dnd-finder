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
    log_out 
    sign_up_2nd_user
    send_group_request
    log_out
    log_in
    accept_group_request
    click_link 'Assign DM'
    log_out
    sign_in_second_user
    enter_group
    click_link 'Edit Game Information'
    fill_in 'Information', with: 'blaaaaah'
    click_button 'Submit'
    expect(page).to have_content 'blaaaaah'
  end
end