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
photo5 = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Gilberto_Gil_1719MC198.jpg/1200px-Gilberto_Gil_1719MC198.jpg')
photo6 = URI.open('https://miro.medium.com/max/400/1*JryFlqhfUj8Vi8flwudC2w.jpeg')
photo7 = URI.open('https://citacoes.in/media/authors/john-coltrane.jpeg')
photo8 = URI.open('https://cdns-images.dzcdn.net/images/artist/ee783d910ee783b068806153d026a230/264x264.jpg')

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

user5 = User.new(
  email: Faker::Internet.email,
  password: "abc123",
  reporter: "false",
  communities: ["Rocinha", "Vidigal"],
  interests: ["Health", "Security"]
  # first_name: "Yuri",
  # last_name: "Gravatá"
)
user5.avatar.attach(io: photo5, filename: 'gil.jpg', content_type: 'image/jpg')
user5.save!

user6 = User.new(
  email: Faker::Internet.email,
  password: "abc123",
  reporter: "false",
  communities: ["Rocinha", "Vidigal"],
  interests: ["Health", "Security"]
  # first_name: "Yuri",
  # last_name: "Gravatá"
)
user6.avatar.attach(io: photo6, filename: 'liniker.jpg', content_type: 'image/jpg')
user6.save!

user7 = User.new(
  email: Faker::Internet.email,
  password: "abc123",
  reporter: "false",
  communities: ["Rocinha", "Vidigal"],
  interests: ["Health", "Security"]
  # first_name: "Yuri",
  # last_name: "Gravatá"
)
user7.avatar.attach(io: photo7, filename: 'coltrane.jpg', content_type: 'image/jpeg')
user7.save!

user8 = User.new(
  email: Faker::Internet.email,
  password: "abc123",
  reporter: "false",
  communities: ["Rocinha", "Vidigal"],
  interests: ["Health", "Security"]
  # first_name: "Yuri",
  # last_name: "Gravatá"
)
user8.avatar.attach(io: photo8, filename: 'sevana.jpg', content_type: 'image/jpg')
user8.save!

users << user1
users << user2
users << user3
users << user4
users << user5
users << user6
users << user7
users << user8

puts 'creating articles...'
articles = []

article_photo1 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/06/07180704/2021-0706-projeto-atitude-social-faz-parceria-com-upp-depois-de-um-ano-fechada-VILMA-RIBEIRO-30-1536x1024.jpg')
article_photo2 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/06/01101758/2021-05-08-FAVELA-TENIS-SELMA-SOUZA-5-1536x1025.jpg')
article_photo3 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/05/19171606/188084263_4318836324828381_3177745573479970469_n-e1621457117903.jpg')
article_photo4 = URI.open('http://43.mostra.org/_img/_filmes/186.jpg')
article_photo5 = URI.open('https://www.vozdascomunidades.com.br/wp-content/uploads/2020/06/rafael-oliveira.jpeg')
article_photo6 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/03/10160213/Vacina-Covid19-Coranavirus-.jpg234-scaled-1-1.jpg')
article_photo7 = URI.open('https://images.unsplash.com/photo-1565807511924-ba5ec83f2e09?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib')
article_photo8 = URI.open('https://veja.abril.com.br/wp-content/uploads/2021/06/DOM-08.jpg.jpg?quality=70&strip=info&resize=680,453')
article_photo9 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/06/04140528/E3DLTFoXIAEGA65.jpeg')
article_photo10 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/05/13102443/ARY-BARROSO.png')
article_photo11 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/05/12104254/WhatsApp-Image-2021-05-12-at-10.19.10.jpeg')
article_photo12 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/05/10115234/2021-07-05barbearia-do-DICK-VILMA-RIBEIRO-6-2048x1365.jpg')
article_photo13 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/04/30165446/WhatsApp-Image-2021-04-30-at-16.51.15-e1619814155291.jpeg')
article_photo14 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/04/29155657/WhatsApp-Image-2021-04-29-at-13.31.11.jpeg')
article_photo15 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/04/28125902/xLuis-fernando-Rego-bailarino-complexo-do-alemao-bolshoi-01.jpg.pagespeed.ic_.iwE4K8-Jmu.jpg')
article_photo16 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/05/26124342/Espaco-Comunal-Escolas-de-MCs.jpg')
article_photo17 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/04/11115544/IMG_9695-e1621014113310.jpg')
article_photo18 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/05/14104314/Acao-na-Mare-do-Assim-Saude.jpg')
article_photo19 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/06/15094836/Yoga-Vidigal.jpeg')
article_photo20 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/06/07185613/190826119_6372859429406843_2704967585816305195_n.jpg')

article = Article.new(
  title: "Borel Social Project restarts activities",
  subtitle: "In this new cycle, UPP officers in Borel will carry out cultural activities",
  content: "After 5 years without any agreement to help the continuity of activities, the Social Attitude project finally found a partner to continue its work in the Borel community: the community's UPP. Police officers from the favela's police unit will be acting as teachers of social projects, after more than a year without socio-educational activities in the space.",
  communities: ["Borel", "Formiga"],
  interests: ["Sports", "Economy"]
)
article.user = users.sample
article.photo.attach(io: article_photo1, filename: 'article1.jpg', content_type: 'image/jpg')
article.save!
articles << article

article = Article.new(
  title: "Project unveils values of tennis at Alemão",
  subtitle: "Teachers transform the social perspectives of 55 young people in the community",
  content: "With the intense noise of tennis balls being frequently thrown by rackets, the agitation of every Tuesday, Thursday and Saturday in the Olympic Village of Complexo do Alemão, in the North Zone of Rio de Janeiro, receives the presence of the restlessness of 55 young people who participate in the Favela Tennis & Culture. Between training sessions and conversations with the teachers, the children awaken to values and goals that go beyond the dispute of game sets: the perception that it is possible to break down social barriers.",
  communities: ["Juramento", "Macacos"],
  interests: ["Sports", "Economy"]
)
article.user = users.sample
article.photo.attach(io: article_photo2, filename: 'article2.jpg', content_type: 'image/jpeg')
article.save!
articles << article

article = Article.new(
  title: "Vidigal receives new garbage containers",
  subtitle: "Comlurb started distribution at strategic points in the community",
  content: "Among the indicators that point to improvements in living conditions in Rio's favelas, the collection and correct disposal of waste are certainly one of the main demands. Aiming to improve this essential recycling service, Comlurb started the installation of the first containers of the 27 new ones that will be installed in the Vidigal favela, in the South Zone of Rio de Janeiro.",
  communities: ["Rocinha", "Vidigal"],
  interests: ["Health", "Security"]
)
article.user = users.sample
article.photo.attach(io: article_photo3, filename: 'article3.jpg', content_type: 'image/jpg')
article.save!
articles << article

article = Article.new(
  title: "Athlete from Rocinha raises a kitty to play in Portugal",
  subtitle: "The crowdfunding seeks to raise 20 thousand reais",
  content: "What boy has never dreamed of being a professional football player? And when you are a slum child, it intensifies even more, because the chance to live that dream and be able to change your life and that of your family turns out to be an extra motivation. The defender of the Fut 7 amateur team, Almost Nothing F.C., Matheus Nattan dos Santos, 19, resident of Nova Brasília in Complexo do Alemão, is one of the many who are chasing this dream. Having played for the team for a year, Matheus received on June 10th the chance to do assessments for a week in the city of Chaves, in the district of Vila Real, in northern Portugal, and be able to pursue a professional career in Portuguese football. However, travel costs are high, and the athlete decided to create an online kitty to be able to travel. You can contribute by clicking here.",
  communities: ["Rocinha", "Vidigal"],
  interests: ["Health", "Security"]
)
article.user = users.sample
article.photo.attach(io: article_photo4, filename: 'article4.jpg', content_type: 'image/jpg')
article.save!
articles << article

article = Article.new(
  title: "23-year-old young man creates social project 'Favela Vertical'.",
  subtitle: "Rafael Capivara brings culture, education and assistance to communities in Tijuca",
  content: "Rafael says that the collective emerged in August 2019, along with the construction of his training as a producer by ESPM and the Rio Art Museum. “I always understood that my favela needed a plural space, multiple of ideas and that could rethink like ours. territory can develop. Understanding from the beginning how and why we were stuck in community development compared to other communities because of the political force imposed on us since the emergence of community, I tried to produce an organism that could go beyond and live together with it. And it was with this in mind that I thought of a space for courses, workshops and construction that would provide community education, territorial culture and income generation.”",
  communities: ["Borel", "Formiga"],
  interests: ["Sports", "Economy"]
)
article.user = users.sample
article.photo.attach(io: article_photo5, filename: 'article5.jpg', content_type: 'image/jpg')
article.save!
articles << article

article = Article.new(
  title: "Check the Covid-19 vaccination schedule for the week of June 14-19",
  subtitle: "General public, from 53 to 50 years old, will be vaccinated, and Higher Education professionals",
  content: "With the arrival of more vaccines in the city of Rio de Janeiro, the vaccination schedule is suffering advances. Last Wednesday (09) the Municipal Health Department announced once again the acceleration of the immunization schedule against Covid-19. From next Monday (14) until Friday (19), people aged 53 to 50 will be vaccinated, in a staggered way, by age.
  It is important to note that on Wednesday, June 16, the day is dedicated to workers in Higher Education Education, both from public and private institutions in the city of Rio. be contemplated.",
  communities: ["Juramento", "Macacos"],
  interests: ["Sports", "Economy"]
)
article.user = users.sample
article.photo.attach(io: article_photo6, filename: 'article6.jpg', content_type: 'image/jpg')
article.save!
articles << article

article = Article.new(
  title: "Cufa launches ‘Ajudar Tá No Sangue’",
  subtitle: "Mobilization wants to reach 5,000 slums across the country",
  content: "This Monday, the Central Única das Favelas (Cufa) launches a national blood donation campaign. The idea is, according to the organizers, to show society the solidarity potential of the favela.",
  communities: ["Juramento", "Macacos", "Rocinha", "Vidigal", "Borel", "Formiga"],
  interests: ["Sports", "Economy", "Culture", "Health", "Social", "Security"]
)
article.user = users.sample
article.photo.attach(io: article_photo7, filename: 'article7.jpg', content_type: 'image/jpg')
article.save!
articles << article

article = Article.new(
  title: "‘Dom’, on Amazon Prime, playboy turned outlaw",
  subtitle: "Real case of a young middle-class carioca is recounted on streaming",
  content: "Well-dressed, blue eyes, luxury car and with a stunning blonde in tow, Pedro Dom is a young man above suspicion in the eyes of security guards and doormen in the wealthy South Zone of Rio. front door in luxury mansions and apartments, where his “tram”, hidden in the vehicle, cleans up with jewelry, dollars and even a dog collar studded with diamonds.",
  communities: ["Juramento", "Macacos", "Rocinha", "Vidigal", "Borel", "Formiga"],
  interests: ["Sports", "Economy", "Culture", "Health", "Social", "Security"]
)
article.user = users.sample
article.photo.attach(io: article_photo8, filename: 'article8.jpg', content_type: 'image/jpg')
article.save!
articles << article

article = Article.new(
  title: "Iza exalts the periphery in ‘Gheto’, a clip recorded in the Igreja da Penha",
  subtitle: "The singer's mother goes up on her knees to the Basilica in an emotional scene",
  content: "Born in Pottery, North Zone of Rio, singer and songwriter Iza is back! Released today (04) with an impeccable videography, with the backdrop of Igreja da Penha, the clip ‘Gueto’ is part of his next album that highlights the Rio suburbs and is scheduled to premiere in the 2nd semester. Iza's identity marks the hit, which features scenes recorded in the neighborhood where the singer grew up. In addition to the striking choreography, vibrant colors and the participation of percussionists from the Imperatriz Leopoldinense samba school, the scene in which Isabel Cristina Lima, the singer's mother, climbs the steps of the Sanctuary Basilica of Nossa Senhora da Penha de França, is one of the highlights of the film . The composition of “Gueto” is by IZA, Pablo Bispo, Ruxell and Sérgio Santos, who also produced the clip, which was recorded, mixed and mastered at Pancadão Estúdio.",
  communities: ["Juramento", "Macacos", "Rocinha", "Vidigal", "Borel", "Formiga"],
  interests: ["Sports", "Economy", "Culture", "Health", "Social", "Security"]
)
article.user = users.sample
article.photo.attach(io: article_photo9, filename: 'article9.jpg', content_type: 'image/jpg')
article.save!
articles << article

article = Article.new(
  title: "Abandoned for 10 years, residents of Penha fight for the revitalization of park",
  subtitle: "In search of a solution, local activists went to court",
  content: "An environment that offered fun and leisure is currently abandoned. The Ary Barroso Park, in Penha, North Zone of Rio, has suffered from neglect for over 10 years. Residents and local leaders joined together and demanded the revitalization of the park. In search of a solution, activists went to court.",
  communities: ["Juramento", "Macacos", "Rocinha", "Vidigal", "Borel", "Formiga"],
  interests: ["Sports", "Economy", "Culture", "Health", "Social", "Security"]
)
article.user = users.sample
article.photo.attach(io: article_photo10, filename: 'article10.jpg', content_type: 'image/jpg')
article.save!
articles << article

article = Article.new(
  title: "At EDUCAP, Introduction to Tech course prepares young people for the job market",
  subtitle: "Free of charge and with the help of volunteers, the classes are aimed at residents of Alemão",
  content: "In a society increasingly connected to digital media, notions about technology are considered fundamental in the labor market. In order to increase plurality in this area, programmer Aline Oliveira teaches the Introduction to Technology course for young people in Complexo do Alemão, North Zone of Rio de Janeiro. Free of charge and with the help of volunteers, the classes take place at the Espaço Democrático de União, Co-existence, Learning and Prevention (EDUCAP) on Tuesdays, Thursdays and Saturdays. In fact, it currently has more than 20 students.
  For reasons of prevention against the coronavirus, following all the protocols guided by the health agencies, the class of students is separated into two groups that intersperse the school days. Furthermore, there is the possibility of taking the course remotely as well. However, at the moment, vacancies are unavailable.",
  communities: ["Juramento", "Macacos", "Rocinha", "Vidigal", "Borel", "Formiga"],
  interests: ["Sports", "Economy", "Culture", "Health", "Social", "Security"]
)
article.user = users.sample
article.photo.attach(io: article_photo11, filename: 'article11.jpg', content_type: 'image/jpg')
article.save!
articles << article

article = Article.new(
  title: "Cabelin na régua and self-esteem: discover Dick's Barbershop in Alemão",
  subtitle: "In the profession for a decade, Waldick Júnior has already made several cuts, including famous ones",
  content: "From an early age, the verb “run” followed the routine of Waldick Francisco de Souza Júnior, 28, a resident of Fazendinha, in Complexo do Alemão. Raised by his grandmother and mother, after losing his father in childhood, “Dick”, as he is better known in the community, defined the profession he would follow when he was still young, when he observed with curiosity his cousin's work: barber. Today, he owns Barbearia do Dick , at Rua Itararé, 375.
  Since then, the constant turmoil in his daily life has become an ally in his professional trajectory. Because, due to this activity, four years ago he managed to open his first salon in Fazendinha. But, the space was not yours yet. “Four years ago I managed to open my first salon. There at the Farm. But the barbershop space was not mine yet. He paid rent every month and increased the store's price annually. There came a time when I realized that it would not be feasible to stay there”, he comments.",
  communities: ["Juramento", "Macacos", "Rocinha", "Vidigal", "Borel", "Formiga"],
  interests: ["Sports", "Economy", "Culture", "Health", "Social", "Security"]
)
article.user = users.sample
article.photo.attach(io: article_photo12, filename: 'article12.jpg', content_type: 'image/jpg')
article.save!
articles << article

article = Article.new(
  title: "Promoting self-esteem, project 'O Glamour da Favela' awards Plus Size models",
  subtitle: "Organizers say the event will follow the guidelines of the Ministry of Health regarding Covid-19",
  content: "Contributing to building a society with healthier and more diversified values, the O Glamor da Favela project will award, this Saturday (May 1st), the winners of the first edition of the Plus Size beauty contest in the communities of Rio de Janeiro. Conceived by Faby Costa, Musa Evolution Plus Size Summer Carioca Bangu 2020, Faby Costa, the event will take place at Rua do Desenhista, in Vila Aliança, in Bangu. According to Faby, the main objective of the event is to demonstrate that the essence cannot be evaluated by prejudiced standards imposed on society, which relate the standard of beauty to its weight.",
  communities: ["Juramento", "Macacos", "Rocinha", "Vidigal", "Borel", "Formiga"],
  interests: ["Sports", "Economy", "Culture", "Health", "Social", "Security"]
)
article.user = users.sample
article.photo.attach(io: article_photo13, filename: 'article13.jpg', content_type: 'image/jpg')
article.save!
articles << article

article = Article.new(
  title: "Pre-university entrance exam 'Só Cria' conquers new space in Rocinha",
  subtitle: "Space is named after educator Elizia Pirozi, who fought for literacy in the favela",
  content: "When it comes to learning, an environment that offers a quality structure for teaching students makes a difference. Seeking to make this differential available in the routine of Rocinha residents and students, the public entrance exam Só Cria now has its own place for classes: the Elizia Pirozi Communal Space, which opened on April 17th. With three years of existence, the project carried out in the favela in the South Zone of Rio de Janeiro had a partnership with the Popular Brigades to achieve the objective of having a physical headquarters. In honor of the struggle for education in Rocinha, the space was named after an educator who fought for quality education, developing literacy work for children and adults in the favela: Francisca Elizia de Medeiros Pirozi, who died in 2017 at the age of 77.",
  communities: ["Juramento", "Macacos", "Rocinha", "Vidigal", "Borel", "Formiga"],
  interests: ["Sports", "Economy", "Culture", "Health", "Social", "Security"]
)
article.user = users.sample
article.photo.attach(io: article_photo14, filename: 'article14.jpg', content_type: 'image/jpg')
article.save!
articles << article

article = Article.new(
  title: "A leap from Alemão to Europe: Dancer Luis Fernando is featured in ballet shows",
  subtitle: "A 20-year-old dancer is one of the new members of the company Tivoli Ballet Skole from Denmark",
  content: "“With each performance, a new rebirth”, defines the 20-year-old dancer Luis Fernando , while describing the sensations his body awakens in each ballet performance. Born in Complexo do Alemão, in Nova Brasília, the dancer found a passion for dance through the “mission” of taking his younger sister to classes at the ViDançar social project , which takes place in the community. And now, after seven years of his first artistic bodily movements, the young man is one of the new members of the Tivoli Ballet Skole, in Denmark.
  Between one visit and another, Luis watched from afar the movements elaborated during classes. Gradually, the attentive and curious eyes captured the interest of the teacher, who proposed an invitation for him to also study and practice alongside his sister. The young man accepted, but, afraid of suffering prejudice, he shared with friends and family that the classes would be to improve his performance in Surf (a sport he practiced at the time).",
  communities: ["Juramento", "Macacos", "Rocinha", "Vidigal", "Borel", "Formiga"],
  interests: ["Sports", "Economy", "Culture", "Health", "Social", "Security"]
)
article.user = users.sample
article.photo.attach(io: article_photo15, filename: 'article15.jpg', content_type: 'image/jpg')
article.save!
articles << article

article = Article.new(
  title: "Rocinha's MCs School opens new applications for community residents",
  subtitle: "Created in 2020, initiative uses music as instrument of organization and struggle for the population",
  content: "Seeking to encourage musical production within the communities and influence the professional perspectives of the residents, the Escola de MC's da Rocinha opens new enrollments for the next class of students in the sociocultural project. Created in 2020, in an action of the Popular Brigades, a popular organization, the initiative aims to democratize culture within the favelas and use music as an instrument of social organization and struggle for the peripheral population.
  In addition to the partnership with the Popular Brigades, the Rocinha MC School has the support of TOS Record and Coletivo Rap Virus, which help coordinate classes within the project and record music in professional studios for students from initiative.
  To register for the Rocinha MC School, which runs until 06/14, you must register your data on the Google online platform . In addition, the initiative disseminates information about classes periodically on its YouTube channel.",
  communities: ["Juramento", "Macacos", "Rocinha", "Vidigal", "Borel", "Formiga"],
  interests: ["Sports", "Economy", "Culture", "Health", "Social", "Security"]
)
article.user = users.sample
article.photo.attach(io: article_photo16, filename: 'article16.jpg', content_type: 'image/jpg')
article.save!
articles << article

article = Article.new(
  title: "'Em Ação' has already distributed more than 10 thousand handouts in Alemão",
  subtitle: "Social project has been working on behalf of residents of Complexo do Alemão",
  content: "Created by a group of friends in 2019, the Social In Action Project has been operating in Complexo do Alemão since the beginning of the pandemic. The group acted in actions that helped to lessen the impact of the Covid-19 pandemic for many families in the community. What began with a simple distribution of masks, has been extended to a large free distribution of pedagogical handouts for students in the municipal public network.
  The social impacts caused by the Covid-19 pandemic were clearly felt in the peripheral communities of Rio de Janeiro. Given the many needs, friends Ivan Villela and wife Renata Moreira, who are from Jacarepaguá, and residents of Complexo do Alemão Washington Nogueira and Nielson dos Santos, teamed up to help residents of Complexo do Alemão. “ We got tired of sitting around waiting for the state to act , people needed help. We started in April of last year with the distribution of more than 5,000 masks to the residents”, commented Ivan.",
  communities: ["Juramento", "Macacos", "Rocinha", "Vidigal", "Borel", "Formiga"],
  interests: ["Sports", "Economy", "Culture", "Health", "Social", "Security"]
)
article.user = users.sample
article.photo.attach(io: article_photo17, filename: 'article17.jpg', content_type: 'image/jpg')
article.save!
articles << article

article = Article.new(
  title: "This Friday, a social initiative delivers new baskets to families in Maré",
  subtitle: "In partnership with Maré do Amanhã Orchestra, action distributes in 16 communities in the region",
  content: "Prioritizing the continuity of the social initiative aimed at reducing food insecurity in homes in Complexo da Maré, the Assim Saúde Group, in partnership with the young people of the Maré do Amanhã Orchestra, carries out this Friday (14) a new action to distribute baskets for families in the favela. The campaign, which started in April and continues until June, will deliver new baskets to the 16 communities in the region, from 9:00 am to 4:00 pm. The founder and conductor of the Orchestra, Carlos Eduardo Prazeres, explains that each family receives two food baskets per month and that this amount donated by Assim Saúde is already able to help more than 7,500 people in the community in situations of extreme vulnerability and hunger.",
  communities: ["Juramento", "Macacos", "Rocinha", "Vidigal", "Borel", "Formiga"],
  interests: ["Sports", "Economy", "Culture", "Health", "Social", "Security"]
)
article.user = users.sample
article.photo.attach(io: article_photo18, filename: 'article18.jpg', content_type: 'image/jpg')
article.save!
articles << article

article = Article.new(
  title: "Seeking balance: Teacher offers free yoga classes to Vidigal residents",
  subtitle: "Little seen in the communities of Rio, the practice brings several health benefits, body and mind",
  content: "In Morro do Vidigal, in the South Zone of the city, the arrival of a yoga project has been helping community residents in their search for peace and balance. Led by professor “Xico”, the project has been making a difference in the lives of children, young people and adults in the favela for 2 months.
  Yoga is a concept that refers to traditional physical disciplines originating in India. The word is associated with meditative practices or as a form of exercise. The Asian practice arrived at Vidigal thanks to professor Francisco Soares de Gusmão , better known as Chico , 33 years old. The instructor has been a resident of the community for 2 years, but he is already doing a lot for the favela as shown on the Parceiros do Vidiga page. After losing his job to the pandemic last year, he decided to take his knowledge and give it to the community. “It is rewarding to bring the oriental philosophy and the practice of physical exercise to people is my life mission. The students have enjoyed the classes a lot, I feel that yoga helps bring peace and a better life to the students”, commented Chico. ",
  communities: ["Juramento", "Macacos", "Rocinha", "Vidigal", "Borel", "Formiga"],
  interests: ["Sports", "Economy", "Culture", "Health", "Social", "Security"]
)
article.user = users.sample
article.photo.attach(io: article_photo19, filename: 'article19.jpg', content_type: 'image/jpg')
article.save!
articles << article

article = Article.new(
  title: "Project makes 'library bus' available in communities in Rio",
  subtitle: "Livros Na Praça will park in Manguinhos and Mangueira",
  content: "When it comes to actions that enable social transformation within the communities of Rio de Janeiro, reading is certainly one of the tools that have the most power in this process of cultural development. Through projects that democratize access to the various aids it brings, young people acquire a new understanding of the world and values.
  Paving this path for nine years, the Books in the Squares initiative , by Korporativa (a company that operates in the cultural, social and environmental marketing area), promotes literary democratization through the action that provides “library-bus” at certain points from Rio de Janeiro.
  Allowing readers to borrow books this June, the project will “park” the blue library bus in the communities ofManguinhos and Hose . The initiative's visits take place from 10:00 am to 4:00 pm, complying with all safety protocols determined by the Ministry of Health.",
  communities: ["Juramento", "Macacos", "Rocinha", "Vidigal", "Borel", "Formiga"],
  interests: ["Sports", "Economy", "Culture", "Health", "Social", "Security"]
)
article.user = users.sample
article.photo.attach(io: article_photo20, filename: 'article20.jpg', content_type: 'image/jpg')
article.save!
articles << article

puts 'creating facts...'
facts = []

fact_photo1 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/05/06105341/WhatsApp-Image-2021-05-06-at-10.50.03.jpeg')
fact_photo2 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/06/08204152/atualizaodocovidnasfavelas-08-06-2021.png')
fact_photo3 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/06/14162715/foto-2.jpeg')
fact_photo4 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/06/01111839/2021-13-05-ponto-de-onibus-da-rua-nova-vilmaribeiro-10-2048x1365.jpg')
fact_photo5 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/06/09181107/WhatsApp-Image-2021-06-09-at-17.51.50.jpeg')
fact_photo6 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/06/12162507/Foto-ricardo-Stuckert-Lula-com-liderancas-comunitarias-1.jpg')
fact_photo7 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2020/09/23144431/WhatsApp-Image-2020-09-23-at-14.38.56.jpeg')
fact_photo8 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/06/11142205/ONG-Noiz-e1623438514768.jpeg')
fact_photo9 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/06/11110438/IMG_0325.jpg')
fact_photo10 = URI.open('https://img-vozdascomunidade.s3.sa-east-1.amazonaws.com/wp-content/uploads/2021/05/28111605/IMG-20210527-WA0117.jpg')

fact = Fact.new(
  title: "Police continue operations, even with suspension of the STF",
  communities: ["Juramento", "Macacos", "Rocinha", "Vidigal", "Borel", "Formiga"],
  interests: ["Sports", "Economy", "Culture", "Health", "Social", "Security"]
)
fact.user = users.sample
fact.photo.attach(io: fact_photo1, filename: 'fact1.jpg', content_type: 'image/jpeg')
fact.save!
facts << fact

fact = Fact.new(
  title: "Favelas register 2 new cases of Covid-19 in 24 hours",
  communities: ["Juramento", "Macacos", "Rocinha", "Vidigal", "Borel", "Formiga"],
  interests: ["Sports", "Economy", "Culture", "Health", "Social", "Security"]
)
fact.user = users.sample
fact.photo.attach(io: fact_photo2, filename: 'fact2.jpg', content_type: 'image/png')
fact.save!
facts << fact

fact = Fact.new(
  title: "Rio City Hall suspends garbage collection at Rocinha and Vidigal",
  communities: ["Juramento", "Macacos", "Rocinha", "Vidigal", "Borel", "Formiga"],
  interests: ["Sports", "Economy", "Culture", "Health", "Social", "Security"]
)
fact.user = users.sample
fact.photo.attach(io: fact_photo3, filename: 'fact3.jpg', content_type: 'image/jpeg')
fact.save!
facts << fact

fact = Fact.new(
  title: "Kombis are authorized to transport passengers at Alemão",
  communities: ["Juramento", "Macacos", "Rocinha", "Vidigal", "Borel", "Formiga"],
  interests: ["Sports", "Economy", "Culture", "Health", "Social", "Security"]
)
fact.user = users.sample
fact.photo.attach(io: fact_photo4, filename: 'fact4.jpg', content_type: 'image/jpg')
fact.save!
facts << fact

fact = Fact.new(
  title: "Lins: protest for the death of Kathlen Romeu happens now",
  communities: ["Juramento", "Macacos", "Rocinha", "Vidigal", "Borel", "Formiga"],
  interests: ["Sports", "Economy", "Culture", "Health", "Social", "Security"]
)
fact.user = users.sample
fact.photo.attach(io: fact_photo5, filename: 'fact5.jpg', content_type: 'image/jpeg')
fact.save!
facts << fact

fact = Fact.new(
  title: "Community leaders meet with former president Lula this Saturday",
  communities: ["Juramento", "Macacos", "Rocinha", "Vidigal", "Borel", "Formiga"],
  interests: ["Sports", "Economy", "Culture", "Health", "Social", "Security"]
)
fact.user = users.sample
fact.photo.attach(io: fact_photo6, filename: 'fact6.jpg', content_type: 'image/jpg')
fact.save!
facts << fact

fact = Fact.new(
  title: "Heavy rain disrupts water supply in Formiga and Borel",
  communities: ["Juramento", "Macacos", "Rocinha", "Vidigal", "Borel", "Formiga"],
  interests: ["Sports", "Economy", "Culture", "Health", "Social", "Security"]
)
fact.user = users.sample
fact.photo.attach(io: fact_photo7, filename: 'fact7.jpg', content_type: 'image/jpeg')
fact.save!
facts << fact

fact = Fact.new(
  title: "Mass vaccination against Covid finally gets to Juramento",
  communities: ["Juramento", "Macacos", "Rocinha", "Vidigal", "Borel", "Formiga"],
  interests: ["Sports", "Economy", "Culture", "Health", "Social", "Security"]
)
fact.user = users.sample
fact.photo.attach(io: fact_photo8, filename: 'fact8.jpg', content_type: 'image/jpeg')
fact.save!
facts << fact

fact = Fact.new(
  title: "Cars are towed by City Hall this morning in Alemão",
  communities: ["Juramento", "Macacos", "Rocinha", "Vidigal", "Borel", "Formiga"],
  interests: ["Sports", "Economy", "Culture", "Health", "Social", "Security"]
)
fact.user = users.sample
fact.photo.attach(io: fact_photo9, filename: 'fact9.jpg', content_type: 'image/jpg')
fact.save!
facts << fact

fact = Fact.new(
  title: "Vidigal's Vila Olímpica receives revitalization today",
  communities: ["Juramento", "Macacos", "Rocinha", "Vidigal", "Borel", "Formiga"],
  interests: ["Sports", "Economy", "Culture", "Health", "Social", "Security"]
)
fact.user = users.sample
fact.photo.attach(io: fact_photo10, filename: 'fact10.jpg', content_type: 'image/jpg')
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
  content: "Amazing job you're doing there. Keep on doing it!"
)
comment.user = users.sample
comment.article = articles.sample
comment.save!

comment = Comment.new(
  content: "Never give up on your dreams. That's soooo nice"
)
comment.user = users.sample
comment.article = articles.sample
comment.save!

comment = Comment.new(
  content: "How about doing the same in Antares, Santa Cruz?"
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

comment = Comment.new(
  content: "Wow, I even got goosebumps! Congratulations Come to Grajaú São Paulo"
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

comment = Comment.new(
  content: "Wow, I even got goosebumps! Congratulations Come to Grajaú São Paulo"
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

comment = Comment.new(
  content: "Wow, I even got goosebumps! Congratulations Come to Grajaú São Paulo"
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

comment = Comment.new(
  content: "Wow, I even got goosebumps! Congratulations Come to Grajaú São Paulo"
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

comment = Comment.new(
  content: "Wow, I even got goosebumps! Congratulations Come to Grajaú São Paulo"
)
comment.user = users.sample
comment.article = articles.sample
comment.save!
