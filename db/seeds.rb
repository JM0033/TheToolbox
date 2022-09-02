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

User.excluding(@john).each do |user|
  Chatroom.create!(first_user: @john, second_user: user)
  puts "Chatroom for #{@john.username} & #{user.username} created"
end

#--------------------------Questions and Answers-------------------------------

puts "Creating Question 1 and answers"

@question1 = Question.new(
  title: "What the difference of the class ebike ?",
  content: "What is the difference between class 1 electric bike and class 2 electric bike and class 3 electric bicycle? What are the restrictions in the US?",
  user_id: @john.id
)
@question1.save!

@answer1 = Answer.new(
  question_id: Question.last.id,
  user_id: @jeremy.id,
  content: "Manufacturers like you have blurred the definition, but as originally defined.
  Class 1: Pedal assist only with 20 mph speed limit, No throttle.
  Class 3, Pedal assit only with 28 mph speed limit, No throttle.
  Class 2, 20 mph speed limit. Pedal assist and throttle.
  Bikes w/o pedals are not ebikes. Motor power limit is 750W.
  
  As each of the 50 states in the USA start to define ebikes, variations of the above definitions appear,.
  
  Today, some sellers call their Class 3, pedal assist and throttle with 28 mph top speed, throttle stops at 20 mph.",
  votes: 4
)
@answer1.save!

@answer2 = Answer.new(
  question_id: Question.last.id,
  user_id: @clemence.id,
  content: "Class 2 have a throttle. The other two classes do not.
    Class 1 assist limited to 20 mph; Class 3 assist limited to 28 mph.
    Class 1 allowed on bike trails and MUPs.",
  votes: 10
)
@answer2.save!

@answer3 = Answer.new(
  question_id: Question.last.id,
  user_id: @jeannoel.id,
  content: "Class 1 goes up to 20mph with pedal assist
  Class 2 is a moped that can go up to 20mph with a throttle
  Class 3 goes up to 28mph with pedal assist
  Class 4 goes above 28mph and can sometimes include mopeds as well and typically bikes listing a max power of 750w and higher (some brands go by nominal power which tends to be lower and some will go with max power because the actual power of the bike is not that great).",
  votes: 2
)
@answer3.save!

puts "Creating Question 2 and answers"

@question2 = Question.new(
  title: "Which mini-pump for gravel tires?",
  content: "Hi all.

  Had to plug and pump up a 38mm gravel tire on today's ride, and my pump (Silca Tattico) is designed more for road tires; took about 160 strokes to get the tire from squishy to 'just right,' and that was a lot of fun in the high heat and humidity. This got me thinking that I might buy a Lezyne pump designed for higher volume tires from their HV series...The question is, which one? They have quite a few, and it's pretty hard to discern any differences. Produce page here.
  
  Any input and experience appreciated.",
  user_id: @jeannoel.id
)
@question2.save!

@answer1 = Answer.new(
  question_id: Question.last.id,
  user_id: @clemence.id,
  content: "I went with the Silca full-frame pump, since it was only $175 smackaroos (I don't think I have heard anyone use that term since the Flintstones/Honeymooners), and matches my color scheme. I got sick of mini-pumps and CO_2 cartridges.

  Any decent high-volume mountain bike pump should work.",
  votes: 1
)
@answer1.save!

@answer2 = Answer.new(
  question_id: Question.last.id,
  user_id: @john.id,
  content: "Lower-pressure, higher volume pumps will fill big tires faster with a comparable amount of pumping effort.",
  votes: 1
)
@answer2.save!

@answer3 = Answer.new(
  question_id: Question.last.id,
  user_id: @jeremy.id,
  content: "For gravel, you want a pump with a larger barrel for faster filling of large, lower pressure tires. And you want a very accurate gauge since gravel tires can be vastly different at 33 vs 36 PSI. We recommend this as one of our favorites for gravel. It has a great accurate gauge and is easy to adjust pressure both up and down in small increments. MICRO FLOOR DRIVE DIGITAL HVG | MOUNTAIN AND GRAVEL BIKE PUMP – Lezyne No more just squeeze in and saying that is about right...

  Accurately dialing in your tire pressure can make a huge difference. I would not want to use a pump without a gauge unless you carry a separate gauge, and to me that is a pain to go back and forth.",
  votes: 8
)
@answer3.save!

puts "Creating Question 3 and answers"

@question3 = Question.new(
  title: "Trek 7.9 carbon how strong",
  content: "Hi all ,new to this forum I looked at a Trek 7.9 carbon hybrid today about 2015 ,Will this bike take some tracks,gravel, downhill on grass bumps etc as forks do look more road and not very big, it will be used on road,I was thinking of putting 32mm wide tyres to help
    Thanks",
  user_id: @clemence.id
)
@question3.save!

@answer1 = Answer.new(
  question_id: Question.last.id,
  user_id: @john.id,
  content: "Hi, Clemence.

  From what I've researched regarding the Trek FX range, is that once you're into the FX 7.7 to 7.9 range, they are basically a carbon Trek Madone or Trek Domane road/race bike with flat bars. Thus, the maximum tire clearance is not a whole lot--28mm max is a good expectation, and you'd have to mount 32s (and measure them) on your own wheels and see if you could mount them on the bike you're looking at.
  
  Lesser Trek FX's throughout the years have normal generous clearances, my 2014 FX 7.3 will clear 42mm tires front and rear. FX 7.4s to 7.6s came with carbon forks instead of aluminum (7.3) or steel (7.2 and less), which is something I've been looking for. My 7.3 is great though, and will handle gravel easily with it's large tires. That is, if I ever bother with gravel. The paint is so pretty and so pristine that my road-biased self just enjoys it on the road (albeit with road bike componentry)!",
  votes: 2
)
@answer1.save!

@answer2 = Answer.new(
  question_id: Question.last.id,
  user_id: @jeremy.id,
  content: "I have a 2014 Trek FX 7.3 and if it wasn't to big I would certainly ride it. Great upright riding bike.",
  votes: 1
)
@answer2.save!

puts "Creating Question 4 and answers"

@question4 = Question.new(
  title: "Thailand musings",
  content: "OK. So, tentatively we were planning to tour South Korea next spring but some friends expressed their bucket list desire to tour Thailand. So I looked it up, literally for the first time and found well written article that made it seem awesome. I also like the itinerary's ease: Fly to Bangkok, train to Hat Yai and then bike back to Bangkok following the coast. Leave cooking and camping stuff at home because - Thailand.

  Anyone done this route and is there a recommended gpx to go or do you just wing it (which is what I am best at)?
  
  Luggage storage at the airport? Traveling on the train with a tandem or single bicycle?",
  user_id: @jeremy.id
)
@question4.save!

@answer1 = Answer.new(
  question_id: Question.last.id,
  user_id: @john.id,
  content: "I would recommend touring instead in northern Thailand anytime from December to February. The north has great riding and interesting places to visit. The north is far enough from the equator that temperatures are far more comfortable during those 3 months than during the rest of the year, or during any month in central and southern Thailand. It's also the dry season in the north. I toured twice in northern Thailand in the Jan-Feb timeframe. Daytime temperatures were low 80s F (27 or 28C) and nighttime lows were upper 50s F (14 or 15C). I only had rain during one day in the north on the 2 trips combined.",
  votes: 4
)
@answer1.save!

@answer2 = Answer.new(
  question_id: Question.last.id,
  user_id: @jeannoel.id,
  content: "It was some years ago, but I did this the other direction and enjoyed the trip.

  - The original plan was to bicycle Bangkok to Singapore. This was my unwind trip at the end of a 10 month vacation (first month was in the US warming up, six moths cycling across Russia, two months cycling China and just over a month allocated for this trip). I was essentially there between US Thanksgiving and Christmas. Since it was the unwind trip, I didn't do much planning in advance other than reading a journal or two and planning to go along the coast.
  - I slept inside every night with reasonable prices and ate foods along the way; no cook set or camping.
  - In southern Thailand, my 48-spoke hub failed. If this had been earlier in a longer trip - I would have gone back to Bangkok and figured out a replacement.",
  votes: 1
)
@answer2.save!

@answer3 = Answer.new(
  question_id: Question.last.id,
  user_id: @clemence.id,
  content: "suvarnabumi airport has a left luggage storage outside the secure area. or you could stay at a hotel near the airport with pickup service, stay one night, leave your stuff and bike boxes there in storage. if interested, i'll try to locate the one i stayed in last time.....something like green resort i think, in the lat krabang area just north of the airport.

  next morning, bike a mile to the train station just north of the airport, catch the local (NOT during commuter time) to the main station. no baggage car, but you can load your bike into the main cabin. then switch to the southbound with baggage car.
  
  ride back from hat yai to stay in the same hotel for a night, pack your stuff, and use their airport dropoff service next morning.
  
  i did part of that route a decade ago, left bangkok, to kanchaniburi for a few days, then south towards singapore. got fed up with the dogs by the time i hit ratchaburi, so took a train from there to hat yai to start biking again. no stray dogs in the muslim south for some reason.",
  votes: 5
)
@answer3.save!

puts "Creating Question 5 and answers"

@question5 = Question.new(
  title: "Tires for Paved, Clear Roads",
  content: "I’m planning to ride my Surly Cross Check in the winter. I have a good, handbuilt wheelset with RH Barlow Pass 38mm (tubed), and an inexpensive Alex wheelset with WTB Venture 40mm (tubeless).

  I live outside Toronto. We have proper winter but usually I can ride 1-2x a week throughout winter on roads that are free of snow/ice.
  
  I’m thinking of using the Ventures because of the tread pattern and how it’s better in uncertain conditions than the Rene Herse, and it’s tubeless, and the wheels can take abuse without fuss by me.",
  user_id: @jeremy.id
)
@question5.save!

@answer1 = Answer.new(
  question_id: Question.last.id,
  user_id: @jeannoel.id,
  content: "If the roads are truly ice/snow free, you can do pretty much whatever you want.

    If there are occasional ice patches and you don't want to be riding studs for the other 98% of the ride, then the key consideration is keeping your tire pressure low, particularly for the front wheel.",
  votes: 3
)
@answer1.save!

@answer2 = Answer.new(
  question_id: Question.last.id,
  user_id: @john.id,
  content: "I have studded tires and ride them all over the place. Sometimes the bike lanes are cleared of ice and snow sometimes they have clumps of them.The MUPs are not maintained in the winter.",
  votes: 2
)
@answer2.save!

puts "Creating Question 6 and answers"

@question6 = Question.new(
  title: "Freecoaster problem",
  content: "Hello everyone I just received my new custom wheels, it’s a Primo balance freecoaster hub with cinema 333 rims and cinema spokes.

  BUT I have a huge problem.
  The wheel doesn't work.
  
  When I barely serve both screws impossible to turn the crankset the hub is as if blocked as if I tighten super hard but it is not the case.
  
  I removed the hubguards to be sure and it's really as if the wheel was blocked. I tight correctly but it’s look like I tighten so hard that the bearing braking.
  
  Would anyone have a solution to that ?",
  user_id: @john.id
)
@question6.save!

puts "Creating Question 7 and answers"

@question7 = Question.new(
  title: "Why am I breaking a ridiculous number of spokes?",
  content: "I've been riding it over a week with an untrue back wheel (aka Kayak Mode). Today, I checked the wheel because the trouble had become a big issue again, and found I had two (!) broken spokes since replacing the first broken one a week or two ago.

  So, why are my spokes snapping like spaghetti? I guess:
  
  Because I was riding without truing the wheel
  Because I'm riding too hard (i.e. coming off curbs)
  Some combination of the two, or something else.
  Thanks!",
  user_id: @clemence.id
)
@question7.save!

@answer1 = Answer.new(
  question_id: Question.last.id,
  user_id: @jeannoel.id,
  content: "Generally, repeated issues with broken spokes indicates either damage to the rim, meaning that the metal hoop of the rim is physically bent while under no tension, or that the spokes are at the end of their fatigue life.

  Any wheel has an expected use life, and usually, you will wear a track in the aluminum rim from braking forces before the fatigue life of the stainless steel spoke becomes an issue. However, if the rim is damaged, as referenced in your previous question, then the tension of the wheel cannot be evenly consistent, because some spokes must be tighter than others in order to hold the rim true and straight. If our wheel is unevenly tensioned, it allows a far greater amount of movement of each spoke during the revolution of a wheel, and this stresses the spokes beyond their designed strength. And you break more spokes.",
  votes: 3
)
@answer1.save!

@answer2 = Answer.new(
  question_id: Question.last.id,
  user_id: @jeremy.id,
  content: "Several possibilities:

  - The wheel is poorly built -- over tensioned, improperly crossed, wrong side of the flange, etc.
  - You're too heavy for the wheels.
  - You're too hard on the wheels (for the ruggedness of the particular wheels).
  - The spokes are corroded or otherwise reaching end of life.
  Riding without truing the wheel doesn't help the situation, but wouldn't by itself cause a problem unless the tension was so far off that a few spokes were bearing the lion's share of the load.",
  votes: 5
)
@answer2.save!

@answer3 = Answer.new(
  question_id: Question.last.id,
  user_id: @john.id,
  content: "I had the same issue with a set of wheels. I was breaking a spoke every week or two. My advice was that it was a cheaply built wheel with weak spokes. Whenever I replaced a spoke I marked it and I confirmed that it was always the original spokes that were snapping.

  I upgraded to a new set of wheels and haven't had any trouble since. I'd suggest having a good hard look at the bike and either buying new wheels or upgrading to a better quality bike. Wheels are a pretty safe investment because you can transfer them to a new (similar) bike relatively simply.",
  votes: 0
)
@answer3.save!

@answer4 = Answer.new(
  question_id: Question.last.id,
  user_id: @john.id,
  content: "I would add that when the wheel went from true to not true, some spokes lost tension while others gained tension. Otherwise the wheel would have remained true. And uneven spoke tension is the recipe for broken spokes.",
  votes: 0
)
@answer4.save!


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
