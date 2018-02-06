# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Reviewer.destroy_all
reviewers = Reviewer.create! [
 { name: "Joe", password: "abc123" },
 { name: "Jim", password: "123abc" }
]
Book.destroy_all
Book.create! [
 { name: "Eloquent Ruby", author: "Russ Olsen", reviewer:
reviewers.sample},
 { name: "Beginning Ruby", author: "Peter Cooper", reviewer:
reviewers.sample},
 { name: "Metaprogramming Ruby", author: "Paolo Perrotta", reviewer:
reviewers.sample},
 { name: "Design Patters in Ruby", author: "Russ Olsen", reviewer:
reviewers.sample},
 { name: "The Ruby Programming Language", author: "David Flanagen",
reviewer: reviewers.sample}
]
b = Book.find_by(name: "Eloquent Ruby")
b.notes.create! [
 { title: "Wow", note: "Gran libro para aprender Ruby" },
 { title: "Great", note: "Pefecto para iniciarte" }
]
