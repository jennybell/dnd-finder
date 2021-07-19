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
    log_out 
    sign_up_2nd_user
    enter_group
    click_button 'Request'
    fill_in 'Character name', with: 'Wally'
    fill_in 'Character race', with: 'Catfolk'
    select "Barbarian", from: 'Character class'
    click_button 'Submit'
    log_out
    log_in
    enter_group 
    expect(page).to have_content 'testuser2 - Wally, Catfolk Barbarian'
  end
end