# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

k = User.create!(name: "Kyle", email: "kyle@example.com", password: "colorado")
s = User.create!(name: "Stan", email: "stan@example.com", password: "colorado")
q = Question.create!(user: k, query: "Where am I?", description: "Seriously, you guys!", upvotes: 5, downvotes: 2)
a = Answer.create!(question: q, user: s, description: "Imagination Land", accepted: true, upvotes: 30, downvotes: 6)
