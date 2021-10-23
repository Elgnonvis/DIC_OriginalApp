#bundle exec rspec spec/system/property_spec.rb
require 'rails_helper'
RSpec.describe 'Property management function', type: :system do

  before(:each) do

    visit new_user_registration_path
    fill_in 'Username',	with: 'JOHN'
    fill_in 'Email',	with: 'doe@fil.com'
    fill_in 'user_password', with: 'password' 
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    # Fill_in 'User_user_name', With: 'JOHN' 
    # Fill_in 'user_email', With: 'doe@fil.com ' 
    # Fill_in 'User_password', With: 'password' 
    # Fill_in 'User_password_confirmation', With: 'password'
    
    # visit new_user_registration_path
    # fill_in 'Username', with: 'username'
    # fill_in 'Email', with: 'username@example.com'
    # # find('div.user_password').fill_in 'Password' with: 'password'
    # fill_in 'user_password', with: 'password' 
    # # fill_in 'Password', with: 'password'
    # fill_in 'Password confirmation', with: 'password'
    # click_button 'Sign up'

  end   
  
  describe 'New creation function' do
    context 'When creating a new property' do
      it 'The created property is displayed' do
         # Create a property for use in testing
        
        #  visit new_user_session_path
        #  fill_in "Login",	with: "doe@fil.com" 
        #  fill_in "Password",	with: "password" 
        #  click_on("Log in")

         #date = DateTime.now.to_date
         #@property = FactoryBot.create(:property, name: 'Presidence', description: 'Villa propre', type_of_property: 'Villa', status: 'Vaccant', address: 'Cotonou', user_id: user.id )
         #@property = FactoryBot.create(:second_property, name: 'Erevan', description: 'Habitation de rêve', type_of_property: 'House', status: 'Occupied', address: 'Aplahoué', user_id: user.id )
   
         property = FactoryBot.create(:property, name: 'Presidence', description: 'Villa propre', type_of_property: 'Villa', status: 'Vaccant', address: 'Cotonou', user_id: user.id )
         #Transition to property list page
         visit properties_path
         # The text "property" appears on the visited (transitioned) page (property list page)
         # expect (confirm/expect) that have_content is included (is included)
         expect(page).to have_content 'Presidence'
         expect(page).to have_content 'Villa'
    
         # The result of expect is true Then test successful, false If so, the result is output as a failure
      end
    end
  end

  describe 'List display function' do
    context 'When transitioning to the list screen' do
      it 'The created property list is displayed' do

        # visit new_user_session_path
        # fill_in "Login",	with: "doe@fil.com" 
        # fill_in "Password",	with: "password" 
        # click_on("Log in")

        visit new_property_path
        fill_in 'property[name]', with: "Maison de rêve"
        fill_in 'property[address]', with: "Azovè"
        fill_in 'property[description]', with: "A côté de la plage"
        click_on 'Create Property'
        expect(page).to have_content 'Maison de rêve'
      end
    end
  end
  
  describe 'Detailed display function' do
     context 'When transitioned to any property details screen' do
       it 'The content of the relevant property is displayed' do
        #   visit new_user_session_path
        #   fill_in "Login",	with: "doe@fil.com" 
        #   fill_in "Password",	with: "password" 
        #   click_on("Log in")
          property = FactoryBot.create(:property, name: 'Presidence', description: 'Villa propre', type_of_property: 'Villa', status: 'Vaccant', address: 'Cotonou', user_id: user.id )
          visit property_path(property.id)
          expect(page).to have_content 'Presidence'
       end
     end
  end

  context 'When propertys are arranged in descending order of creation date and time' do
    it 'New property is displayed at the top' do
    #   visit new_user_session_path
    #   fill_in "Login",	with: "doe@fil.com" 
    #   fill_in "Password",	with: "password" 
    #   click_on("Log in")
      FactoryBot.create(:property, name: 'Presidence', description: 'Villa propre', type_of_property: 'Villa', status: 'Vaccant', address: 'Cotonou', user_id: user.id )
      FactoryBot.create(:second_property, name: 'Erevan', description: 'Habitation de rêve', type_of_property: 'House', status: 'Occupied', address: 'Aplahoué', user_id: user.id )
      FactoryBot.create(:property, name: 'Elysée', description: 'Appartement moderne', type_of_property: 'Duplex', status: 'Vaccant', address: 'Parakou', user_id: user.id )
      visit properties_path
      properties = all('.property_row')
      expect(properties[0]).to have_content 'Elysée'
    end
  end

   #Les tests de l'étape 3
   describe 'Search function' do
    
    context 'If you do a fuzzy search by Name' do
      it "Filter by properties that include search keywords" do
        # visit new_user_session_path
        # fill_in "Login",	with: "doe@fil.com" 
        # fill_in "Password",	with: "password" 
        # click_on("Log in")
        FactoryBot.create(:property, name: 'Presidence', description: 'Villa propre', type_of_property: 'Villa', status: 'Vaccant', address: 'Cotonou', user_id: user.id )
        FactoryBot.create(:second_property, name: 'Erevan', description: 'Habitation de rêve', type_of_property: 'House', status: 'Occupied', address: 'Aplahoué', user_id: user.id )
        FactoryBot.create(:property, name: 'Elysée', description: 'Appartement moderne', type_of_property: 'Duplex', status: 'Vaccant', address: 'Parakou', user_id: user.id )  
        visit properties_path
        select 'Vaccant', from: 'Status'
        click_on 'Search'
        properties = all('.property_row')
        expect(properties[0]).to have_content 'Appartement moderne'
      end
    end
    context 'When you search for status' do
      it "Properties that exactly match the status are narrowed down" do
        # visit new_user_session_path
        # fill_in "Login",	with: "doe@fil.com" 
        # fill_in "Password",	with: "password" 
        # click_on("Log in")
        FactoryBot.create(:property, name: 'Presidence', description: 'Villa propre', type_of_property: 'Villa', status: 'Vaccant', address: 'Cotonou', user_id: user.id )
        FactoryBot.create(:second_property, name: 'Erevan', description: 'Habitation de rêve', type_of_property: 'House', status: 'Occupied', address: 'Aplahoué', user_id: user.id )
        FactoryBot.create(:property, name: 'Elysée', description: 'Appartement moderne', type_of_property: 'Duplex', status: 'Vaccant', address: 'Parakou', user_id: user.id )  
        visit properties_path
        select 'Villa', from: 'Type of property'
        click_on 'Search'
        properties = all('.type_of_property_row')
        properties.each do |property|
        expect(property).to have_content 'Villa'
        end
      end
    end
    context 'Name performing fuzzy search of name and status search' do
      it "Narrow down property that include search keywords in the Title and exactly match the status" do
        # visit new_user_session_path
        # fill_in "Login",	with: "doe@fil.com" 
        # fill_in "Password",	with: "password" 
        # click_on("Log in")
        FactoryBot.create(:property, name: 'Presidence', description: 'Villa propre', type_of_property: 'Villa', status: 'Vaccant', address: 'Cotonou', user_id: user.id )
        FactoryBot.create(:second_property, name: 'Erevan', description: 'Habitation de rêve', type_of_property: 'House', status: 'Occupied', address: 'Aplahoué', user_id: user.id )
        FactoryBot.create(:property, name: 'Elysée', description: 'Appartement moderne', type_of_property: 'Duplex', status: 'Vaccant', address: 'Parakou', user_id: user.id )  
        visit properties_path
        select 'Villa', from: 'Type of property'
        select 'Occupied', from: 'Status'
        click_on 'Search'
        expect(page).to have_content 'Villa'
        expect(page).to have_content 'Occupied'
      end
    end
  end
end