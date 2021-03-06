class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :require_login, :logged_out?

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def require_login
    if logged_in?
      true
    else
      redirect_to login_path
    end
  end

  def already_logged_in
    if logged_in?
      redirect_to menu_path
    else
      true
    end
  end
end
