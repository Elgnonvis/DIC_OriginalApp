#bundle exec rspec spec/models/comment_spec.rb
require 'rails_helper'

RSpec.describe 'Fonction de gestion des Commentaires', type: :system do
    before do
      user = create :user
      visit new_user_session_path

      fill_in 'Login', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'

      user= User.last

      @property = FactoryBot.create(:property, name: 'Diver', description: 'Notre chez', address: 'Parakou', user_id: user.id )
    end

  
  describe "Fonction d'affichage de liste" do
    context "Lors de la transition vers l'écran de liste" do
      it "Une liste des commentaires créées s'affiche" do
        visit properties_path
        click_on "Show"
        user= User.last
        comment = FactoryBot.create(:comment, content: 'Commentaire du post', user_id: user.id , property_id: @property.id)
        #sleep 2
        click_on "Create Comment"
        expect(page).to have_content 'Commentaire du post'
      end
    end
  end
     context "Lors de la mise à jour du commentaire du post" do
       it "Le formulaire d'édition est renvoyé avec le commentaire" do
        visit properties_path
        click_on "Show"

        user= User.last
        comment = FactoryBot.create(:comment, content: 'Commentaire du post', user_id: user.id , property_id: @property.id)
        click_on "Create Comment"
        sleep 2
        click_on "Edit"
        expect(page).to have_content 'Editing comment'
       end
     end
    context "Lors de la suppression d'un commentaire" do
      it "Le commentaire supprimé est enlevé de la liste des commentaires" do
        visit properties_path
        click_on "Show"
        user= User.last
        comment = FactoryBot.create(:comment, content: 'Commentaire du post', user_id: user.id , property_id: @property.id)
        click_on "Create Comment"
        sleep 2
        expect(Comment.count).to eq(1)

        accept_alert do
            click_link 'Delete'
          end

        comment.reload
        visit properties_path
        expect(Comment.count).to eq(0)
      end
  end
end