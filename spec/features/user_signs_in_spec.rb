require 'rails_helper'


RSpec.feature "L'utilisateur se connecte" do
  scenario 'avec des données valides' do
    user = create :user

    visit new_user_session_path

    fill_in 'Login', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_text 'Signed in successfully.'
    # expect(page).to have_link 'Sign Out'
    # expect(page).to have_current_path root_path
  end

  scenario "avec des données valides" do
    user = build :user

    visit new_user_session_path

    fill_in 'Login', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_text 'Invalid Login or password.'
    expect(page).to have_no_link 'Log Out'
  end
end
