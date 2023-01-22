# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

tabcons = []
tabtype = []
Article.typeofgames.each do |x, y|
    tabtype << x
end
Article.consoles.each do |x, y|
    tabcons << x
end

10.times do
    User.create!(first_name: Faker::JapaneseMedia::DragonBall.character, last_name: Faker::JapaneseMedia::DragonBall.race, email: Faker::Internet.email, description: Faker::JapaneseMedia::OnePiece.akuma_no_mi, password: Faker::Internet.password(min_length: 8))
end

10.times do
    Article.create!(title: Faker::Fantasy::Tolkien.character, content: Faker::Fantasy::Tolkien.poem, price: rand(1..500), typeofgame: tabtype.sample, console: tabcons.sample, seller: User.all.sample)
end
