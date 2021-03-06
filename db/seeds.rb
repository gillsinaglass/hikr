# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Trail.destroy_all
Shelter.destroy_all
Break.destroy_all
Hike.destroy_all


user1 = User.create(username:"Jake", gear: "Tough Shoes, Water, Sandwiches, Chips, tent", caption:"Lorum Ipsum my dudes", password:"password")
user2 = User.create(username:"Melanie", gear: "Water-proof Backpack", caption:"I'm friendly, let's hangout", password:"password")
user3 = User.create(username:"Paul", gear: "Walking Stick, Cat Food, Cat", caption:"At-least it's Friday", password:"password")

billy = Trail.create(name: "Billy-goat", description:"High-waters, low fields. Cat's not welcome due to Billy Goats", difficulty_level: 5, distance: 4.5)
appalachian = Trail.create(name: "Appalachian", description:"Lose four-months of your life, gain debt, but emerge in a relationship", difficulty_level: 9, distance: 10000.2)
old = Trail.create(name: "Old Rag", description:"Dirty, trash ridden, but surprisingly quaint", difficulty_level: 6, distance: 20.7)

bones = Shelter.create(name:"Bones", location: "Just beyond the riverbend", description: "Made entirely of previous guests, all additions welcomed", trail_id: billy.id)
flower_house = Shelter.create(name:"Flower House", location: "A field of daffodils", description: "Maintained by hippies, all 'Bud'dies welcome", trail_id: old.id)
lovers_cabin = Shelter.create(name:"Lover's Cabin", location: "Heart of the Mountain", description: "Warm, inviting home with one very small bed for all guests", trail_id: appalachian.id)

break1 = Break.create(review: "Love this place!", shelter_id: bones.id, user_id: user1.id, rating: 7)
break2 = Break.create(review: "Amazing", shelter_id: flower_house.id, user_id: user2.id, rating: 6)
break3 = Break.create(review: "So great!", shelter_id: lovers_cabin.id, user_id: user3.id, rating: 6)

hike1 = Hike.create(trail_id: old.id, user_id: user1.id, rating: 7)
hike2 = Hike.create(trail_id: appalachian.id, user_id: user2.id, rating: 10)
hike3 = Hike.create(trail_id: billy.id, user_id: user3.id, rating: 6)
