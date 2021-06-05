# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'uri'
OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
OpenURI::Buffer.const_set 'StringMax', 0

puts 'cleaning data base'
Article.destroy_all
User.destroy_all

puts 'creating users...'
users = []

photo1 = URI.open('https://cdns-images.dzcdn.net/images/artist/09c8996e80653668ca912208911ddcd4/264x264.jpg')
photo2 = URI.open('https://cdn.britannica.com/s:575x450/84/154784-004-BD0C145B.jpg')
photo3 = URI.open('https://audio.mgtradio.net/storage/artists/bebel%20gilberto-1.jpg')
photo4 = URI.open('https://studiosol-a.akamaihd.net/letras/215x215/fotos/3/1/4/f/314f5fc559418f77dfd4cc594176843f.jpg')

user1 = User.new(
  email: Faker::Internet.email,
  password: "abc123",
  reporter: "true",
  communities: ["Rocinha", "Vidigal"],
  interests: ["Sports", "Culture"]
  # first_name: "Felippe",
  # last_name: "Santana"
)
user1.avatar.attach(io: photo1, filename: 'thomas.jpg', content_type: 'image/jpg')
user1.save!

user2 = User.new(
  email: Faker::Internet.email,
  password: "abc123",
  reporter: "false",
  communities: ["Borel", "Macacos"],
  interests: ["Sports", "Economy"]
  # first_name: "Augusto",
  # last_name: "Souza"
)
user2.avatar.attach(io: photo2, filename: 'nina.jpg', content_type: 'image/jpg')
user2.save!

user3 = User.new(
  email: Faker::Internet.email,
  password: "abc123",
  reporter: "false",
  communities: ["Barbante", "Rola"],
  interests: ["Security"]
  # first_name: "Pedro",
  # last_name: "Breischiodshisdhg"
)
user3.avatar.attach(io: photo3, filename: 'bebel.jpg', content_type: 'image/jpg')
user3.save!

user4 = User.new(
  email: Faker::Internet.email,
  password: "abc123",
  reporter: "false",
  communities: ["Barbante", "Rola"],
  interests: ["Security"]
  # first_name: "Yuri",
  # last_name: "Gravatá"
)
user4.avatar.attach(io: photo4, filename: 'bernhoft.jpg', content_type: 'image/jpg')
user4.save!

users << user1
users << user2
users << user3
users << user4

puts 'creating articles...'
articles = []

article_photo1 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/05/28080934/bolo-de-feijoada-1024x634.jpg')
article_photo2 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/05/27130759/WhatsApp-Image-2021-05-27-at-09.31.49.jpeg')
article_photo3 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/05/25112323/187095605_311024940736375_2588461337489676035_n-e1621955306895-1024x878.jpg')


article = Article.new(
  title: "1 beadrom in Ile-de-France",
  subtitle: "37-1 Passage du Ponceau, Paris, France",
  content: "Lovely article located in the heart of paris, walking distance form the Seine river",
  communities: ["Rocinha", "Vidigal"],
  interests: ["Sports", "Culture"]
)
article.user = users.sample
article.photo.attach(io: article_photo1, filename: 'article1.jpg', content_type: 'image/jpg')
article.save!
articles << article

article = Article.new(
  title: "Apartment in front of the beach",
  subtitle: "Av. Vieira Souto, 366, Ipanema, Rio de Janeiro, Brazil",
  content: "Big apartment with panoramic view for the best urban beach in ther world. Come to have an unique experince",
  communities: ["Borel", "Macacos"],
  interests: ["Sports", "Economy"]
)
article.user = users.sample
article.photo.attach(io: article_photo2, filename: 'article2.jpg', content_type: 'image/jpeg')
article.save!
articles << article

article = Article.new(
  title: "Penthouse in Copacabana",
  subtitle: "Rodolfo Dantas 85, Rio de Janeiro, Brazil",
  content: "Modern and spacious 2 bedroom penthouse ideally located in Copacabana. This penthouse provides the perfect private retreat in which to relax yourself: stylish interior design, bright rooms and a large terrace with a swimming-pool.",
  communities: ["Barbante", "Rola"],
  interests: ["Security"]
)
article.user = users.sample
article.photo.attach(io: article_photo3, filename: 'article3.jpg', content_type: 'image/jpg')
article.save!
articles << article
