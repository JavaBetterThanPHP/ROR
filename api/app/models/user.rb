class User < ApplicationRecord
    acts_as_followable
    acts_as_follower
    has_many :favorites, class_name: 'Post'
    has_many :bookmarks, class_name: 'Post'
    has_many :posts
    has_secure_password
end
