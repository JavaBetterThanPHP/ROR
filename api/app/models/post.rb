class Post < ApplicationRecord
  belongs_to :user
  belongs_to :type
  has_and_belongs_to_many :tags
  has_many :comments
end