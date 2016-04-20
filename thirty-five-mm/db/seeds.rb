FILM_COUNT = 30
REVIEW_COUNT = 90
EXTRA_USER_COUNT = 15
USERNAMES = [["sober-santa", "lil-bog-gremlin@plague.org"],["OD Grouch", "basura_fashura@hotmail.com"], ["john case", "jc@example.com"]]
EXTRA_USER_NAMES = ["Tyler_Durden", "Travis_Bickle", "Sweeney_Todd", "The_Dude", "Hannibal_Lecter, Ph.D", "Verbal_Kint", "Jules_Winnfield", "Marty_McFly", "Princess_Leia", "Hermione_Granger", "Celie", "Sofia", "Shug", "Katniss", "Laura_Palmer"]

CATEGORIES = %w(action adventure animated artsy-fartsy avant-garde asteroids beach buddy comedy crime dance disaster documentary drama gangster hippie horror historical karate lifetime mocumentary musicals non-linear political psychological-dramas prison propoganda satire tyler-perryish-bullshit... weird)

USERNAMES.each do |u|
  User.create(
    username: u[0],
    email: u[1],
    password: "pw",
    password_encrypted: "pw"
    )
end

EXTRA_USER_COUNT.times do
  User.create(
    username: EXTRA_USER_NAMES.sample,
    email: Faker::Internet.safe_email,
    password: "pw"
    )
end

CATEGORIES.each do |c|
  Category.create(
    name: c
    )
end

n = -1
FILM_COUNT.times do
  Film.create(
    category_id: n += 1,
    title: Faker::Book.title,
    summary: Faker::Lorem.paragraphs(9),
    photo: "/images/gallows-poster.jpg")
end

REVIEW_COUNT.times do
  Review.create(
    film_id: rand(1..29),
    user_id: rand(1..17),
    content: Faker::Lorem.paragraph(rand(2..4)))
end

# Ratings for Films
FILMS= Film.all

FILMS.each do |f|
  f.ratings.build(
    user_id: rand(1..17),
    stars: rand(1..5)
    ).save
end

FILMS.each do |f|
  f.comments.build(
    user_id: rand(1..17),
    content: Faker::Lorem.paragraphs(4)
    ).save
end

# Ratings for Reviews
REVIEWS = Review.all
REVIEWS.each do |r|
  r.ratings.build(
    user_id: rand(1..17),
    stars: rand(1..5)
    ).save

end

# Comments for Reviews
REVIEWS.each do |r|
  r.comments.build(
    user_id: rand(1..17),
    content: Faker::Lorem.paragraph(rand(1..2))
    ).save
end
