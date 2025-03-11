class Post < ApplicationRecord
  validates_presence_of :title, :content

  enum :status, [:draft, :published, :archived]
end
