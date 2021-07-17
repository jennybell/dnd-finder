require 'rails_helper'

feature 'Groups' do 
  scenario 'user can create a group' do 
    sign_up
    create_group
    expect(page).to have_content 'test group'
  end
end