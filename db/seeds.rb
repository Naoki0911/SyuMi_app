# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


5.times do |n|
  User.create!(
    name: "User#{n + 1}",
    email: "user#{n + 1}@example.com",
    password: "password",
    introduction: "Hi, I'm User#{n + 1}",
    recommend: "Sake #{n + 1}"
  )
end

# Sakes
users = User.all
5.times do |n|
  sake = Sake.create!(
    name: "Sake#{n + 1}",
    content: "This is a description for Sake#{n + 1}.",
    place: "Place#{n + 1}",
    sweetness: n,
    flavor: n,
    sour: n,
    feeling: n,
    rich: n,
    user: users.sample
  )

  # Labels
  Label.create!(feature: "Label#{n + 1}")

  # Comments
  Comment.create!(
    reply: "This is a comment on Sake#{n + 1}.",
    sake: sake,
    user: users.sample
  )

  # Favorites
  Favorite.create!(user: users.sample, sake: sake)

  # Relationships
  follower = users.sample
  followed = users.sample
  follower.follow(followed) unless follower.following?(followed) || follower == followed
end

# Labelings
sakes = Sake.all
labels = Label.all
5.times do
  Labeling.create!(
    sake: sakes.sample,
    label: labels.sample
  )
end
