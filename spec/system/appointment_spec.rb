#bundle exec rspec spec/system/appointment_spec.rb
require 'rails_helper'
RSpec.describe 'Appointment management function', type: :system do

  before(:each) do

    visit new_user_registration_path
    fill_in 'Username',	with: 'JOHN'
    fill_in 'Email',	with: 'doe@fil.com'
    fill_in 'user_password', with: 'password' 
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    # user= User.last
  end   
  

  describe 'New creation function' do
    context 'When creating a new Appointment' do
      it 'The created Appointment is failled without Description' do
         
         user= User.last
         appointment = Appointment.new(description: nil, user_id: user.id)
         #Transition to appointment list page
         visit appointments_path
         expect(page).not_to have_content 'Visitez la maison X'
    
         # The result of expect is true Then test successful, false If so, the result is output as a failure
      end
    end
  end

  describe 'List display function' do
    context 'When transitioning to the list screen' do
      it 'The created Appointment list is displayed' do

        visit new_appointment_path
        fill_in 'appointment[description]', with: "A côté de la plage"
        click_on 'Create Appointment'
        expect(page).to have_content 'A côté de la plage'
      end
    end
  end
  
  describe 'Detailed display function' do
     context 'When transitioned to any appointment details screen' do
       it 'The content of the relevant appointment is displayed' do
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