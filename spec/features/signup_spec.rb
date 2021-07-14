feature "Users can sign up" do
  scenario "users can create an account" do
    sign_up
    expect(page).to have_content("testuser")
  end
end