class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :login_required, only: %i[new create]

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def edit
    @user.user_name = current_user.user_name
    @user.email = current_user.email
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def update
    if @user.id == current_user.id
      respond_to do |format|
        @user.update_column(:email, params[:user][:email].downcase)
        if @user.update(update_params)
          
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def destroy
    if @user.id == current_user.id
      @user.destroy
      respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
      end
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :user_name,
      :email,
      :password,
      :password_confirmation,
      :my_image
    )
  end
end
