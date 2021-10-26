#rspec spec/features/user_signs_in_spec.rb
require 'rails_helper'
RSpec.feature "L'utilisateur se connecte" do
  scenario 'avec des données valides' do
    user = create :user

    visit new_user_session_path

    fill_in 'Login', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Connexion'

    expect(page).to have_text 'Connecté.'
    # expect(page).to have_link 'Sign Out'
    # expect(page).to have_current_path root_path
  end

  scenario "avec des données valides" do
    user = build :user

    visit new_user_session_path

    fill_in 'Login', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Connexion'

    expect(page).to have_text 'Email et/ou mot de passe incorrect(s).'
    expect(page).to have_no_link 'Se déconnecter'
  end
end
