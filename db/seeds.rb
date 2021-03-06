
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
user = User.create(username: "Elgnonvis", email: "elgnonvis@gmail.com", password: "95862627", is_admin: true)
user = User.create(username: "Guest", email: "guest@gmail.com", password: "password", is_admin: false)
user = User.create(username: "Admin", email: "admin@gmail.com", password: "password", is_admin: true)


appointment = Appointment.create(description: "Visitez la maison de la plage", status: "High", user_id: User.first.id)
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

@property = Property.new
comment = Comment.new(content: 'Je suis le premier à commenter', user_id: User.last.id , property_id: @property.id)
comment = Comment.new(content: "Même après plusieurs années passées j'adore toujours cet appartement", user_id: User.first.id , property_id: @property.id)
comment = Comment.new(content: 'Excellent model de construction', user_id: User.last.id , property_id: @property.id)
comment = Comment.new(content: 'Une constration vraiment moderne', user_id: User.first.id , property_id: @property.id)
comment = Comment.new(content: 'Ouffff maison de rêve', user_id: User.last.id , property_id: @property.id)


# properties = Property.all

# properties.each do |property|
#     property.update(user_id: User.last.id) 
# end