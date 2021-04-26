class WelfaresController < ApplicationController
  before_action :require_login
  before_action :initialize_values

  def index
    @welfares = if params[:external]
                  current_user.welfares.not_grouped.includes(:groups)
                else
                  current_user.welfares.includes(:groups)
                end
  end

  def new
    @welfare = current_user.welfares.new
    @groups = [["Select group", ""]]
    Group.all.each { |item| @groups << [item.name, item.id] }
  end

  def create
    @welfare = current_user.welfares.build(welfare_params)

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
    params.require(:welfare).permit(:contributor_no, :name, :amount, :remark)
  end

  def initialize_values
    @welfare = current_user.welfares.new
    @groups = [["Select group", ""]]
    Group.all.each { |item| @groups << [item.name, item.id] }
  end
end
