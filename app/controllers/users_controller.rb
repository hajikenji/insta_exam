class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :login_required, only: %i[new create]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show; end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user.user_name = current_user.user_name
    @user.email = current_user.email
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    if @user.save # 保存の成功した場合の処理
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
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

  # DELETE /users/1 or /users/1.json
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

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(
      :user_name,
      :email,
      :password,
      :password_confirmation,
      :my_image
    )
  end

  def update_params
    params.require(:user).permit(
      :user_name,
      :password,
      :password_confirmation,
      :my_image
    )
  end
end
