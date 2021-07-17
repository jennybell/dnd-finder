feature "users can log out" do
  scenario "users can log out of their account" do
    sign_up
    click_link "Log Out"
    expect(page).to have_content("sign in")
  end
end