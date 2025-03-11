class Post < ApplicationRecord
  enum :status, [:draft, :published, :archived]
end
