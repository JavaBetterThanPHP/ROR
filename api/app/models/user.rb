class User < ApplicationRecord
    acts_as_followable
    acts_as_follower
    has_many :posts
    has_secure_password
    has_many :favorites, through: :favorites, source: :posts
    has_many :bookmarks, through: :bookmarks, source: :posts
end
