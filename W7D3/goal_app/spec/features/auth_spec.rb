require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page'
    fill_in 'email', with: 'capy@aa.io'
    fill_in 'password', with: '123456'
    click_button 'Create user'
    save_and_open_page
  feature 'signing up a user' do
    scenario 'shows username on the homepage after signup'
        expect(page).to have_content('capy@aa.io')
  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login'
    
end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end