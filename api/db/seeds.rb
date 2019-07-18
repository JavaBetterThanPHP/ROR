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
        password_digest: Faker::Internet.password(15,20,true,true),
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
        mainImage: Faker::Internet.url('picsum.photos','/400'),
        score: Faker::Number.between(13, 247),
        content: '{"blocks":[{"key":"aofhh","text":"Why ?","type":"unstyled","depth":0,"inlineStyleRanges":[{"offset":0,"length":5,"style":"BOLD"}],"entityRanges":[],"data":{}},{"key":"7tnmj","text":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed auctor tristique libero, quis facilisis erat convallis in. Fusce dictum risus eget dui ultricies, at porta odio semper. Curabitur a laoreet magna. Praesent eros ligula, porttitor sit amet vulputate et, ullamcorper eget purus. Cras ornare, massa ac mollis egestas, nunc tortor maximus mi, in finibus lectus mi in tortor. In vehicula sollicitudin justo non scelerisque. Morbi ac sem eget nisi sollicitudin tincidunt at nec nisl.","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}},{"key":"7lflq","text":"When ?","type":"unstyled","depth":0,"inlineStyleRanges":[{"offset":0,"length":6,"style":"BOLD"}],"entityRanges":[],"data":{}},{"key":"4m6b3","text":"Quisque eget turpis sit amet turpis iaculis laoreet. Fusce tincidunt non urna eget molestie. Morbi molestie condimentum mauris sagittis ultrices. Nunc at lorem ligula. Morbi vitae rhoncus eros. Sed egestas risus diam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Ut vestibulum sem sed purus posuere, et tempor nulla pellentesque. Etiam diam ante, pharetra ac auctor vel, ornare id leo. Vivamus non scelerisque massa. Integer eleifend ante orci, a dictum dui congue sed. Nam dapibus augue eget cursus elementum. Vestibulum justo ante, molestie sit amet malesuada ac, vestibulum ut mi. Sed eleifend quis leo a egestas. Curabitur facilisis nisi eu est ultrices pretium.","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}},{"key":"6jmau","text":"Anonymous.","type":"unstyled","depth":0,"inlineStyleRanges":[{"offset":0,"length":10,"style":"ITALIC"}],"entityRanges":[],"data":{}}],"entityMap":{}}',
        type: Type.find(Faker::Number.between(1,100)),
        user: User.find(Faker::Number.between(1,100))
    )
    post.tags << Tag.find(Faker::Number.between(1,100))
    post.tags << Tag.find(Faker::Number.between(1,100))
    post.tags << Tag.find(Faker::Number.between(1,100))
end

# 100.times do
#     user = User.find(Faker::Number.between(1,100))
#     user.favorites << Post.find(Faker::Number.between(1,100))
#     user.bookmarks << Post.find(Faker::Number.between(1,100))
#     user.favorites << Post.find(Faker::Number.between(1,100))
#     user.bookmarks << Post.find(Faker::Number.between(1,100))
#     user.follow(User.find(Faker::Number.between(1,100)))
#     user.follow(User.find(Faker::Number.between(1,100)))
#     user.follow(User.find(Faker::Number.between(1,100)))
# end

# Comment belongs to one user

#Create user json

# URL
# POST "/users/sign_up"
# Request body
# {
#     "email": "lorenzo.canavaggio@laposte.net",
#     "password": "porunga" ,
#     "birthdate": "Mar, 28 Mar 1991",
#     "description": "Web Developer",
#     "profilePictureUrl": "https://www.docker.com/sites/default/files/social/docker_facebook_share.png",
#     "inscriptionDate": "Mar, 28 Mar 1991",
#     "firstname": "Canavaggio",
#     "lastname": "Lorenzo"
# }