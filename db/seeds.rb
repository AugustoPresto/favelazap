# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'creating users...'
users = []

user1 = User.new(
  email: Faker::Internet.email,
  password: "abc123",
  reporter: "true",
  # first_name: "Felippe",
  # last_name: "Santana"
)
user1.save!

user2 = User.new(
  email: Faker::Internet.email,
  password: "abc123",
  reporter: "false",
  # first_name: "Augusto",
  # last_name: "Souza"
)
user2.save!

user3 = User.new(
  email: Faker::Internet.email,
  password: "abc123",
  reporter: "false",
  # first_name: "Pedro",
  # last_name: "Breischiodshisdhg"
)
user3.save!

user4 = User.new(
  email: Faker::Internet.email,
  password: "abc123",
  reporter: "false",
  # first_name: "Yuri",
  # last_name: "Gravatá"
)
user4.save!

users << user1
users << user2
users << user3
users << user4

puts 'creating articles...'
articles = []

article = Article.new(
  title: "1 beadrom in Ile-de-France",
  subtitle: "37-1 Passage du Ponceau, Paris, France",
  content: "Lovely article located in the heart of paris, walking distance form the Seine river",
  communities: ["Rocinha", "Vidigal"],
  interests: ["Sports", "Culture"]
)
article.user = users.sample
article.save!
articles << article

article = Article.new(
  title: "Apartment in front of the beach",
  subtitle: "Av. Vieira Souto, 366, Ipanema, Rio de Janeiro, Brazil",
  content: "Big apartment with panoramic view for the best urban beach in ther world. Come to have an unique experince",
  communities: ["Borel", "Macacos"],
  interests: ["Sports", "Finance"]
)
article.user = users.sample
article.save!
articles << article

article = Article.new(
  title: "Penthouse in Copacabana",
  subtitle: "Rodolfo Dantas 85, Rio de Janeiro, Brazil",
  content: "Modern and spacious 2 bedroom penthouse ideally located in Copacabana. This penthouse provides the perfect private retreat in which to relax yourself: stylish interior design, bright rooms and a large terrace with a swimming-pool.",
  communities: ["Antares", "Barbante", "Rola"],
  interests: ["Security"]
)
article.user = users.sample
article.save!
articles << article
