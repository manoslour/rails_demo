class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    commentable = @comment.commentable
    if commentable.is_a?(Post) && commentable.draft?
      return redirect_to root_path, notice: "Something went wrong"
    end
    if @comment.save
      redirect_to post_path(@comment.commentable), notice: "Comment created successfully"
    else
      redirect_to post_path(@comment.commentable), alert: "Comment could not be created"
    end
  end

  def destroy

  end

  private

  def comment_params
    params.expect(comment: [:content, :commentable_type, :commentable_id])
  end
end
