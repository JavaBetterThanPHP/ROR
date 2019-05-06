# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

100.times do
    User.create(
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
        name: Faker::ProgrammingLanguage.name,
    )
end