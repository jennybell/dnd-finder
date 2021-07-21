feature "schedule games" do
  scenario "the group admin can create a game" do
    sign_up
    create_group
    schedule_game
    expect(page).to have_content('2021-07-24')
    expect(page).to have_content('18:00')
    expect(page).to have_content('Battle')
    expect(page).to have_content('Makers Academy')
  end

  scenario "users who aren't group admin cannot schedule a game" do
    sign_up
    create_group
    sign_out
    sign_up_2nd_user
    send_group_request
    sign_out
    sign_in
    accept_group_request
    sign_out
    sign_in_second_user
    visit '/groups'
    click_link 'test group'
    expect(page).not_to have_content("Schedule a game")
  end

  scenario "scheduling a game creates a message in the chat" do
    sign_up
    create_group
    schedule_game
    expect(page).to have_content('testuser has scheduled the game Battle at Makers Academy for 24/07/2021 at 18:00')
  end
end