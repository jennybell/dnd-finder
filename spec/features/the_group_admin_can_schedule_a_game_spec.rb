feature "schedule games" do
  scenario "the group admin can create a game" do
    sign_up
    create_group
    schedule_game
    expect(page).to have_content('2021-07-24')
    expect(page).to have_content('18:00')
  end

  scenario "users who aren't group admin cannot schedule a game" do
    sign_up
    create_group
    log_out
    sign_up_2nd_user
    send_group_request
    log_out
    sign_in
    accept_group_request
    log_out
    sign_in_second_user
    visit '/groups'
    click_link 'test group'
    expect(page).not_to have_content("Schedule a game")
  end
end