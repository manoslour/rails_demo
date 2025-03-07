class Post < ApplicationRecord

  validates :content, presence: true

  belongs_to :user

  has_many :comments
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
end
