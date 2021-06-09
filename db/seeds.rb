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

photo1 = URI.open('http://www.nacaoz.com.br/2015/wp-content/uploads/2017/04/Manoel-Soares_abr17-600x598.jpg')
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
  communities: ["Borel", "Formiga"],
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
  communities: ["Juramento", "Macacos"],
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
  communities: ["Rocinha", "Vidigal"],
  interests: ["Health", "Security"]
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

article_photo1 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/06/07180704/2021-0706-projeto-atitude-social-faz-parceria-com-upp-depois-de-um-ano-fechada-VILMA-RIBEIRO-30-1536x1024.jpg')
article_photo2 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/06/01101758/2021-05-08-FAVELA-TENIS-SELMA-SOUZA-5-1536x1025.jpg')
article_photo3 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/05/19171606/188084263_4318836324828381_3177745573479970469_n-e1621457117903.jpg')


article = Article.new(
  title: "Projeto Social do Borel reinicia atividades.",
  subtitle: "Neste novo ciclo, policiais da UPP no Borel irão realizar atividades culturais.",
  content: "Após 5 anos sem qualquer convênio para auxiliar a continuidade das atividades, o projeto Atitude Social finalmente encontrou um parceiro para continuar com os trabalhos na comunidade do Borel: a UPP da comunidade. Os policiais da unidade de polícia da favela estarão atuando como professores dos projetos sociais, depois de mais de um ano sem atividades socioeducativas no espaço.",
  communities: ["Borel", "Formiga"],
  interests: ["Social", "Culture"]
)
article.user = users.sample
article.photo.attach(io: article_photo1, filename: 'article1.jpg', content_type: 'image/jpg')
article.save!
articles << article

article = Article.new(
  title: "Projeto “saca” valores do tênis.",
  subtitle: "Professores transformam perspectivas sociais de 55 jovens da comunidade",
  content: "Com o intenso barulho de bolinhas de tênis sendo frequentemente arremessadas por raquetes, a agitação de todas terças, quintas e sábados na Vila Olímpica do Complexo do Alemão, na Zona Norte do Rio de Janeiro, recebe a presença da inquietação de 55 jovens que participam do Favela Tênis & Cultura. Entre treinamentos e conversas com os professores, as crianças despertam para valores e metas que vão além da disputa dos sets de partidas: a percepção de que é possível quebrar barreiras sociais.",
  communities: ["Juramento", "Macacos"],
  interests: ["Sports", "Economy"]
)
article.user = users.sample
article.photo.attach(io: article_photo2, filename: 'article2.jpg', content_type: 'image/jpeg')
article.save!
articles << article

article = Article.new(
  title: "Vidigal recebe novos contêineres de lixo",
  subtitle: "Comlurb iniciou a distribuição em pontos estratégicos da comunidade.",
  content: "Dentro dos indicadores que apontam as melhorias nas condições de vida nas favelas cariocas, com certeza a coleta e o descarte correto de resíduos são umas das principais demandas. Visando aperfeiçoar esse serviço essencial de reciclagem, a Comlurb iniciou as instalações dos primeiros contêineres dos 27 novos que serão instalados na favela do Vidigal, na Zona Sul do Rio de Janeiro.",
  communities: ["Rocinha", "Vidigal"],
  interests: ["Health", "Security"]
)
article.user = users.sample
article.photo.attach(io: article_photo3, filename: 'article3.jpg', content_type: 'image/jpg')
article.save!
articles << article
