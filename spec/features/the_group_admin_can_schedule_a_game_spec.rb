feature "schedule games" do
  scenario "the group admin can create a game" do
    sign_up
    visit '/groups'
    create_group
    fill_in 'Date', with: '24/07/2021'
    fill_in 'Time', with: '18:00'
    click_button 'Schedule game'
    expect(page).to have_content('2021-07-24')
    expect(page).to have_content('18:00')
  end
end