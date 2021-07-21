require 'rails_helper'

feature 'Session Complete' do
  scenario 'an admin can complete a session' do 
    sign_up
    create_group
    schedule_game
    click_link 'End Session'
    expect(page).to_not have_link 'End Session'
  end
end