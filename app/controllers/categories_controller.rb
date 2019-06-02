class CategoriesController < ApplicationController

  before_action :category, only: %i[show new edit]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def update
    if category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category, notice: 'Category successfully created.'
    else
      render :new
    end
  end

  def destroy
    category.destroy

    redirect_to categories_path, notice: 'Category successfully deleted.'
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end

  def category
    @category ||= params[:id] ? Category.find(params[:id]) : Category.new
  end
end
