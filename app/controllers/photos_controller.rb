class PhotosController < ApplicationController
  def index; end

  def new
    @photo = Photo.new
    @category = Category.find(params[:category_id])
  end

  def show
    @photo = Photo.find(params[:id])
    @comment = Comment.new
    @comments = @photo.comments
    @category = Category.find(@photo[:category_id])
  end

  def create
    @photo = Photo.create(photo_params)
    if @photo.save
      redirect_to category_path(@photo.category)
    else
      @category = Category.find(params["photo"]["category_id"])
      render "new", status: :unprocessable_entity
    end
  end

  def edit
    @photo = Photo.find(params[:id])
    @category = Category.find(params[:category_id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      redirect_to category_path
    else
      @category = Category.find(params["photo"]["category_id"])
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @category = Category.find(params[:category_id])
    @photo.destroy
    redirect_to category_path(@category), status: :see_other
  end

  def page_search
    puts "-------------------------"
    puts "Parametrossss"
    p params
    puts "-------------------------"
    @photos_found = []
    @empty = false
    @no_results = false
    if params[:search]
      return if params[:search].nil?

      @empty = true if params[:search].empty?

      unless @empty
        query = params[:search].downcase
        @photos_found = Photo.where("LOWER(title) LIKE ?", "%#{query}%")

        @no_results = true if @photos_found.length.zero?

      end
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description, :image, :category_id)
  end
end
