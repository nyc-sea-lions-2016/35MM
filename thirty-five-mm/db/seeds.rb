# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: "username", email: "user@example.com", password: "pw")

Category.create(name: "category 1")

Film.create(category_id: 1, title: "test film", summary: "summary iehoiehfioehfoiq ieghie w ieghio we oweih", photo: "http://guides.rubyonrails.org/images/has_many_through.png")

Review.create(film_id: 1, user_id: 1, content: "review content fhoweh eiwhg owiehiohg oiweh ioewh giowe iewg ioewh oiewgio ioe4whgiwo iowefh wiohg iwejg wegj wep gwoeihjgwie ewioj weoigj we")

Review.first.ratings.build(user_id: 1, stars: 3)


USER_COUNT = 3
CATEGORY_COUNT = 10
FILM_COUNT = 30
REVIEW_COUNT = 90

