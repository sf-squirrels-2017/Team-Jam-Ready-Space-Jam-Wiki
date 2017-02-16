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

c = Category.create!(name: "Toons")
Category.create!(name: "Humans")
Category.create!(name: "Soundtrack")
Category.create!(name: "Games")

u = User.create(username:"Bob", email:"robert@bob.com", password: "password", admin: false)

a = Article.create(creator_id: u.id, published:false,citation_required:false, category_id: c.id, article_title: "The Real Bugs Bunny", article_body: "What makes him tick? Does he eat more than one carrot a day?") #need to add current_edit_id
e = Edit.new(article_id: a.id, editor_id: u.id, edit_title: "The Real Bugs Bunny", edit_body: "What makes him tick? Does he eat more than one carrot a day?")
e.save

cit = Citation.create(body: "It doesn't matter!", article_id: a.id, user_id: u.id)
