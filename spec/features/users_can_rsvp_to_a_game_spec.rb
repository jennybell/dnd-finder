
feature "group members can rsvp to a game" do
  scenario "members can respond to a game to say they are going" do
    sign_up
    create_group
    schedule_game
    find(class: 'att').click
    expect(page).to have_content "1 Attending"
  end

  scenario "it will say 0 going if no user has clicked the going link" do
    sign_up
    create_group
    schedule_game
    expect(page).to have_content "0 Attending"
  end

  scenario "the username will appear when clicking the going link" do
    sign_up
    create_group
    schedule_game
    find(class: 'att').click
    expect(page).to have_content "testuser"
  end
end

