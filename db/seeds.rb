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
  longitude: 50.179973,
  latitude: 8.538367
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
  longitude: 50.1155,
  latitude: 8.6842
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
  longitude: 49.998168,
  latitude: 8.941267
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
  longitude: 50.128885,
  latitude: 8.816698
)
file = URI.open("https://avatars.githubusercontent.com/u/106547290?v=4")
@john.photo.attach(io: file, filename: "john.png", content_type: "image/png")
@john.save!


#--------------------------Chatrooms-------------------------------

User.excluding(@jeremy).each do |user|
  Chatroom.create!(first_user: @jeremy, second_user: user)
  puts "Chatroom for #{@jeremy.username} & #{user.username} created"
end

#--------------------------Questions and Answers-------------------------------

puts "Creating Question 1 and answers"

@question1 = Question.new(
  title: "What's the difference of the class ebike?",
  content: "What is the difference between class 1 electric bike and class 2 electric bike and class 3 electric bicycle? What are the restrictions in the US?",
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

@answer4 = Answer.new(
  question_id: Question.last.id,
  user_id: @john.id,
  content: "I would add that when the wheel went from true to not true, some spokes lost tension while others gained tension. Otherwise the wheel would have remained true. And uneven spoke tension is the recipe for broken spokes.",
  votes: 0
)
@answer4.save!

puts "Creating Question 8 and answers"

@question8 = Question.new(
  title: "Can degreaser harm bike?",
  content: "I've just started to use Muc Off's chain machine with its carbon-safe, biodegradable degreaser.
  
  I really like the outcome, and I guess its effectiveness come from its strength (therefore I am also a bit worried if it can damage the parts). After I apply the degreaser on the chain + cassette, I usually just wipe off the bike with a wet microfiber cloth + the chain and the cassette with some paper towel. Is that enough or should I also rinse it off with water?
  
  Thanks",
  user_id: @jeannoel.id
)
@question8.save!

@answer1 = Answer.new(
  question_id: Question.last.id,
  user_id: @clemence.id,
  content: "In the general case, some degreasers can cause hydrogen embrittlement in steel if left in prolonged contact. The worst case result is a broken chain. Simple Green's standard formulation is one example. If using that or a similar formulation, you could just not soak your chain in it for more than a few minutes, which most riders don't need to do anyway. You could search for an aerospace-safe degreaser, and Simple Green actually has such a formulation. The biodegradable Muc Off product identified in the original post shouldn't cause hydrogen embrittlement.",
  votes: 1
)
@answer1.save!

puts "Creating Question 9 and answers"

@question9 = Question.new(
  title: "Mechanic told me to replace the entire brake system because of slow return?",
  content: "I bought a second-hand bike in 2020. It has SRAM Level TL installed from the start. It caught my attention that brake lever didn't return to the end and had very little travel. I asked a mechanic that I know and he said to not worry, so I didn't.

  Fast forward 2 years I noticed that brakes are not returning and are braking/dragging all the time.
  
  I went to a bike shop asking for a fix (just an oil change I thought) but they told me there has to be something wrong with the caliper and not the oil and they need to open it and clean and put oil in it.
  
  After 2 days the bike shop told me that cleaning didn't fix anything and I should replace the entire brake system and it is going to cost me around 400€ as each brake kit cost 180€ (big markup as the official SRAM page gives pvp 121 and you can find them far cheaper online)
  
  Does anyone have experience with SRAM hydraulic brakes?",
  user_id: @jeremy.id
)
@question9.save!

@answer1 = Answer.new(
  question_id: Question.last.id,
  user_id: @john.id,
  content: "I would be initially skeptical, and I would definitely get a second opinion at a different bike shop. The brakes could indeed be worn in a way that they are beyond repair, but before you plunk down a lot of money, it would be worth it. It cannot hurt to get that second opinion. If you have options on several other shops to check out, you might get some recommendations from local riders as well, if you have that resource. There may be some online reviews as well, but be wary of them, as one always should with online reviews.

  If only a particular portion of the brake system is worn out (say the caliper), then you would only need to replace the caliper, not the entire system. There could be a point where enough of the system is failing/worn that a full replacement would be more economical compared to piecemealing in some new parts while keeping a few older ones.",
  votes: 4
)
@answer1.save!

@answer2 = Answer.new(
  question_id: Question.last.id,
  user_id: @clemence.id,
  content: "Yes, the whole situation is pretty normal for SRAM brakes. If the price you were quoted is for something of a approximately equal performance/quality, that's normal too.

  The shop has already wasted a bunch of time they're presumably not billing you for by trying a simple bleed. Most of the time, bleeding the brakes doesn't do anything to fix sticky piston situations on SRAM/Avid brakes, but it often feels like the right thing to try first anyway.",
  votes: 6
)
@answer2.save!

puts "Creating Question 10 and answers"

@question10 = Question.new(
  title: "Disc brakes sometimes sing",
  content: "Sometimes my front disc brakes on my mountain bike sing when I am NOT applying them.

  I can see there is a space between the pad and the rotor.
  
  It can get irritating.
  
  Is there some kind of fix?",
  user_id: @jeannoel.id
)
@question10.save!

@answer1 = Answer.new(
  question_id: Question.last.id,
  user_id: @jeremy.id,
  content: "I assume you have checked if the brake disks are mounted securely. You may want to check alignment of the caliper, and you may want to check if both brake pads retract correctly after releasing the brakes. If both are file, it's possible, according to my experience, that sometimes a bit of grit, sand or such gets picked up by the brakes. Typically, that would go away immediately when applying the brakes.

  If none of this is the case, i think we need more information.",
  votes: 5
)
@answer1.save!

@answer2 = Answer.new(
  question_id: Question.last.id,
  user_id: @jeannoel.id,
  content: "After disassembling the disc brake assembly and cleaning it thoroughly, the noise went away.

  There was some lint and grease looking substance that was removed.",
  votes: 2
)
@answer2.save!

puts "Creating Question 11 and answers"

@question11 = Question.new(
  title: "Is 3mm tubeless puncture too big to seal?",
  content: "I have a small slit in my MTB tyre (approx 3mm long x barely 1mm wide) which won't seal.

  I had to put a tube in when the puncture happened as it wouldn't seal, but I've now taken the tube out, cleaned down, remounted and injected fresh sealant. So I know there's plenty of fresh sealant in there.
  
  The hole is so small that I can't understand why it won't seal. I've had other punctures seal ok on these tyres with this brand of sealant.
  
  Are there some punctures that simply won't seal? Or is there something I need to do to make this sealable? I have some tubeless tyre plugs, but even the smallest is way way bigger than the hole I've got.",
  user_id: @john.id
)
@question11.save!

puts "Creating Question 12 and answers"

@question12 = Question.new(
  title: "Advice on correct spoke replacement",
  content: "I need a replacement spoke for a Shimano WH-MT500 29er QR. Shimano dealer manual does not mention the spoke length. I've figued out its a 13G, double butted spoke but unsure about the length. I've measured other spokes on the bike and from the hub to the base of the rim, including nipple, they are 290 mm. There are various sizes to buy online including 290 mm and 300 mm. is there additional length beneath the rim I need to account for? 290 mm or 300 mm?",
  user_id: @jeannoel.id
)
file = URI.open("https://killitfixed.files.wordpress.com/2011/12/tumblr_lwuqgcgige1r418lpo1_500.jpg")
@question12.photo.attach(io: file, filename: "question12.png", content_type: "image/png")
@question12.save!

@answer1 = Answer.new(
  question_id: Question.last.id,
  user_id: @clemence.id,
  content: "The easiest method would be to remove one of the spokes, measure the length , and reinsert the spoke. The length of the spoke needs to be such that all of the spoke's thread is inserted into the nipple's thread. Iirc most nipples have 19 revolutions of thread. Which should be approx 8-10mm length. Keep in mind the first part of the nipple is unthreaded (bore).",
  votes: 9
)
@answer1.save!

@answer2 = Answer.new(
  question_id: Question.last.id,
  user_id: @john.id,
  content: "Depending in the rim's wall thickness and spoke nipple flange thickness (thickness of the wider part of the spoke nipple) you will have to add some extra length to the spokes if you measure them whilst in the wheel. This should be approx 3-4 mm for most wheels. But as previously mentioned the other method is more accurate (measuring removed spoke).",
  votes: 3
)
@answer2.save!

puts "Creating Question 13 and answers"

@question13 = Question.new(
  title: "Which bicycle brand has the best (frame + fork) warranty?",
  content: "I prefer the lifetime warranty (LFW). But a TRUE lifetime warranty (not for first owner only).
  
  (For example TREK and Specialized has an LFW for first owner only.)
  
  So I can buy a used bike. (Being more specific I'm considering an entry-level road bike)",
  user_id: @jeremy.id
)
@question13.save!

@answer1 = Answer.new(
  question_id: Question.last.id,
  user_id: @john.id,
  content: "There's no universal answer to this question. It depends on where and when the bike has been purchased. I haven't done an extensive search on the topic, but as stated by Weimen Ng in the comment, untransferrable warranties are the norm.

  I'm only aware of one exception: Decathlon, in some countries.",
  votes: 4
)
@answer1.save!

puts "Creating Question 14 and answers"

@question14 = Question.new(
  title: "Cannot steer my bike with with new adult training wheels",
  content: "I just had adult training wheels put on my bike and I cannot steer it properly. The roads in my neighborhood are all cambered (raised in the middle) and the bike keeps pulling strongly to the right. I have to lean my body way out to the left to conteract the pull to the right. The training wheels are set almost right on the ground. Should I move them higher so there is space between the wheels and the ground? Or am I doing something wrong? Thanks",
  user_id: @clemence.id
)
file = URI.open("https://i.stack.imgur.com/xSsUa.jpg")
@question14.photo.attach(io: file, filename: "question14.png", content_type: "image/png")
@question14.save!

@answer1 = Answer.new(
  question_id: Question.last.id,
  user_id: @john.id,
  content: "Bicycles (and other two-wheeled vehicles like motorcycles) constantly need righting while riding. That is done mostly by the rider. If the bicycle starts to tip to the side, you automatically steer to the same side so you induce an opposite effect. This is helped by the head angle, the wheel trail and the gyroscopic effect, but active steering plays the biggest role. If a bicycle leans to one side for a longer time, it starts to turn or it falls over. (In fact, this is how you steer a bike in a corner: you steer in the opposite direction to make it lean into the corner and then you just keep it leaning until you've taken the turn.)",
  votes: 10
)
@answer1.save!

@answer2 = Answer.new(
  question_id: Question.last.id,
  user_id: @jeremy.id,
  content: "Training wheels are for training only. You need to find a suitable flat place and do the training there. From the time my daughter had them I remember they are not suitable for actual travel over real roads. Among other things, on a more worn tarmac you can just hang on them with the rear wheel in the air.

    If the goal is to learn riding, do some training and then remove the training wheels (even if my daughter still remembers how angry she was when I did). They do not give a lot of useful skills so can be ditched early or not used at all.",
  votes: 7
)
@answer2.save!

@answer3 = Answer.new(
  question_id: Question.last.id,
  user_id: @jeannoel.id,
  content: "On a normal bike, you steer by doing a bit of counter steering first. You push the left handle bar a little bit, your balance goes to the left, then you go to the left. With training wheels, you need to do the opposite. To go left, you push the right handle bar, not the left handle bar. This is why training wheels for kids are quite counter productive.",
  votes: 3
)
@answer3.save!

puts "Creating Question 15 and answers"

@question15 = Question.new(
  title: "Holes on inner side of rim are off-center. Problem?",
  content: "I noticed that the holes on the tyre side of a rim are not centred. Some are more to the side, some less. The image below shows a hole that comes up all the way to the edge of the central channel on the tyre side of the rim. Please compare the hole position to the rim edges, not to the red rim tape, which is also not quite centred.",
  user_id: @jeannoel.id
)
@question15.save!

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
