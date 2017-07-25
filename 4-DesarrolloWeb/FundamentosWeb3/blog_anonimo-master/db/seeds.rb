10.times do
  Post.create(title: Faker::Book.title, body: Faker::Lorem.paragraph, author: Faker::Book.author)
end