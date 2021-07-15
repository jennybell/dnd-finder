require 'rails_helper'

describe 'Group Chat' do 
  scenario 'a user can send messages in their group' do 
    sign_up
    click_link 'Taverns'
    click_link 'New Group'
    fill_in 'Name', with: 'test group'
    click_button 'Create Group'
    fill_in('content', with: 'Sup JP and Willoughby')
    click_button 'Send'
    expect(page).to have_content 'Sup JP and Willoughby'
  end
end