# require 'rails_helper'

# feature 'Joining groups' do 
#   scenario 'admins can see user requests to join their groups' do
#     sign_up
#     create_group
#     sign_out
#     sign_up_2nd_user
#     send_group_request
#     sign_out
#     sign_in
#     click_link 'Taverns'
#     click_link 'test group'
#     expect(page).to have_link 'Accept'
#   end

#   scenario 'admins can accept requests for users to join their group' do
#     sign_up
#     create_group
#     sign_out
#     sign_up_2nd_user
#     send_group_request
#     click_link 'Profile'
#     click_link 'Log Out'
#     sign_in
#     accept_group_request
#     expect(page).to have_content 'testuser2'
#   end
# end