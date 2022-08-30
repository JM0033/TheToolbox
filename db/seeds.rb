# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Creating Users..."
@clemence = User.new(
  username: "clemence",
  email: "clemence@bike.com",
  password: "password",
  description: "This is me. I love strange bikes.",
  biker_status: "athletic",
  language: "french",
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
)
file = URI.open("https://avatars.githubusercontent.com/u/106547290?v=4")
@john.photo.attach(io: file, filename: "john.png", content_type: "image/png")
@john.save!

puts "User seeding successfull"
puts "Creating POIs..."

@eiffelTower = PointOfInterest.new(
  address: "Champ de Mars, 5 Av. Anatole France, 75007 Paris, France",
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

@campingArcEnCiel = PointOfInterest.new(
  address: "Les Mazes, 07150 Vallon-Pont-d'Arc",
  category: "Campsite",
  name: "Camping Arc en Ciel",
)
file = URI.open("https://res.cloudinary.com/dw5loa15q/image/upload/v1661864018/yqgnmzeq9hxf5vp9wjuu.jpg")
@campingArcEnCiel.photos.attach(io: file, filename: "campingArcEnCiel.png", content_type: "image/png")
@campingArcEnCiel.save!

@campingLangwiederSee = PointOfInterest.new(
  address: "Eschenrieder Str. 119, 81249 München, Allemagne",
  category: "Campsite",
  name: "Camping Langwieder See",
)
file = URI.open("https://res.cloudinary.com/dw5loa15q/image/upload/v1661864608/dlb37mmxg67uymvvwtvf.jpg")
@campingLangwiederSee.photos.attach(io: file, filename: "campingLangwiederSee.png", content_type: "image/png")
@campingLangwiederSee.save!

@roseBikeBerlin = PointOfInterest.new(
  address: "Lindenstraße 90, 10969 Berlin, Allemagne",
  category: "Bikeshop",
  name: "Rose bike Berlin",
)
file = URI.open("https://res.cloudinary.com/dw5loa15q/image/upload/v1661864819/gsekds0vhrtshkewb4jh.jpg")
@roseBikeBerlin.photos.attach(io: file, filename: "roseBikeBerlin.png", content_type: "image/png")
@roseBikeBerlin.save!

@laBiciAtelierVelo = PointOfInterest.new(
  address: "21 Rue Maracci, 59800 Lille",
  category: "Bikeshop",
  name: "La Bici Atelier Vélo",
)
file = URI.open("https://res.cloudinary.com/dw5loa15q/image/upload/v1661864950/f2fap4jdfrcxm9akeyth.jpg")
@laBiciAtelierVelo.photos.attach(io: file, filename: "laBiciAtelierVelo.png", content_type: "image/png")
@laBiciAtelierVelo.save!

puts "POIs seeding sucessfull"


puts "Seed completed!!"
