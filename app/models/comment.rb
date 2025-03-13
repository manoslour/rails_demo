class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  after_create :broadcast_comment

  private

  def broadcast_comment
    self.broadcast_prepend_to [self.commentable, :comments], target: 'comments', partial: "comments/comment", locals: { comment: self }
  end
end
