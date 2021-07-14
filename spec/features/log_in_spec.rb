feature "users can log in" do
  scenario "users can log back in after creating an account" do
    sign_up
    click_link "Sign Out"
    log_in
    expect(page).to have_content('testuser')
  end
end