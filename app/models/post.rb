class Post < ApplicationRecord
  belongs_to :user
  has_many :sections, dependent: :destroy

  validates_presence_of :title, :content

  enum :status, [:draft, :published, :archived]

  accepts_nested_attributes_for :sections, reject_if: -> (attributes) { attributes['content'].blank? }
end
