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
  encrypted_password: "password",
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
  encrypted_password: "password",
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
  encrypted_password: "password",
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
  encrypted_password: "password",
  description: "This is me. I love electrical bikes.",
  biker_status: "athletic",
  language: "french",
)
file = URI.open("https://avatars.githubusercontent.com/u/106547290?v=4")
@john.photo.attach(io: file, filename: "john.png", content_type: "image/png")
@john.save!
