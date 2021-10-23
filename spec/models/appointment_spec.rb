#bundle exec rspec spec/models/appointment_spec.rb
#bundle exec rspec
require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe 'Fonction de modèle des Appointments' do
    context 'Si le contenu de la description de Appointment est vide' do
      it 'Ne pas pouvoir valider la demande de rendez-vous' do
        user = create :user
        user= User.last
        #@appointment = FactoryBot.create(:appointment,  description: '', user_id: user.id )
        appointment = Appointment.new(description: '', user_id: user.id)
        expect(appointment).not_to be_valid
      end
    end
  end
  describe 'Fonction de modèle des Appointments' do
    context 'Si le contenu de la description de Appointment est bien renseigné' do
      it 'Validation réussie' do
        user = create :user
        user= User.last
        @appointment = FactoryBot.create(:appointment,  description: 'Visitez la chambre X', user_id: user.id )
        expect(@appointment).to be_valid
      end
    end
  end
end  
#   describe 'Fonction de validation des Appointment décrites' do

#     before do
#       user = create :user
#       user= User.last
#     end
#     context 'Si la description de Appointment est décrit' do
#       it 'Validation réussie' do
#       @appointment = FactoryBot.create(:appointment, description: 'Visitez la chambre X', user_id: user.id)
#       expect(page).to have_text 'Appointment was successfully created.'
#         # Décrivez le contenu ici
#       end
#     end
#   end
  
# end

# describe 'Validation test' do
#   context 'If the task Name is empty' do
#     it "Task registration must fail" do
#       task = Task.new(task_name: '', task_details: 'Failure test')
#       expect(task).not_to be_valid
#     end
#   end
#   context 'If the task details are empty' do
#     it 'Validation is caught' do
#       task = Task.new(task_name: 'rspec', task_details:'')
#       task.valid?
#       expect(task.errors[:task_details]).to include("can't be blank")
#     end
#   end
#   context 'If the task Title and details are described' do
#     it 'Validation passes' do
#       task = Task.new(task_name: 'Al right', task_details:'passing registration')
#     end
#   end

  # visit new_user_registration_path

  # fill_in 'Username', with: 'username'
  # fill_in 'Email', with: 'username@example.com'
  # # find('div.user_password').fill_in 'Password' with: 'password'
  # fill_in 'user_password', with: 'password' 
  # # fill_in 'Password', with: 'password'
  # fill_in 'Password confirmation', with: 'password'
  # click_button 'Sign up'
  # visit new_appointment_path

  # click_button 'Create Appointment'