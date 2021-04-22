class UsersController < ApplicationController

  def new 
    @user = User.new
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