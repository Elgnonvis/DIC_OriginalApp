#bundle exec rspec spec/models/property_spec.rb
require 'rails_helper'

RSpec.describe Property, type: :model do

  describe 'Validation test' do
    context 'If the property Name is empty' do
      it "property registration must fail" do
        property = Property.new(name: '', description: 'Failure test')
        expect(property).not_to be_valid
      end
    end
    context 'If the property description are empty' do
      it 'Validation is caught' do
        property = Property.new(name: 'Presidence', description: '', type_of_property: 'Villa', status: 'Vaccant', address: 'Cotonou')
        property.valid?
        expect(property.errors[:description]).to include("doit être rempli(e)")
      end
    end
    context 'If the property Title and description are described' do
      it 'Validation passes' do
        property = Property.new(name: 'Presidence', description: 'Villa propre', type_of_property: 'Villa', status: 'Vaccant', address: 'Azove')
      end
    end
    # Step 3 tests
    describe 'Search function' do
      before do
        user = create :user
        user= User.last
        let!(:property) { FactoryBot.create(:property, name: 'Presidence', description: 'Villa propre', type_of_property: 'Villa', status: 'Vaccant', address: 'Cotonou', user_id: user.id)}
        let!(:second_property) { FactoryBot.create(:second_property, name: "Erevan", description:'Habitation de rêve', type_of_property: 'House', status: 'Occupied', address: 'Aplahoué', user_id: user.id )}
      end
      # You can change the contents of the test data as needed.
      context 'Type pf property is performed by scope method' do
        it "propertys containing search keywords are narrowed down" do
          # title_seach is a Title search method presented by scope. The method name can be arbitrary.
          expect(Property.type_of_property_search('Villa')).to include(property)
          expect(Property.type_of_property_search('Villa')).not_to include(second_property)
          expect(Property.type_of_property_search('Villa').count).to eq 1
        end
      end
      context 'When the status is searched with the scope method' do
        it "property that exactly match the status are narrowed down" do
          expect(Property.status_search('Vaccant')).to include(property)
          expect(Property.status_search('Vaccant')).not_to include(second_property)
          expect(Property.status_search('Vaccant').count).to eq 1
        end
      end
      context 'When performing fuzzy search and status search Title' do
        it "Narrow down propertys that include search keywords in the Title and exactly match the status" do
          # Write content here
          expect(Property.type_of_property_search('property').status_search('In progress')).to include(property)
          expect(Property.type_of_property_search('property').status_search('In progress')).not_to include(second_property)
          expect(Property.type_of_property_search('property').status_search('In progress').count).to eq 1
          
        end
      end
    end
  end
end

