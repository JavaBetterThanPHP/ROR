# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

100.times do
    user = User.create(
        email: Faker::Internet.safe_email,
        password: Faker::Internet.password(15,20,true,true),
        birthdate: Faker::Date.birthday(18,65),
        description: Faker::Lorem.sentence(15),
        profilePictureUrl: Faker::Internet.url,
        inscriptionDate: Faker::Date.birthday(1,10),
        firstname: Faker::Name.first_name,
        lastname: Faker::Name.last_name
    )
end

100.times do
    Type.create(
        name: Faker::ProgrammingLanguage.name,
        description: Faker::Lorem.sentence(15)
    )
end

100.times do
    Tag.create(
        name: Faker::ProgrammingLanguage.name
    )
end

100.times do
    post = Post.create(
        title: Faker::Lorem.sentence(15),
        description: Faker::Lorem.sentence(30),
        date: Faker::Date.birthday(1,10),
        timeToRead: Faker::Number.between(3,12),
        mainImage: Faker::Internet.url,
        score: Faker::Number.between(13, 247),
        content: Faker::Books::Lovecraft.paragraphs(5),
        type: Type.find(Faker::Number.between(1,100)),
        user: User.find(Faker::Number.between(1,100))
    )
    post.tags << Tag.find(Faker::Number.between(1,100))
    post.tags << Tag.find(Faker::Number.between(1,100))
    post.tags << Tag.find(Faker::Number.between(1,100))
end

500.times do
    user = User.find(Faker::Number.between(1,100))
    user.favorites << Post.find(Faker::Number.between(1,100))
    user.bookmarks << Post.find(Faker::Number.between(1,100))
    user.favorites << Post.find(Faker::Number.between(1,100))
    user.bookmarks << Post.find(Faker::Number.between(1,100))
    user.follow(User.find(Faker::Number.between(1,100)))
    user.follow(User.find(Faker::Number.between(1,100)))
    user.follow(User.find(Faker::Number.between(1,100)))
end

# Comment belongs to one user