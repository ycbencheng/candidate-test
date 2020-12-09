#editor
User.create!(email: 'editor@test.com', password: '123456', role: 1)
User.create!(email: 'secondeditor@test.com', password: '123456', role: 1)

#user
User.create!(email: 'user@test.com', password: '123456', role: 0)
User.create!(email: 'seconduser@test.com', password: '123456', role: 0)

#admin
User.create!(email: 'admin@test.com', password: '123456', role: 2)
User.create!(email: 'secondadmin@test.com', password: '123456', role: 2)

Article.create!(title: Faker::Book.title, content: Faker::Quote.matz, category: 'Technology', user_id: 1)
Article.create!(title: Faker::Book.title, content: Faker::Quote.matz, category: 'Technology', user_id: 2)
Article.create!(title: Faker::Book.title, content: Faker::Quote.matz, category: 'Travel', user_id: 2)
Article.create!(title: Faker::Book.title, content: Faker::Quote.matz, category: 'Technology', user_id: 1)
Article.create!(title: Faker::Book.title, content: Faker::Quote.matz, category: 'Travel', user_id: 2)
Article.create!(title: Faker::Book.title, content: Faker::Quote.matz, category: 'Technology', user_id: 1)
Article.create!(title: Faker::Book.title, content: Faker::Quote.matz, category: 'Technology', user_id: 1)
Article.create!(title: Faker::Book.title, content: Faker::Quote.matz, category: 'Travel', user_id: 2)
Article.create!(title: Faker::Book.title, content: Faker::Quote.matz, category: 'Technology', user_id: 1)
Article.create!(title: Faker::Book.title, content: Faker::Quote.matz, category: 'Art', user_id: 1)
Article.create!(title: Faker::Book.title, content: Faker::Quote.matz, category: 'Travel', user_id: 2)
Article.create!(title: Faker::Book.title, content: Faker::Quote.matz, category: 'Art', user_id: 2)
Article.create!(title: Faker::Book.title, content: Faker::Quote.matz, category: 'Technology', user_id: 1)
Article.create!(title: Faker::Book.title, content: Faker::Quote.matz, category: 'Art', user_id: 2)
Article.create!(title: Faker::Book.title, content: Faker::Quote.matz, category: 'Technology', user_id: 1)
Article.create!(title: Faker::Book.title, content: Faker::Quote.matz, category: 'Travel', user_id: 1)
Article.create!(title: Faker::Book.title, content: Faker::Quote.matz, category: 'Technology', user_id: 2)
Article.create!(title: Faker::Book.title, content: Faker::Quote.matz, category: 'Art', user_id: 1)
Article.create!(title: Faker::Book.title, content: Faker::Quote.matz, category: 'Travel', user_id: 1)
Article.create!(title: Faker::Book.title, content: Faker::Quote.matz, category: 'Technology', user_id: 2)
