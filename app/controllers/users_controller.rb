class UsersController < ApplicationController
  #skip_before_action :verify_authenticity_token

  def show
    @user = current_user
  end

  def new 
    @user = User.new
    @icons = [
      'https://www.flaticon.com/svg/static/icons/svg/1869/1869342.svg',
      'https://www.flaticon.com/svg/static/icons/svg/1869/1869616.svg',
      'https://www.flaticon.com/svg/static/icons/svg/1869/1869436.svg',
      'https://www.flaticon.com/svg/static/icons/svg/1869/1869387.svg',
      'https://www.flaticon.com/svg/static/icons/svg/1869/1869393.svg',
      'https://www.flaticon.com/svg/static/icons/svg/1869/1869359.svg'
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
    params.require(:user).permit(:username)
  end

end