class UsersController < ApplicationController
  #skip_before_action :verify_authenticity_token

  def show
    @user = current_user
  end

  def new 

    @user = User.new
    @icons = [
      'https://www.flaticon.com/svg/vstatic/svg/3891/3891991.svg?token=exp=1619183769~hmac=9a922c2cd2e4255612536e74ecb142f6',
      'https://www.flaticon.com/svg/vstatic/svg/3135/3135789.svg?token=exp=1619184011~hmac=6e13a5ee1497193a204d4ce1672a7958',
    ]
  end

  def create 
    @user = User.create(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to menu_path
    else
      flash[:alert] = @user.errors.full_messages[0]
      redirect_to new_user_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :icon)
  end

end