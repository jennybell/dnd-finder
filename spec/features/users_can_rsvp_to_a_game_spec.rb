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

  scenario "the username will appear when clicking the going link" do
    click_link "Going"
    expect(page).to have_content "testuser"
  end

  scenario "members can withdraw rsvp" do
    2.times { click_link "Going" }
    expect(page).to have_content " 0 Going"
    expect(page).not_to have_content "2 Going"
  end
end