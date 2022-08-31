# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Destroying old POIs..."
PointOfInterest.destroy_all
puts "Destroying old POIs completed."

require "open-uri"

puts "Destroying old datas..."

Question.destroy_all
Answer.destroy_all
User.destroy_all

# ----------------------------Users------------------------------------------

puts "Creating Users..."
@clemence = User.new(
  username: "clemence",
  email: "clemence@bike.com",
  password: "password",
  description: "This is me. I love strange bikes.",
  biker_status: "athletic",
  language: "french"
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
  language: "french"
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
  language: "french"
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
  language: "french"
)
file = URI.open("https://avatars.githubusercontent.com/u/106547290?v=4")
@john.photo.attach(io: file, filename: "john.png", content_type: "image/png")
@john.save!


#--------------------------Questions and Answers-------------------------------

puts "Creating Question 1 and answers"

@question1 = Question.new(
  title: "CHOISIR LA TAILLE DE MON PREMIER VELO",
  content: "Bonjour,
  je mesure 1m72, entrejambe 80 cm, je ne sais pas quel taille de velo choisir, on m'a preter un orbea aqua taille 50 cm (axe pedalier haut du tube de la selle), mais je trouve le cadre vraiment petit j'ai fais 2 sorties (50 kms et 75 kms) avec je n'ai pas eu de problème particulier mais j'ai l'impression d'etre vraiment couché sur le vélo est ce normal ?
  Pouvez vous me conseillez car j'ai peur de me tromper pour l'achat un futur velo
  merci pour vos conseils",
  user_id: @john.id
)
@question1.save!

@answer1 = Answer.new(
  question_id: Question.last.id,
  user_id: @jeremy.id,
  content: "On ne peut pas te répondre, les tailles varient d'une marque à l'autre et la géométrie d'un modèle à l'autre. Malgré tout, un 50 pour 1m72, quelque soit la marque ou le modèle ça semble petit en effet.",
  votes: 4
)
@answer1.save!

@answer2 = Answer.new(
  question_id: Question.last.id,
  user_id: @clemence.id,
  content: "Le mieux est d'essayer en magasin et de demander conseils aux venderus qui sont normalement bien calés sur le sujet.",
  votes: 10
)
@answer2.save!

puts "Creating Question 2 and answers"

@question2 = Question.new(
  title: "
  [ESTIMATION PRIX] VÉLO KOGA SUPERMETRO",
  content: "Bonjour à tous,
  J'aurais besoin l'avis d'expert :smile:
  J'ai ce vélo qui appartenait à mon grand frère qui traine dans mon garage depuis un bon moment. Il était sous cellophane, et je viens de le déballer. Il s'agit d'un vélo de la marque KOGA Supermetro.
  Je ne m'y connais absolument pas en vélo, et j'aimerais savoir si quelqu'un sait à combien je peux revendre ce vélo ? Il est en très bon état, a part sur le guidon il y a un tout petit peu de caoutchouc qui se décolle..",
  user_id: @jeannoel.id
)
@question2.save!

@answer1 = Answer.new(
  question_id: Question.last.id,
  user_id: @clemence.id,
  content: "Il est récent ou il a plusieurs années ?",
  votes: 1
)
@answer1.save!

@answer2 = Answer.new(
  question_id: Question.last.id,
  user_id: @john.id,
  content: "C'est quoi l'historique du vélo ?",
  votes: 1
)
@answer2.save!

@answer3 = Answer.new(
  question_id: Question.last.id,
  user_id: @jeremy.id,
  content: "Tout ce que je sais c'est que ce modèle de vélo neuf, celui de cette année, est vendu à 1300 €.
  Celui ci doit avoir au moins 2 ans, je ne sais pas si les roues et les composants (vitesses etc) sont comparables, je pars sur l'hypothèse que oui. Mais ça pourrait avoir un impact négatif si ce n'est pas le cas.
  Donc à mon humble avis je dirais que ça peut se vendre vers les 800€ (leboncoin ou site spécialisé). Tu peux tenter l'annonce a 900 pour commencer. Ou regarder s'il y a des annonces de vélos similaires",
  votes: 8
)
@answer3.save!

puts "Creating Question 3 and answers"

@question3 = Question.new(
  title: "REGLAGE DERAILLEUR ARRIÈRE ÉTRANGE",
  content: "Bonjour à tous,
  Je suis nouveau sur le forum et je rencontre un problème qui me casse la tête depuis quelques jours.
  Je suis tout à fait novice en mécanique vélo. Je roule sur un Gravel Croix de Fer 10. J'ai récemment eu un souci de chaîne, ma chaîne s'est complètement emmêlée. J'ai donc suivi un tuto YouTube qui recommandait de dévisser les galets du dérailleur pour démêler la chaîne, ce que j'ai fait, et qui a marché. Le problème, c'est que maintenant, je ne sais pas du tout comment remettre la chaîne autour des galets. En fait, la chape du dérailleur tend vers l'avant et la chaîne reste tout molle. Il est évident que j'ai mal fait quelque chose, mais je ne sais pas trop quoi...",
  user_id: @clemence.id
)
@question3.save!

@answer1 = Answer.new(
  question_id: Question.last.id,
  user_id: @john.id,
  content: "Le réglage est très probablement aux fraises, et dans le pire des cas faudra changer les cables.
  Je te conseille de checker des vidéos de réglage des dérailleurs, trouvables en masse en ligne.",
  votes: 2
)
@answer1.save!

@answer2 = Answer.new(
  question_id: Question.last.id,
  user_id: @jeremy.id,
  content: "Comment ça l'amplitude ? Un dérailleur est prévu pour X vitesses, si les butées sont bien réglées et la tension également, il est bien aligné avec chaque pignon en fonction de la vitesse enclenchée.
  La tension peut se régler soit via une molette sur le dérailleur arrière à la base du cable, soit une autre molette sur le cable qui part du cintre, voire les deux.",
  votes: 6
)
@answer2.save!

puts "Creating Question 4 and answers"

@question4 = Question.new(
  title: "FTP / WATTS / PUISSANCE DANS LE MONDE AMATEUR",
  content: "Bonsoir,
  Ma question est simple, sur internet on lit tout et son contraire donc j’ai préféré venir poser la question sur un forum avec de vrai cycliste dont certains assez confirmé.
  En sachant qu’un pro a sa FTP entre 5 et 6,5 W/Kg on va dire, assez largement, pour vous, quel sont les barèmes approximatifs que vous voyez pour un bon coursier amateur, un amateur lambda et un cyclotouriste occasionnel?",
  user_id: @jeremy.id
)
@question4.save!

@answer1 = Answer.new(
  question_id: Question.last.id,
  user_id: @john.id,
  content: "Je connaissais ce tableau et j'allais le poster, mais sans les traits de couleur par pourcentage.
  J'imagine que ça doit être lu de la sorte : Si tu es au-dessus du trait 90 et en dessous de 95, tu es dans les 10 meilleurs % de la population cyclo sur l'effort donné ?",
  votes: 4
)
@answer1.save!

@answer2 = Answer.new(
  question_id: Question.last.id,
  user_id: @jeannoel.id,
  content: "Tu as un capteur de puissance :o ?",
  votes: 1
)
@answer2.save!

@answer3 = Answer.new(
  question_id: Question.last.id,
  user_id: @clemence.id,
  content: "Est-ce pour te fixer des objectifs dans ta vie de cyclo, objectifs qui selon ce tableau pourraient être assez faibles",
  votes: 1
)
@answer3.save!

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

puts "Seed is complete"
