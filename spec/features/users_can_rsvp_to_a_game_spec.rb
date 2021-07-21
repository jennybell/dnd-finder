
# feature "group members can rsvp to a game" do
#   scenario "members can respond to a game to say they are going" do
#     sign_up
#     create_group
#     schedule_game
#     click_link "Going"
#     expect(page).to have_content "1 Going"
#   end

#   scenario "it will say 0 going if no user has clicked the going link" do
#     sign_up
#     create_group
#     schedule_game
#     expect(page).to have_content "0 Going"
#   end

#   scenario "the username will appear when clicking the going link" do
#     sign_up
#     create_group
#     schedule_game
#     click_link "Going"
#     expect(page).to have_content "testuser"
#   end
# end

