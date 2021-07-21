# require 'rails_helper'

# feature 'Session Complete' do
#   scenario 'an admin can complete a session' do 
#     sign_up
#     create_group
#     schedule_game
#     click_link 'End Session'
#     expect(page).to_not have_link 'End Session'
#   end

#   scenario 'a players rating increases when a game they attend is completed' do 
#     sign_up
#     create_group
#     schedule_game
#     click_link 'Going'
#     click_link 'End Session'
#     expect(User.first.rating).to eq 13
#   end
# end