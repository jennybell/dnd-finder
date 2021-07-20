def sign_up
  visit("/users/sign_up")
  attach_file 'user_avatar', 'spec/files/avatar.png'
  fill_in 'Email', with: 'test@example.com' 
  fill_in 'Username', with: 'testuser'
  select 'Neutral', from: 'Alignment'
  fill_in 'Address', with: 'London, UK'
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
  fill_in 'Address', with: 'London, UK'
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
  fill_in 'Address', with: 'London, UK'
  fill_in "Bio", with: 'testing profile'
  check "user_dm"
  fill_in 'Password', with: 'password123' 
  fill_in 'Password confirmation', with: 'password123'
  check "user_terms"
  click_button "Sign up"
end

def sign_up_3rd_user 
  visit("/users/sign_up")
  fill_in 'Email', with: 'test3@example.com' 
  fill_in 'Username', with: 'testuser3'
  select 'Neutral', from: 'Alignment'
  fill_in 'Address', with: 'London, UK'
  fill_in "Bio", with: 'testing profile'
  check "user_dm"
  fill_in 'Password', with: 'password123' 
  fill_in 'Password confirmation', with: 'password123'
  check "user_terms"
  click_button "Sign up"
end

def create_group
  visit '/groups'
  find('a', class: 'link_btn').click
  fill_in 'Name', with: 'test group'
  fill_in 'Information', with: 'Hello noobs!'
  select "2", from: 'Party size'
  select "4", from: 'Party level'
  select "5e", from: 'Game edition'
  fill_in 'Character name', with: 'Charlie'
  fill_in 'Character race', with: 'Human'
  select "Barbarian", from: 'Character class'
  click_button 'Create Group'
end

def enter_group
  visit '/groups'
  click_link 'test group'
end

def send_group_request
  click_link 'Taverns'
  click_link 'test group'
  click_button 'Request'
  fill_in 'Character name', with: 'Wally'
  fill_in 'Character race', with: 'Catfolk'
  select "Barbarian", from: 'Character class'
  click_button 'Submit'
end

def sign_in
  visit '/'
  fill_in 'Email', with: 'test@example.com' 
  fill_in 'Password', with: 'password123'
  click_button 'Log in'
end

def sign_in_second_user
  visit '/'
  fill_in 'Email', with: 'test2@example.com'
  fill_in 'Password', with: 'password123'
  click_button 'Log in'
end

def accept_group_request
  click_link 'Taverns'
  click_link 'test group'
  click_link 'Accept'
end

def sign_out
  visit '/'
  click_link 'Log Out'
end

def schedule_game
  fill_in 'Name', with: 'Battle'
  fill_in 'Date', with: '24/07/2021'
  fill_in 'Time', with: '18:00'
  click_button 'Schedule game'
end