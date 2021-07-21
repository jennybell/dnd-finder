feature "group members can rsvp to a game" do
  before do
    sign_up
    create_group
    schedule_game
  end
  scenario "members can respond to a game to say they are going" do
    click_link "Going"
    expect(page).to have_content "1 Going"
  end

  scenario "it will say 0 going if no user has clicked the going link" do
    expect(page).to have_content " 0 Going"
  end

  scenario "members can withdraw rsvp" do
    2.times { click_link "Going" }
    expect(page).to have_content " 0 Going"
    expect(page).not_to have_content "2 Going"
  end

  scenario "users can see a list of players" do
    click_link "Going"
    click_link "1 Going"
    expect(page).to have_content "testuser"
  end
end