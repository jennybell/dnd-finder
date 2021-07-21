require 'rails_helper' 

feature 'Character Creation' do
  scenario 'an admin can create their character when they create the group' do 
    sign_up
    create_group
    expect(page).to have_content 'testuser - Charlie, Human Barbarian'
  end

  scenario 'a user lets the admin know which character they wish to play when they ask to join' do 
    sign_up
    create_group
    sign_out 
    sign_up_2nd_user
    send_group_request
    sign_out
    sign_in
    enter_group 
    expect(page).to have_content 'Character Name: Wally, Race: Catfolk, Class: Barbarian requests to join your party'
  end

  scenario 'once a join request is accepted their character information is displayed in the user list' do 
    sign_up
    create_group
    sign_out 
    sign_up_2nd_user
    send_group_request
    sign_out
    sign_in
    accept_group_request
    expect(page).to have_content 'testuser2 - Wally, Catfolk Barbarian'
  end
end