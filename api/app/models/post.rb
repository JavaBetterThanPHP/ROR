class Post < ApplicationRecord
  belongs_to :user
  belongs_to :type
  has_and_belongs_to_many :tags
  has_many :comments
  has_many :favorite_posts, dependent: :destroy
  has_many :favorited_by, through: :favorite_posts, source: :user
  has_many :bookmark_posts, dependent: :destroy
  has_many :bookmarked_by, through: :bookmark_posts, source: :user
end