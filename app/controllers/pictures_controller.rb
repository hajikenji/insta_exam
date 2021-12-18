class PicturesController < ApplicationController
  before_action :set_picture, only: %i[show edit update destroy]

  # GET /pictures or /pictures.json
  def index
    @pictures = Picture.all
    
  end

  # GET /pictures/1 or /pictures/1.json
  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def confirm
    @picture = Picture.new(picture_params)
  end

  # GET /pictures/new
  def new
    @picture = Picture.new
  end

  # GET /pictures/1/edit
  def edit; end

  # POST /pictures or /pictures.json
  def create
    @picture = current_user.pictures.build(picture_params)
    @commit_name = params[:commit]
    if @picture.save
        ContactMailer.contact_mail(@picture, @commit_name).deliver
        redirect_to pictures_path, notice: 'Picture was successfully created. 写真が投稿されました!'
    end
    # respond_to do |format|
    #   if @picture.save
    #     ContactMailer.contact_mail(@picture, @commit_name).deliver
    #     redirect_to pictures_path, notice: 'Contact was successfully created.'
    #     format.html { redirect_to @picture, notice: 'Picture was successfully created.' }
    #     format.json { render :show, status: :created, location: @picture }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @picture.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /pictures/1 or /pictures/1.json
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

  # DELETE /pictures/1 or /pictures/1.json
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

  # Use callbacks to share common setup or constraints between actions.
  def set_picture
    @picture = Picture.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def picture_params
    params.require(:picture).permit(:image, :image_cache, :comment)
  end
end
