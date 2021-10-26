require 'rails_helper'

RSpec.feature "L'utilisateur se déconnecte" do
  scenario "L'utilisateur se connecte" do
    user = create :user
    sign_in user
    visit root_path
    click_link 'Se déconnecter'

    expect(page).to have_text 'Déconnecté.'
    expect(page).to have_no_link 'Se déconnecter'
    expect(page).to have_current_path root_path
  end
end
