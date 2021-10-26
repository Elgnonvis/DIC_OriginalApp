#bundle exec rspec spec/system/appointment_spec.rb
require 'rails_helper'
RSpec.describe 'Management de la fonction des rendez-vous', type: :system do

  before(:each) do

    visit new_user_registration_path
    fill_in 'Username',	with: 'JOHN'
    fill_in 'Email',	with: 'doe@fil.com'
    fill_in 'user_password', with: 'password' 
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Inscription'
    # user= User.last
  end   
  

  describe 'Nouvelle création de la fonction' do
    context "Lors de la création d'un rendez-vous" do
      it "La création de rendez-vous échoue si la description n'est pas renseigné" do
         
         user= User.last
         appointment = Appointment.new(description: nil, user_id: user.id)
         #Transition to appointment list page
         visit appointments_path
         expect(page).not_to have_content 'Visitez la maison X'
    
         # The result of expect is true Then test successful, false If so, the result is output as a failure
      end
    end
  end

  describe "Fonction d'affichage" do
    context "Lorsqu'on va sur l'cran de détails" do
      it "Le rendez-vous créé est affiché" do

        visit new_appointment_path
        fill_in 'appointment[description]', with: "A côté de la plage"
        click_on 'Créer un(e) Rendez-vous'
        expect(page).to have_content 'A côté de la plage'
      end
    end
  end
  
  describe "Fonction d'affichage" do
     context "Lorsqu'on visite le détails de n'importe rendez-vous" do
       it 'Le contenu approprié est affiché' do
        #   visit new_user_session_path
        #   fill_in "Login",	with: "doe@fil.com" 
        #   fill_in "Password",	with: "password" 
        #   click_on("Log in")
          user= User.last
          appointment = FactoryBot.create(:appointment, description: 'Visitez la Villa propre', user_id: user.id )
          visit appointment_path(appointment.id)
          expect(page).to have_content 'Visitez la Villa propre'
       end
     end
  end
end