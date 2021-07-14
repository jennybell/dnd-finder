def sign_up
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

def sign_up_2nd_user 
  visit("/users/sign_up")
  fill_in 'Email', with: 'test2@example.com' 
  fill_in 'Username', with: 'testuser2'
  select 'Neutral', from: 'Alignment'
  fill_in 'Location', with: 'London'
  fill_in "Bio", with: 'testing profile'
  check "user_dm"
  fill_in 'Password', with: 'password123' 
  fill_in 'Password confirmation', with: 'password123'
  check "user_terms"
  click_button "Sign up"
end

def sign_up_create_group_and_sign_up_2nd_user
  sign_up
  click_link 'Taverns'
  click_link 'New Group'
  fill_in 'Name', with: 'test group'
  click_button 'Create Group'
  visit '/' 
  click_link 'Sign Out'
  sign_up_2nd_user
end

def log_in
  fill_in 'Email', with: 'test@example.com'
  fill_in 'Password', with: 'password123'
  click_button 'Log in'
end