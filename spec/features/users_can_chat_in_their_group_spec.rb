require 'rails_helper'

describe 'Group Chat' do 
  scenario 'a user can send messages in their group' do 
    sign_up
    visit '/groups'
    click_link 'New Group'
    fill_in 'Name', with: 'test group'
    click_button 'Create Group'
    fill_in('content', with: 'Sup JP and Willoughby and Jenny')
    click_button 'Send'
    expect(page).to have_content 'Sup JP and Willoughby and Jenny'
  end
end