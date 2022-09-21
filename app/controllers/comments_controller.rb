class CommentsController < ApplicationController
  def create
    if params[:photo_id]
      @photo = Photo.find(params[:photo_id])
      @comment = @photo.comments.create(body: params[:body])
      if @comment.save
        redirect_to photo_path(@photo)
      else
        redirect_to photo_path(@photo), status: :unprocessable_entity
      end
    elsif params[:category_id]
      @category = Category.find(params[:category_id])
      @comment = @category.comments.create(body: params[:body])
      if @comment.save
        redirect_to category_path(@category)
      else
        # puts " ================================="
        # render "new", status: :unprocessable_entity
        redirect_to category_path(@category), status: :unprocessable_entity
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if params[:photo_id]
      @photo = Photo.find(params[:photo_id])
      @comment.destroy
      redirect_to photo_path(@photo), status: :see_other
    else
      @category = Category.find(params[:category_id])
      @comment.destroy
      redirect_to category_path(@category), status: :see_other
    end
  end
end
