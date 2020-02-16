
Article.destroy_all
User.destroy_all
Category.destroy_all



editor1 = User.create!(email: 'editor1@test.com', password:'test123', editor: true)
editor2 = User.create!(email: 'editor2@test.com', password: 'test123', editor: true)

admin = User.create!(email: 'admin@test.com', password: 'test123', admin: true)

user1 = User.create!(email: 'user@test.com', password: 'test123')

travel = Category.create!(name: 'travel')
sports = Category.create!(name: 'sports')
adventure = Category.create!(name: 'adventure')


Article.create!(title: Faker::Music::RockBand.name, content: Faker::Lorem.sentence, category: travel, user: User.second)
Article.create!(title: Faker::Music::RockBand.name, content: Faker::Lorem.sentence, category: adventure, user: User.first)
Article.create!(title: Faker::Music::RockBand.name, content: Faker::Lorem.sentence, category: travel, user: User.second)
Article.create!(title: Faker::Music::RockBand.name, content: Faker::Lorem.sentence, category: travel, user: User.first)
Article.create!(title: Faker::Music::RockBand.name, content: Faker::Lorem.sentence, category: sports, user: User.first)
Article.create!(title: Faker::Music::RockBand.name, content: Faker::Lorem.sentence, category: travel, user: User.second)
Article.create!(title: Faker::Music::RockBand.name, content: Faker::Lorem.sentence, category: travel, user: User.first)
Article.create!(title: Faker::Music::RockBand.name, content: Faker::Lorem.sentence, category: travel, user: User.first)
Article.create!(title: Faker::Music::RockBand.name, content: Faker::Lorem.sentence, category: travel, user: User.second)
Article.create!(title: Faker::Music::RockBand.name, content: Faker::Lorem.sentence, category: travel, user: User.first)
Article.create!(title: Faker::Music::RockBand.name, content: Faker::Lorem.sentence, category: travel, user: User.second)
Article.create!(title: Faker::Music::RockBand.name, content: Faker::Lorem.sentence, category: travel, user: User.first)
