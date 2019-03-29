# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: "journalist@mail.se", password: "password", role: "journalist")
User.create(email: "visitor@mail.se", password: "password", role: "visitor")
User.create(email: "editor@mail.se", password: "password", role: "editor")

category_1 = Category.create(name: "lifestyle")
category_2 = Category.create(name: "breakingnews")
category_3 = Category.create(name: "politics")
category_4 = Category.create(name: "health")
category_5 = Category.create(name: "sports")

article_1 = Article.create(title: "Voted best mead recipe", lead: "Restaurant wins prize", content: "Restaurant wins prize for best mead in Sweden", user: user)
article_2 = Article.create(title: "Ancient viking grave discovered", lead: "Kids came across sword", content: "Kids come across sword protruding from the earth", user: user)
article_3 = Article.create(title: "New Prime Minister", lead: "Today is a new day", content: "The country is on a better path", user: user)
article_4 = Article.create(title: "Drinking wine improves general health", lead: "Drink wine today!", content: "Studies show that wine is good for your heart", user: user)
article_5 = Article.create(title: "Hammarby! Hammarby!", lead: "Best team ever!", content: "Home is where the heart is", user: user)

article_1.categories << category_1
article_2.categories << category_2
article_3.categories << category_3
article_4.categories << category_4
article_5.categories << category_5