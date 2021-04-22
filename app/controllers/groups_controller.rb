class GroupsController < ApplicationController
  before_action :require_login

  def index
    @groups = Group.all.includes(:user)
  end

  def new
    @group = current_user.groups.new
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