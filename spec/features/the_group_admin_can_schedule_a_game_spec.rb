feature "schedule games" do
  scenario "the group admin can create a game" do
    sign_up
    create_group
    fill_in 'Date', with: '24/07/2021'
    fill_in 'Time', with: '18:00'
    click_button 'Schedule game'
    expect(page).to have_content('2021-07-24')
    expect(page).to have_content('18:00')
  end

  scenario "users who aren't group admin cannot schedule a game" do
    sign_up
    create_group
    visit '/'
    click_link 'Sign Out'
    sign_up_2nd_user
    visit '/groups'
    join_group
    expect(page).not_to have_content("Schedule a game")
  end
end