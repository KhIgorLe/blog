class PostsController < ApplicationController
  before_action :post, only: %i[show]

  def show
  end

  def create
    @post = category.posts.new(post_params)
    @post.save
  end

  def update
    post.update(post_params)

    @category = post.category
  end

  def destroy
    post.destroy
  end

  private

  def category
    @category ||= params[:category_id] ? Category.find(params[:category_id]) : post.category
  end

  def post
    @post ||= params[:id] ? Post.find(params[:id]) : category.posts.new
  end

  helper_method :post, :category

  def post_params
    params.require(:post).permit(:name, :content, :file)
  end
end
