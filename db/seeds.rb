# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

puts "Destroying old POIs..."
PointOfInterest.destroy_all
puts "Destroying old POIs completed."

puts "Destroying old datas..."

Answer.destroy_all
Question.destroy_all
Chatroom.destroy_all
Message.destroy_all
User.destroy_all

# ----------------------------Users------------------------------------------

puts "Creating Users..."
@clemence = User.new(
  username: "clemence",
  email: "clemence@bike.com",
  password: "password",
  description: "This is me. I love strange bikes.",
  biker_status: "athletic",
  language: "french",
  bike_model: "Fixie bike upgraded",
  longitude: 48.94543121749874,
  latitude: 2.3937720810502228
)
file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1657467718/epx2yy70xnkquezsx57y.jpg")
@clemence.photo.attach(io: file, filename: "clemence.png", content_type: "image/png")
@clemence.save!

@jeremy = User.new(
  username: "jeremy",
  email: "jeremy@bike.com",
  password: "password",
  description: "This is me. I love bikes",
  biker_status: "pro",
  language: "french",
  bike_model: "Supercycle bike",
  longitude: 48.91967485073182,
  latitude: 2.2858232096292452
)
file = URI.open("https://avatars.githubusercontent.com/u/108180668?v=4")
@jeremy.photo.attach(io: file, filename: "jeremy.png", content_type: "image/png")
@jeremy.save!

@jeannoel = User.new(
  username: "jeannoel",
  email: "jeannoel@bike.com",
  password: "password",
  description: "This is me. I love fast bikes.",
  biker_status: "untrained",
  language: "french",
  bike_model: "Electrical Velib",
  longitude: 48.90501333885613,
  latitude: 2.3647785906853436
)
file = URI.open("https://avatars.githubusercontent.com/u/100160246?v=4")
@jeannoel.photo.attach(io: file, filename: "jeannoel.png", content_type: "image/png")
@jeannoel.save!

@john = User.new(
  username: "john",
  email: "john@bike.com",
  password: "password",
  description: "This is me. I love electrical bikes.",
  biker_status: "athletic",
  language: "french",
  bike_model: "Race bicycle",
  longitude: 48.95226546436605,
  latitude: 2.3590809492289466
)
file = URI.open("https://avatars.githubusercontent.com/u/106547290?v=4")
@john.photo.attach(io: file, filename: "john.png", content_type: "image/png")
@john.save!


#--------------------------Chatrooms-------------------------------

User.excluding(@jeremy).each do |user|
  Chatroom.create!(first_user: @jeremy, second_user: user)
  puts "Chatroom for #{@jeremy.username} & #{user.username} created"
end


#--------------------------POIs-------------------------------

puts "Creating POIs..."

@eiffelTower = PointOfInterest.new(
  address: "5 Avenue Anatole France, 75007 Paris, France",
  category: "Tourism",
  name: "Eiffel Tower",
)
file = URI.open("https://res.cloudinary.com/dw5loa15q/image/upload/v1661862883/w5n9qkuavzytnvex1q3h.jpg")
@eiffelTower.photos.attach(io: file, filename: "EiffelTower.png", content_type: "image/png")
@eiffelTower.save!

@towerOfLondon = PointOfInterest.new(
  address: "London EC3N 4AB",
  category: "Tourism",
  name: "Tower of London",
)
file = URI.open("https://res.cloudinary.com/dw5loa15q/image/upload/v1661863433/i3vug1vpu9z6yhbplg1a.jpg")
@towerOfLondon.photos.attach(io: file, filename: "towerOfLondon.png", content_type: "image/png")
@towerOfLondon.save!

@stadeDeFrance = PointOfInterest.new(
  address: "Rue de la Couture Saint-Quentin, 93200 Saint-Denis",
  category: "Tourism",
  name: "Stade de France",
)
file = URI.open("https://res.cloudinary.com/dw5loa15q/image/upload/v1661863433/i3vug1vpu9z6yhbplg1a.jpg")
@stadeDeFrance.photos.attach(io: file, filename: "towerOfLondon.png", content_type: "image/png")
@stadeDeFrance.save!

@basiliqueStDenis = PointOfInterest.new(
  address: "1 Rue de la Légion d'Honneur, 93200 Saint-Denis",
  category: "Tourism",
  name: "Basilique de St Denis",
)
file = URI.open("https://res.cloudinary.com/dw5loa15q/image/upload/v1661863433/i3vug1vpu9z6yhbplg1a.jpg")
@basiliqueStDenis.photos.attach(io: file, filename: "towerOfLondon.png", content_type: "image/png")
@basiliqueStDenis.save!

@campingArcEnCiel = PointOfInterest.new(
  address: "Les Mazes, 07150 Vallon-Pont-d'Arc",
  category: "Campsite",
  name: "Camping Arc en Ciel",
)
file = URI.open("https://res.cloudinary.com/dw5loa15q/image/upload/v1661864018/yqgnmzeq9hxf5vp9wjuu.jpg")
@campingArcEnCiel.photos.attach(io: file, filename: "campingArcEnCiel.png", content_type: "image/png")
@campingArcEnCiel.save!

@velodrome = PointOfInterest.new(
  address: "11 Villa du Sud, 93380 Pierrefitte-sur-Seine, France",
  category: "Campsite",
  name: "Best wild camping ever!",
)
file = URI.open("https://res.cloudinary.com/dw5loa15q/image/upload/v1661864608/dlb37mmxg67uymvvwtvf.jpg")
@velodrome.photos.attach(io: file, filename: "campingArcEnCiel.png", content_type: "image/png")
@velodrome.save!

@espaceAngelaDavis = PointOfInterest.new(
  address: "1 Rue Jack London, 93240 Stains, France",
  category: "Campsite",
  name: "Hidden camping spot next to the lake",
)
file = URI.open("https://res.cloudinary.com/dw5loa15q/image/upload/v1661864608/dlb37mmxg67uymvvwtvf.jpg")
@espaceAngelaDavis.photos.attach(io: file, filename: "campingArcEnCiel.png", content_type: "image/png")
@espaceAngelaDavis.save!

# @roseBikeBerlin = PointOfInterest.new(
#   address: "Lindenstraße 90, 10969 Berlin, Allemagne",
#   category: "Bikeshop",
#   name: "Rose bike Berlin",
# )
# file = URI.open("https://res.cloudinary.com/dw5loa15q/image/upload/v1661864819/gsekds0vhrtshkewb4jh.jpg")
# @roseBikeBerlin.photos.attach(io: file, filename: "roseBikeBerlin.png", content_type: "image/png")
# @roseBikeBerlin.save!

# @laBiciAtelierVelo = PointOfInterest.new(
#   address: "21 Rue Maracci, 59800 Lille",
#   category: "Bikeshop",
#   name: "La Bici Atelier Vélo",
# )
# file = URI.open("https://res.cloudinary.com/dw5loa15q/image/upload/v1661864950/f2fap4jdfrcxm9akeyth.jpg")
# @laBiciAtelierVelo.photos.attach(io: file, filename: "laBiciAtelierVelo.png", content_type: "image/png")
# @laBiciAtelierVelo.save!

@bicyclo = PointOfInterest.new(
  address: "120 Rue Gabriel Péri, 93200 Saint-Denis",
  category: "Bikeshop",
  name: "Bicyclo - closed on Fridays",
)
file = URI.open("https://res.cloudinary.com/dw5loa15q/image/upload/v1661864950/f2fap4jdfrcxm9akeyth.jpg")
@bicyclo.photos.attach(io: file, filename: "laBiciAtelierVelo.png", content_type: "image/png")
@bicyclo.save!

@b6klette = PointOfInterest.new(
  address: "10 Quai de Seine, 93200 Saint-Denis",
  category: "Bikeshop",
  name: "b6klette",
)
file = URI.open("https://res.cloudinary.com/dw5loa15q/image/upload/v1661864950/f2fap4jdfrcxm9akeyth.jpg")
@b6klette.photos.attach(io: file, filename: "laBiciAtelierVelo.png", content_type: "image/png")
@b6klette.save!

@bikinnov = PointOfInterest.new(
  address: "13 Rue de Verdun, 93450 L'Île-Saint-Denis",
  category: "Bikeshop",
  name: "bikinnov",
)
file = URI.open("https://res.cloudinary.com/dw5loa15q/image/upload/v1661864950/f2fap4jdfrcxm9akeyth.jpg")
@bikinnov.photos.attach(io: file, filename: "laBiciAtelierVelo.png", content_type: "image/png")
@bikinnov.save!



puts "POIs seeding sucessfull"

puts "Seed is complete"
