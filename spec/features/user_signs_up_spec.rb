require 'rails_helper'


RSpec.feature "L'utilisateur s'inscrire" do
  scenario 'Avec des données valides' do
    visit new_user_registration_path

    fill_in 'Username', with: 'username'
    fill_in 'Email', with: 'username@example.com'
    # find('div.user_password').fill_in 'Password' with: 'password'
    fill_in 'user_password', with: 'password' 
    # fill_in 'Password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Inscription'

    expect(page).to have_text 'Bienvenue, vous êtes connecté.'
    # expect(page).to have_but 'Sign Out'
    # expect(page).to have_current_path root_path
  end

  scenario 'avec des données invalides' do
    visit new_user_registration_path

    click_button 'Inscription'

    expect(page).to have_text "Email ne peut pas être vide"
    expect(page).to have_text "Mot de passe Mot de passe ne peut pas être vide"
    expect(page).to have_no_link 'Se déconnecter'
  end
end
