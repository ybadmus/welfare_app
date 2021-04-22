class WelfaresController < ApplicationController
  before_action :require_login

  def index
    @welfares = if params[:external]
                  current_user.welfares.not_grouped.includes(:groups)
                else 
                  current_user.welfares.includes() 
                end
  end

  
end