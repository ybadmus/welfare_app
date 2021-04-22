class GroupsController < ApplicationController
  before_action :require_login

  def index
    @groups = Group.all.includes(:user)
    puts "Yusif"
    puts @groups
  end

  def new
    @group = current_user.groups.new

    @icons = [
      'https://www.flaticon.com/svg/static/icons/svg/926/926158.svg',
      'https://www.flaticon.com/svg/static/icons/svg/926/926151.svg',
      'https://www.flaticon.com/svg/static/icons/svg/926/926165.svg',
      'https://www.flaticon.com/svg/static/icons/svg/926/926161.svg',
      'https://www.flaticon.com/svg/static/icons/svg/926/926134.svg',
      'https://www.flaticon.com/svg/static/icons/svg/926/926133.svg'
    ]
  end

  def show
    @group = Group.find(params[:id])
  end

  def create
    @group = current_user.groups.new(group_params)

    if @group.save
      redirect_to groups_path, notice: 'Group was successfully created.'
    else
      flash[:alert] = @group.errors.full_messages.first
      redirect_to new_group_path
    end
  end

  private
  
  def group_params 
    params.require(:group).permit(:name, :icon)
  end
end