# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

k = User.create!(name: "Kyle", email: "kyle@example.com", password: "colorado")
s = User.create!(name: "Stan", email: "stan@example.com", password: "colorado")
q = Question.create!(user: k, query: "Where am I?", description: "Seriously, you guys!", upvotes: 5, downvotes: 2, votes_quality: 3)
q2 = Question.create!(user: k, query: "What day is it?", description: "I really can't remember", upvotes: 35, downvotes: 2, votes_quality: 33)
Answer.create!(question: q, user: s, description: "Imagination Land", accepted: true, upvotes: 30, downvotes: 6, votes_quality: 24)
Answer.create!(question: q, user: s, description: "Canada", accepted: true, upvotes: 50, downvotes: 6, votes_quality: 44)
