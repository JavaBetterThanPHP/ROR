class Post < ApplicationRecord
  belongs_to :user
  belongs_to :type
  has_and_belongs_to_many :tags
  has_many :comments
  has_many :favorites, through: :favorites, source: :users
  has_many :bookmarks, through: :bookmarks, source: :users
end