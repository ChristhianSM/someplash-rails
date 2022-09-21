class CategoriesController < ApplicationController
  def index
    @categories = Category.order(id: :asc)
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
    @photos = @category.photos.order(id: :asc)
    @comments = @category.comments
  end

  def create
    @category = Category.create(category_param)
    if @category.save
      redirect_to categories_path
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_param)
      redirect_to categories_path
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, status: :see_other
  end

  private

  def category_param
    params.require(:category).permit(:name, :description, :cover)
  end
end
