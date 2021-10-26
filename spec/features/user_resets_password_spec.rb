#rspec spec/features
#bundle exec rspec
require 'rails_helper'

RSpec.feature "L'utlisateur réinitialise son mot de passe" do
  # scenario 'Utilisateur entre un mail valide' do
  #   user = create :user

  #   visit new_user_password_path

  #   fill_in 'Email', with: user.email
  #   click_button 'Envoyez-moi des instructions pour réinitialiser mon mot de passe'

  #   expect(page).to have_text 'Vous allez recevoir les instructions de réinitialisation du mot de passe dans quelques instants.'
  #   expect(page).to have_current_path new_user_session_path
  # end

  scenario "L'utilisateur entre un mauvais e-mail" do
    visit new_user_password_path

    fill_in 'Email', with: 'username@example.com'
    click_button 'Envoyez-moi des instructions pour réinitialiser mon mot de passe'

    expect(page).to have_text "Email n'a pas été trouvé(e)"
  end

  # scenario 'user changes password' do
  #   token = create(:user).send_reset_password_instructions

  #   visit edit_user_password_path(reset_password_token: token)

  #   fill_in 'New password', with: 'p4ssw0rd'
  #   fill_in 'Confirm new password', with: 'p4ssw0rd'
  #   click_button 'Change my password'

  #   expect(page).to have_text 'Your password has been changed successfully.'
  #   expect(page).to have_current_path root_path
  # end

  # scenario 'password reset token is invalid' do
  #   visit edit_user_password_path(reset_password_token: 'token')

  #   fill_in 'New password', with: 'p4ssw0rd'
  #   fill_in 'Confirm new password', with: 'p4ssw0rd'
  #   click_button 'Change my password'

  #   expect(page).to have_text 'Reset password token is invalid'
  # end
end
