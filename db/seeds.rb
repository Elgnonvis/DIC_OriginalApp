# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#ge
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(username: "Elgnonvis", email: "elgnonvis@gmail.com", password: "95862627", is_admin: true)
# properties = Property.all

# properties.each do |property|
#     property.update(user_id: User.last.id) 
# end
require 'faker'
appointment = Appointment.create(description: "Visitez la maison de la plage", user_id: User.first.id)
appointment = Appointment.create(description: "Venir vous rencontrer pour discuter des possibilités d'achat à credit", status: "Low", user_id: User.last.id)
appointment = Appointment.create(description: "Les types de tontine pour l'achat de parcelle", status: "High", user_id: User.first.id)
appointment = Appointment.create(description: "Signez les papiers d'achat", status: "Medium", user_id: User.last.id)
appointment = Appointment.create(description: "Intégrer la maison X", status: "High", user_id: User.last.id)

type_of_property = ["House", "Duplex", "Office", "Villa", "Shop", "Studio"]
status = ["Occupied", "Vaccant"]   
(1..10).each do |x|
    User.create(username: Faker::Superhero.power, email: Faker::Internet.free_email, password: "password#{x}", is_admin: false)
    Property.create(name: Faker::Games::Pokemon.location, description: "description#{x}", address: Faker::Address.street_address, type_of_property: type_of_property.sample, status: status.sample, user_id: User.first.id ) 
end