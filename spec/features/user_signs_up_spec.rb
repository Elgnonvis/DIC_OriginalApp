require 'rails_helper'


RSpec.feature 'User signs up' do
  scenario 'with valid data' do
    visit new_user_registration_path

    fill_in 'Username', with: 'username'
    fill_in 'Email', with: 'username@example.com'
    # find('div.user_password').fill_in 'Password' with: 'password'
    fill_in 'user_password', with: 'password' 
    # fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_text 'Welcome! You have signed up successfully.'
    # expect(page).to have_but 'Sign Out'
    # expect(page).to have_current_path root_path
  end

  scenario 'with invalid data' do
    visit new_user_registration_path

    click_button 'Sign up'

    expect(page).to have_text "Email can't be blank"
    expect(page).to have_text "Password can't be blank"
    expect(page).to have_no_link 'Log Out'
  end
end