feature "group members can rsvp to a game" do
  scenario "members can respond to a game to say they are going" do
    sign_up
    create_group
    schedule_game
    click_link "Going"
    expect(page).to have_content "1 Going"
  end
end