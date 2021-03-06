class SessionsController < ApplicationController
  before_action :require_login, only: %i[destroy show]
  before_action :already_logged_in, only: %i[new]

  def index; end

  def show
    @user = current_user
  end

  def new; end

  def create
    @user = User.find_by(username: params[:username])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = 'Succesfully logged in'
      redirect_to menu_path
    else
      flash.now[:alert] = 'Please enter a valid username'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Succesfully logged out'
    redirect_to root_path
  end
end
