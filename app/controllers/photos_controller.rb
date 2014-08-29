class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def new
    @user = User.find(params[:user_id])
    @photo = @user.photos.new
  end

  def create
    @user = User.find(params[:user_id])
    @photo = @user.photos.new(photo_params)
    if @photo.save
      redirect_to user_photo_path(@user, @photo), notice: "Photo uploaded"
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:user_id])
    @photo = @user.photos.find(params[:id])
  end

private
  def photo_params
    params.require(:photo).permit(:photo, :description, :user_id)
  end
end
