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
Fact.destroy_all
Comment.destroy_all

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
  interests: ["Sports", "Economy"]
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
article_photo4 = URI.open('http://43.mostra.org/_img/_filmes/186.jpg')
article_photo5 = URI.open('https://www.vozdascomunidades.com.br/wp-content/uploads/2020/06/rafael-oliveira.jpeg')
article_photo6 = URI.open('https://www.hojeemdia.com.br/polopoly_fs/1.449419.1488398402!/image/image.jpg_gen/derivatives/landscape_653/image.jpg')
article_photo7 = URI.open('https://veja.abril.com.br/wp-content/uploads/2018/08/vista-aecc81rea-de-paraisocc81polis-na-vila-andrade-ao-lado-do-bairro-do-morumbi.jpg?quality=70&strip=info&resize=680,453')
article_photo8 = URI.open('https://veja.abril.com.br/wp-content/uploads/2021/06/DOM-08.jpg.jpg?quality=70&strip=info&resize=680,453')
article_photo9 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/06/04140528/E3DLTFoXIAEGA65.jpeg')

article = Article.new(
  title: "Projeto Social do Borel reinicia atividades.",
  subtitle: "Neste novo ciclo, policiais da UPP no Borel irão realizar atividades culturais.",
  content: "Após 5 anos sem qualquer convênio para auxiliar a continuidade das atividades, o projeto Atitude Social finalmente encontrou um parceiro para continuar com os trabalhos na comunidade do Borel: a UPP da comunidade. Os policiais da unidade de polícia da favela estarão atuando como professores dos projetos sociais, depois de mais de um ano sem atividades socioeducativas no espaço.",
  communities: ["Borel", "Formiga"],
  interests: ["Sports", "Economy"]
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

article = Article.new(
  title: "Atleta da Rocinha cria vaquinha para jogar em Portugal",
  subtitle: "Os testes estão marcados para o mês de setembro e a vaquinha busca arrecadar 20 mil reais",
  content: "Que menino nunca sonhou em ser jogador de futebol profissional? E quando se é cria de favela se intensifica ainda mais, porque a chance de viver esse sonho e poder modificar sua vida e a da família acaba sendo uma motivação extra. O zagueiro do time amador de Fut 7, Quase Nada F.C., Matheus Nattan dos Santos, de 19 anos, morador da Nova Brasília no Complexo do Alemão, é um dos tantos que estão correndo atrás desse sonho. Há um ano jogando pelo time, Matheus recebeu no dia 10 de junho a chance de fazer avaliações por uma semana na cidade de Chaves, no distrito de Vila Real, norte de Portugal, e poder tentar a carreira profissional no futebol português. Contudo, os custos da viagem são altos, e o atleta decidiu criar uma vaquinha online para ter condições de viajar. Você pode contribuir clicando aqui.",
  communities: ["Rocinha", "Vidigal"],
  interests: ["Health", "Security"]
)
article.user = users.sample
article.photo.attach(io: article_photo4, filename: 'article4.jpg', content_type: 'image/jpg')
article.save!
articles << article

article = Article.new(
  title: "Jovem de 23 anos cria projeto social ‘Favela Vertical’.",
  subtitle: "Rafael Capivara leva cultura, educação e assistência à comunidade",
  content: "Rafael conta que o coletivo surgiu em agosto de 2019, junto com a construção da sua formação como produtor pela ESPM e Museu de Arte do Rio. “Sempre entendi que minha favela precisava de um espaço plural, múltiplo de ideias e que repensasse como o nosso território pode se desenvolver. Entendendo desde o começo, como e o por que estávamos paralisados no desenvolvimento comunitário em comparação à outras comunidades por causa da força política imposta para nós desde o surgimento da comunidade, tentei produzir um organismo que pudesse ultrapassar e viver em conjunto a isso. E foi pensando nisso que pensei num espaço de cursos, oficinas e construção que fornecesse educação comunitária, cultura de território e geração de renda.”",
  communities: ["Borel", "Formiga"],
  interests: ["Sports", "Economy"]
)
article.user = users.sample
article.photo.attach(io: article_photo5, filename: 'article5.jpg', content_type: 'image/jpg')
article.save!
articles << article

article = Article.new(
  title: "Incêndio atinge Morro do Juramento.",
  subtitle: "O Corpo de Bombeiros do Rio foi acionado para uma ocorrência de incêndio em Vicente de Carvalho",
  content: "Duas viaturas do Quartel de Ramos já foram enviadas ao local. O atendimento na área, no entanto, é considerado difícil. Ainda não há maiores informações sobre a causa e o impacto do incêndio.",
  communities: ["Juramento", "Macacos"],
  interests: ["Sports", "Economy"]
)
article.user = users.sample
article.photo.attach(io: article_photo6, filename: 'article6.jpg', content_type: 'image/jpg')
article.save!
articles << article

article = Article.new(
  title: "Cufa lança ‘Ajudar Tá No Sangue’.",
  subtitle: "Mobilização quer atingir cinco mil favelas de todo o país.",
  content: "A Central Única das Favelas (Cufa) lança nesta segunda-feira uma campanha nacional de doação de sangue. A ideia é, segundo os organizadores, mostrar para a sociedade o potencial solidário da favela.",
  communities: ["Juramento", "Macacos", "Rocinha", "Vidigal", "Borel", "Formiga"],
  interests: ["Sports", "Economy", "Culture", "Health", "Social", "Security"]
)
article.user = users.sample
article.photo.attach(io: article_photo7, filename: 'article7.jpg', content_type: 'image/jpg')
article.save!
articles << article

article = Article.new(
  title: "‘Dom’, no Amazon Prime, playboy que virou bandido.",
  subtitle: "Caso real de um jovem carioca de classe média é recontado na grande aposta nacional de streaming.",
  content: "Bem-vestido, olhos azuis, carro de luxo e com uma loira estonteante a tiracolo, Pedro Dom é um rapaz acima de qualquer suspeita aos olhos dos seguranças e porteiros da abastada Zona Sul carioca.Munido de informações privilegiadas sobre moradores ausentes, ele entra pela porta da frente em mansões e apartamentos luxuosos, onde seu “bonde”, escondido no veículo, faz a limpa levando joias, dólares e até uma coleirinha de cachorro cravejada de brilhantes.",
  communities: ["Juramento", "Macacos", "Rocinha", "Vidigal", "Borel", "Formiga"],
  interests: ["Sports", "Economy", "Culture", "Health", "Social", "Security"]
)
article.user = users.sample
article.photo.attach(io: article_photo8, filename: 'article8.jpg', content_type: 'image/jpg')
article.save!
articles << article

article = Article.new(
  title: "Iza exalta a periferia em ‘Gueto’, clipe gravado na Igreja da Penha.",
  subtitle: "Mãe da cantora sobe de joelhos a Basílica em cena emocionante.",
  content: "Cria de Olaria, Zona Norte do Rio, a cantora e compositora Iza está de volta! Lançado hoje (04) com uma videografia impecável, tendo como cenário da Igreja da Penha, o clip ‘Gueto’ faz parte do seu próximo álbum que destaca o subúrbio carioca e tem previsão de estreia para o 2º semestre. A identidade de Iza marca o hit, que conta com cenas gravadas no bairro onde a cantora cresceu. Além da coreografia marcante, cores vibrantes e participação de ritmistas da escola de samba Imperatriz Leopoldinense, a cena em que Isabel Cristina Lima, mãe da cantora, sobe a escadaria da Basílica Santuário de Nossa Senhora da Penha de França, é um dos destaques do filme. A composição de “Gueto” é de IZA, Pablo Bispo, Ruxell e Sérgio Santos, que também produziram o clip, que foi gravado, mixado e masterizado no Pancadão Estúdio.",
  communities: ["Juramento", "Macacos", "Rocinha", "Vidigal", "Borel", "Formiga"],
  interests: ["Sports", "Economy", "Culture", "Health", "Social", "Security"]
)
article.user = users.sample
article.photo.attach(io: article_photo9, filename: 'article9.jpg', content_type: 'image/jpg')
article.save!
articles << article

puts 'creating facts...'
facts = []

fact_photo1 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/05/06105341/WhatsApp-Image-2021-05-06-at-10.50.03.jpeg')
fact_photo2 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/06/08204152/atualizaodocovidnasfavelas-08-06-2021.png')

fact = Fact.new(
  title: "Polícia continua com operações, mesmo com suspensão do STF.",
  communities: ["Juramento", "Macacos", "Rocinha", "Vidigal", "Borel", "Formiga"],
  interests: ["Sports", "Economy", "Culture", "Health", "Social", "Security"]
)
fact.user = users.sample
fact.photo.attach(io: fact_photo1, filename: 'fact1.jpg', content_type: 'image/jpg')
fact.save!
facts << fact

fact = Fact.new(
  title: "Favelas registram 2 novos casos de Covid-19 em 24h.",
  communities: ["Juramento", "Macacos", "Rocinha", "Vidigal", "Borel", "Formiga"],
  interests: ["Sports", "Economy", "Culture", "Health", "Social", "Security"]
)
fact.user = users.sample
fact.photo.attach(io: fact_photo2, filename: 'fact2.jpg', content_type: 'image/jpg')
fact.save!
facts << fact

puts 'creating comments...'

comment = Comment.new(
  content: "Congratulations, bringing dignity to families who are experiencing difficulties"
)
comment.user = users.sample
comment.article = articles.sample
comment.save!

comment = Comment.new(
  content: "I think these initiatives are very important. I would love if it came to us that we have a project with 230 children here at Granja Lisboa"
)
comment.user = users.sample
comment.article = articles.sample
comment.save!

comment = Comment.new(
  content: "God bless the people who are doing this always."
)
comment.user = users.sample
comment.article = articles.sample
comment.save!

comment = Comment.new(
  content: "Let's go that still has a lot of work"
)
comment.user = users.sample
comment.article = articles.sample
comment.save!

comment = Comment.new(
  content: "Thanks a lot 👏👏👏👏👏 congratulations, your work is very special"
)
comment.user = users.sample
comment.article = articles.sample
comment.save!

comment = Comment.new(
  content: "I wish this kind of work could reach more people!"
)
comment.user = users.sample
comment.article = articles.sample
comment.save!

comment = Comment.new(
  content: "I thank you for the incredible work you do, FavelaZap"
)
comment.user = users.sample
comment.article = articles.sample
comment.save!

comment = Comment.new(
  content: "Proactiveness of people who really know the communities and are together in actions like this"
)
comment.user = users.sample
comment.article = articles.sample
comment.save!

comment = Comment.new(
  content: "❤️❤️"
)
comment.user = users.sample
comment.article = articles.sample
comment.save!

comment = Comment.new(
  content: "God bless each one for all the good you have done for us😍😍🙌"
)
comment.user = users.sample
comment.article = articles.sample
comment.save!

comment = Comment.new(
  content: "A big hug from Nova Brasília, Rio! Thank you, people!"
)
comment.user = users.sample
comment.article = articles.sample
comment.save!

comment = Comment.new(
  content: "Congratulations on the excellent social work, gratitude to the supporters of FavelaZap"
)
comment.user = users.sample
comment.article = articles.sample
comment.save!

comment = Comment.new(
  content: "How do I apply to participate?"
)
comment.user = users.sample
comment.article = articles.sample
comment.save!

comment = Comment.new(
  content: "Hello, good afternoon, I want to thank cufa brasil for your beautiful work that you do for all of us, my name and Ana Flávia, I'm from 5 marias, and our representative here is fernanda domingos 👏👏👏"
)
comment.user = users.sample
comment.article = articles.sample
comment.save!

comment = Comment.new(
  content: "Please do another action like this here in Chatuba de Mesquita RJ"
)
comment.user = users.sample
comment.article = articles.sample
comment.save!

comment = Comment.new(
  content: "You are 10,000! #mothers from the slums brick sepetiba"
)
comment.user = users.sample
comment.article = articles.sample
comment.save!

comment = Comment.new(
  content: "That's amazing. Thanks everybody who helps us"
)
comment.user = users.sample
comment.article = articles.sample
comment.save!

comment = Comment.new(
  content: "Wow, I even got goosebumps! Congratulations Come to Grajaú São Paulo"
)
comment.user = users.sample
comment.article = articles.sample
comment.save!
