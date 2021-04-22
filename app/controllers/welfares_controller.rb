class WelfaresController < ApplicationController
  before_action :require_login

  def index
    @welfares = if params[:external]
                  current_user.welfares.not_grouped.includes(:groups)
                else 
                  current_user.welfares.includes(:groups) 
                end
  end

  def new
    @exercise = current_user.welfares.new
  end

  def create
    @welfare = current_user.welfares.new(welfare_params)

    if @welfare.save
      unless params[:welfare][:group] == ''
        Group.find(params[:welfare][:group]).welfares << @welfare
        return redirect_to group_path(params[:welfare][:group]),
                           notice: 'Welfare successfully added.'
      end
      redirect_to welfares_path(external: true), notice: 'Welfare successfully created.'
    else
      flash.now[:alert] = @welfare.errors.full_messages.first
      render :new
    end
  end

  private

  def welfare_params
    params.require(:welfare).permit(:name, :amount)
  end

end