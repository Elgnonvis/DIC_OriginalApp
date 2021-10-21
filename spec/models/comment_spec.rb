#bundle exec rspec spec/models/comment_spec.rb
require 'rails_helper'

RSpec.describe Comment, type: :model do

  describe 'Fonction de modèle des comments' do
    context 'Si le contenu du comentaire est vide' do
      it 'Ne pas pouvoir publier le commentaire' do
        comment = Comment.new(content: '')
        expect(comment).to be_valid
      end
    end
  end
  describe 'Fonction de rejet des commentaires vides' do
    context 'Si le commentaire est vide' do
      it 'Renvoyer un message de rejet de la publication du commentaire' do
        comment = Comment.new(content: '')
        expect(comment).not_to be_valid
      end
    end
  end
  describe 'Fonction de validation des commentaires décrites' do
    context 'Si le contenu du commentaire est bien renseigné' do
      it 'Validation réussie' do
        user = create :user
        user= User.last
        @property = FactoryBot.create(:property, name: 'Presidence', description: 'Villa propre', type_of_property: 'Villa', status: 'Vaccant', address: 'Cotonou', user_id: user.id )
        comment = Comment.new(content: 'Commentaire de la proprité', user_id: user.id , property_id: @property.id)
        expect(comment).to be_valid
      end
    end
  end
end