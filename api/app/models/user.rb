class User < ApplicationRecord
    acts_as_followable
    acts_as_follower
    has_many :posts
end
