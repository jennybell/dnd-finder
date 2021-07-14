def sign_up
  visit("/users/sign_up")
  attach_file 'user_avatar', 'spec/files/avatar.png'
  fill_in 'Email', with: 'test@example.com' 
  fill_in 'Username', with: 'testuser'
  select 'Neutral', from: 'Alignment'
  fill_in 'Location', with: 'London'
  fill_in "Bio", with: 'testing profile'
  check "user_dm"
  fill_in 'Password', with: 'password123' 
  fill_in 'Password confirmation', with: 'password123'
  check "user_terms"
  click_button "Sign up"
end

def sign_up_without_avatar
  visit("/users/sign_up")
  fill_in 'Email', with: 'test@example.com' 
  fill_in 'Username', with: 'testuser'
  select 'Neutral', from: 'Alignment'
  fill_in 'Location', with: 'London'
  fill_in "Bio", with: 'testing profile'
  check "user_dm"
  fill_in 'Password', with: 'password123' 
  fill_in 'Password confirmation', with: 'password123'
  check "user_terms"
  click_button "Sign up"
end

def log_in
  fill_in 'Email', with: 'test@example.com'
  fill_in 'Password', with: 'password123'
  click_button 'Log in'
end