class PicturesController < ApplicationController
  before_action :set_picture, only: %i[show edit update destroy]

  def index
    @pictures = Picture.all
    
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end

  def new
    if params[:commit] == "戻る"
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end
  end

  def edit; end

  def create
    @picture = current_user.pictures.build(picture_params)
    @commit_name = params[:commit]
    if @picture.save
        ContactMailer.contact_mail(@picture, @commit_name).deliver
        redirect_to pictures_path, notice: 'Picture was successfully created. 写真が投稿されました!'
    else
      
    end
  end

  def update
    if @picture.user_id == current_user.id
      respond_to do |format|
        if @picture.update(picture_params)
          format.html { redirect_to @picture, notice: 'Picture was successfully updated.' }
          format.json { render :show, status: :ok, location: @picture }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @picture.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def destroy
    @picture.destroy if @picture.user_id == current_user.id
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def picture_favorites
    @the_picture_favorites = current_user.favorites_pictures
  end

  private

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:image, :image_cache, :comment)
  end
end
