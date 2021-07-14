feature "Users can sign up" do
  scenario "users can create an account" do
    sign_up
    expect(page).to have_content("testuser")
  end
  scenario "users can add an avatar" do
    sign_up
    expect(page).to have_css("img[src*='avatar.png']")
  end
  scenario "users can signup without an avatar" do
    sign_up_without_avatar
    expect(page).to have_css("img[src*='/assets/default_avatar']")
  end
end