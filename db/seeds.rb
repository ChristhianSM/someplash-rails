puts "Seeding DB"
wallpaper = Category.new(name: "Wallpaper",description: "From epic drone shots to inspiring moments in nature, find free HD wallpapers worthy of your screens." )
wallpaper.cover.attach(io: File.open("db/images/categories/wallpaper-cover.png"), filename: "wallpaper_cover")
wallpaper.save
nature = Category.new(name: "Nature",description: "Let’s celebrate the magic of Mother Earth — with images of everything our planet has to offer." )
nature.cover.attach(io: File.open("db/images/categories/mountain.png"), filename: "nature_cover")
nature.save
people = Category.new(name: "People",description: "Real people, captured. Photography has the power to reflect the world around us, give voice to individuals and groups." )
people.cover.attach(io: File.open("db/images/categories/personRoad.png"), filename: "people_cover")
people.save

puts "Seeding Photos"
purple_lake = wallpaper.photos.new(title: "Purple Lake", description: "Nice and big purple lake.")
purple_lake.image.attach(io: File.open("db/images/photos/purplelake.png"), filename: "plk_cover")
purple_lake.save
starry_night = wallpaper.photos.new(title: "Starry night", description: "A beautiful starry night") 
starry_night.image.attach(io: File.open("db/images/photos/starrylight.png"), filename: "starrylight")
starry_night.save
light_rocks = wallpaper.photos.new(title: "Light in the rocks", description: "Nice photo of the rocks")
light_rocks.image.attach(io: File.open("db/images/photos/lightRocks.png"), filename: "lightrock")
light_rocks.save

green_plant = nature.photos.new(title: "Green Plant", description: "Beautiful organic little plant.")
green_plant.image.attach(io: File.open("db/images/photos/greenPlant.png"), filename: "Green_plant")
green_plant.save
lonely_bird = nature.photos.new(title: "Lonely Bird", description: "A nice picture of a lonely bird flying.")
lonely_bird.image.attach(io: File.open("db/images/photos/lonelyBird.png"), filename: "Lonely_bird")
lonely_bird.save
little_bird = nature.photos.new(title: "Little Bird", description: "Cute little bird in a tree.")
little_bird.image.attach(io: File.open("db/images/photos/littleBird.png"), filename: "Little_bird")
little_bird.save
space_oddisey = nature.photos.new(title: "Space Odissey", description: "A deep look into the space")
space_oddisey.image.attach(io: File.open("db/images/photos/spaceOdissey.png"), filename: "Space_oddisey")
space_oddisey.save

man_coffee = people.photos.new(title: "A man drinking coffee", description: "looking at Christhian")
man_coffee.image.attach(io: File.open("db/images/photos/manCoffe.png"), filename: "Main_coffe")
man_coffee.save
couple = people.photos.new(title: "Couple", description: "A couple holding their pet")
couple.image.attach(io: File.open("db/images/photos/couple.png"), filename: "Couple")
couple.save
artistic_photo = people.photos.new(title: "Artistic Photo", description: "A man raising their hand")
artistic_photo.image.attach(io: File.open("db/images/photos/artisticPhoto.png"), filename: "Artisctic_Photo")
artistic_photo.save
old_man = people.photos.new(title: "Old man", description: "A man with a mask")
old_man.image.attach(io: File.open("db/images/photos/oldMan.png"), filename: "Old_Man")
old_man.save

puts "Seeding Category Comments"
wallpaper.comments.create(body:"Very nice pictures from places of beautiful landscapes.")
wallpaper.comments.create(body:"The pictures from places of great places are awesome.")

nature.comments.create(body:"The nature inspire others.")
nature.comments.create(body:"The nature is beatiful.")
nature.comments.create(body:"The nature transmit relaxation.")
nature.comments.create(body:"The nature is magnificent.")

people.comments.create(body:"The people belongs to the universe.")
people.comments.create(body:"The people love.")
people.comments.create(body:"The people are beatiful.")
people.comments.create(body:"The people are optimist.")
people.comments.create(body:"The people of the universe.")


puts "Seeding Photos Comments"
purple_lake.comments.create(body: "It's a beautiful photo of this awesome lake" )
purple_lake.comments.create(body: "I like the colors of this photo" )
purple_lake.comments.create(body: "Amazing photo of this beautiful lake. Well done!" )

starry_night.comments.create(body: "I really like this place. It's awesome!" )
starry_night.comments.create(body: "Beautiful shoot of this place. Well done!" )
starry_night.comments.create(body: "Nice picture. Awesome!" )

light_rocks.comments.create(body: "This view is incredible")
light_rocks.comments.create(body: "Nice picture")

green_plant.comments.create(body: "A beautiful green picture of the nature")
green_plant.comments.create(body: "Awesome picture. Very wall done!")

lonely_bird.comments.create(body: "Beautiful lonely bird")
lonely_bird.comments.create(body: "Great picture. Well done!")

