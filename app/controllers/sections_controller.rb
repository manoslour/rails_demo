class SectionsController < ApplicationController
  def new
    @post = Post.find(params[:id])
    @section = @post.sections.build
  end
end
