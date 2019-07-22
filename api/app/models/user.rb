class User < ApplicationRecord
    acts_as_followable
    acts_as_follower
    has_many :posts, dependent: :destroy
    has_secure_password
    has_many :favorite_posts, dependent: :destroy
    has_many :favorites, through: :favorite_posts, source: :post
    has_many :bookmark_posts, dependent: :destroy
    has_many :bookmarks, through: :bookmark_posts, source: :post
end
