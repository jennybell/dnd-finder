require 'rails_helper'

describe 'Group Chat' do 
  scenario 'a group member can send messages in their group' do 
    sign_up
    create_group
    fill_in('content', with: 'Sup JP and Willoughby and Jenny')
    click_button 'Send'
    expect(page).to have_content 'Sup JP and Willoughby and Jenny'
  end

  scenario 'a user cannot see chat if they are not a group member' do 
    sign_up
    create_group
    sign_out
    sign_up_2nd_user
    enter_group
    expect(page).to_not have_content 'Add message:'
  end
end