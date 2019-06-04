class CommentsController < ApplicationController
  before_action :set_commentable, only: :create

  def create
    @comment = @commentable.comments.create(comment_params)
  end

  private

  def set_commentable
    @commentable = Category.find_by(id: params[:category_id]) || Post.find_by(id: params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :author)
  end
end
