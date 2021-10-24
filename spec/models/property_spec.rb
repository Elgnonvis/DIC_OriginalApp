#bundle exec rspec spec/models/property_spec.rb
#bundle exec rspec
require 'rails_helper'

RSpec.describe Property, type: :model do

  describe 'Validation test de Property' do
    context 'If the property Name is empty' do
      it "property registration must fail" do
        property = Property.new(name: '', description: 'Failure test')
        expect(property).not_to be_valid
      end
    end
    context 'If the property description is empty' do
      it 'Validation is caught' do
        property = Property.new(name: 'Presidence', description: '', type_of_property: 'Villa', status: 'Vaccant', address: 'Cotonou')
        property.valid?
        expect(property.errors[:description]).to include("can't be blank")
      end
    end
  end
    # context 'If the property name, description and address are described' do
    #   it 'Validation passes' do
    #     property = Property.new(name: 'Presidence', description: 'Villa propre', type_of_property: 'Villa', status: 'Vaccant', address: 'Azove')
    #     expect(property).to be_valid
    #   end
    # end
  describe 'Fonction de modèle des Properties' do
    context 'If the property name, description and address are described' do
      it 'Validation passes' do
        user = create :user
        user= User.last
        property = Property.new(name: 'Presidence', description: 'Villa propre', type_of_property: 'Villa', status: 'Vaccant', address: 'Azove', user_id: user.id)
        expect(property).to be_valid
      end
    end
  end
end
    # Step 3 tests
  # describe 'Search function' do
  #   before do
  #     user = create :user
  #     user= User.last
  #     @property = FactoryBot.create(:property, name: 'Presidence', description: 'Villa propre', type_of_property: 'Villa', status: 'Vaccant', address: 'Cotonou', user_id: user.id )
  #     @property = FactoryBot.create(:second_property, name: 'Erevan', description: 'Habitation de rêve', type_of_property: 'House', status: 'Occupied', address: 'Aplahoué', user_id: user.id )
  #   end
  #   #user= User.last
  #   #let!(:property) { FactoryBot.create(:property, name: 'Presidence', description: 'Villa propre', type_of_property: 'Villa', status: 'Vaccant', address: 'Cotonou', user_id: user.id ) }
  #   #let!(:second_property) { FactoryBot.create(:second_property, name: 'Erevan', description: 'Habitation de rêve', type_of_property: 'House', status: 'Occupied', address: 'Aplahoué', user_id: user.id ) }

  #   # You can change the contents of the test data as needed.
  #   context 'Type_of_property_search is performed by scope method' do
  #     it "property containing search keywords are narrowed down" do
  #       # title_seach is a Title search method presented by scope. The method name can be arbitrary.
  #       expect(@property.type_of_property_search('Villa')).to include(property)
  #       expect(@property.type_of_property_search('Villa')).not_to include(second_property)
  #       expect(@property.type_of_property_search('Villa').count).to eq 1
  #     end
  #   end
  #   context 'When the status is searched with the scope method' do
  #     it "property that exactly match the status are narrowed down" do
  #       expect(Property.status_search('Vaccant')).to include(property)
  #       expect(Property.status_search('Vaccant')).not_to include(second_property)
  #       expect(Property.status_search('Vaccant').count).to eq 1
  #     end
  #   end
  #   context 'When performing fuzzy search and status search Title' do
  #     it "Narrow down propertys that include search keywords in the Title and exactly match the status" do
  #       # Write content here
  #       expect(Property.type_of_property_search('property').status_search('In progress')).to include(property)
  #       expect(Property.type_of_property_search('property').status_search('In progress')).not_to include(second_property)
  #       expect(Property.type_of_property_search('property').status_search('In progress').count).to eq 1
        
  #     end
  #   end
  # end
# end