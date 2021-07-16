require 'rails_helper'

feature 'Groups' do 
  scenario 'other users can join groups' do
    sign_up
    create_group
    visit '/'
    click_link 'Sign Out'
    sign_up_2nd_user
    join_group
    expect(page).to have_content 'testuser'
    expect(page).to have_content 'testuser2'
  end   
end