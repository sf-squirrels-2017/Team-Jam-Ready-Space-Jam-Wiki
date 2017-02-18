# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Article.destroy_all
Edit.destroy_all
Citation.destroy_all
Category.destroy_all


hum = Category.create!(name: "Humans")
sound = Category.create!(name: "Soundtrack")
games = Category.create!(name: "Games")

c = Category.create!(name: "Toons")

u = User.create(username:"Bob", email:"robert@bob.com", password: "password", admin: false)
becca = User.create(username:"Becca", email:"becca@b.com", password: "password", admin: false)
george = User.create(username:"George", email:"george@g.com", password:"password", admin: false)
matt = User.create(username:"Matt", email:"matt@m.com", password:"password", admin: false)
lisa = User.create(username:"Lisa", email:"lisa@l.com", password:"password", admin: false)
users = []
users << becca
users << george
users << matt
users << lisa

a = Article.create(creator_id: u.id, published:false,citation_required:false, category_id: c.id, article_title: "The Real Bugs Bunny", article_body: "What makes him tick? Does he eat more than one carrot a day?") #need to add current_edit_id
e = Edit.new(article_id: a.id, editor_id: u.id, edit_title: "The Real Bugs Bunny", edit_body: "What makes him tick? Does he eat more than one carrot a day?")
e.save

cit = Citation.create(body: "It doesn't matter!", article_id: a.id, user_id: u.id)


toons = []
toons << "Lola Bunny"
toons << "Bupkus"
toons << "Blanko"
things = ["Everything you need to know about", "Alternative facts about", "3 things you'd never guess about", "A guide to"]
humans = ["Bill Murray", "Stan Podolak", "Michael Jordan"]
sounds = ["All of My Days", "Fly Like an Eagle", "Space Jam", "That's the Way"]
desc = ["Magic", "Origins", "Inspiration Behind"]
gs = ["Space Jam Pin Ball", "Space Jam PlayStation", "Space Jam Sims"]

3.times do   
  Article.create(creator_id: users.sample.id, 
    published:false, 
    citation_required:false, 
    category_id:c.id, 
    article_title: "#{things.sample} #{toons.sample}.",
    article_body: Faker::Lorem::paragraph(3)  )

  Article.create(creator_id: users.sample.id, 
    published:false, 
    citation_required:false, 
    category_id:hum.id, 
    article_title: "#{things.sample} #{humans.sample}.",
    article_body: Faker::Lorem::paragraph(3)  )

  Article.create(creator_id: users.sample.id, 
    published:false, 
    citation_required:false, 
    category_id:sound.id, 
    article_title: "The Secret #{desc.sample} of #{sounds.sample}",
    article_body: Faker::Lorem::paragraph(3)  )

  Article.create(creator_id: users.sample.id, 
    published:false, 
    citation_required:false, 
    category_id:games.id, 
    article_title: "#{gs.sample}.",
    article_body: Faker::Lorem::paragraph(3)  )
end









