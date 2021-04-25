class GroupsController < ApplicationController
  before_action :require_login

  def index
    @groups = Group.all.includes(:user)
  end

  def new
    @group = current_user.groups.new

    @icons = [
      'https://cdn3.vectorstock.com/i/1000x1000/98/07/january-dates-flat-icon-with-long-shadow-vector-9319807.jpg',
      'https://cdn4.vectorstock.com/i/1000x1000/98/13/february-dates-flat-icon-with-long-shadow-vector-9319813.jpg',
      'https://cdn4.vectorstock.com/i/1000x1000/98/18/march-dates-flat-icon-with-long-shadow-vector-9319818.jpg',
      'https://cdn4.vectorstock.com/i/1000x1000/98/23/april-dates-flat-icon-with-long-shadow-vector-9319823.jpg',
      'https://cdn1.vectorstock.com/i/1000x1000/98/30/may-dates-flat-icon-with-long-shadow-vector-9319830.jpg',
      'https://cdn2.vectorstock.com/i/1000x1000/98/31/june-dates-flat-icon-with-long-shadow-vector-9319831.jpg',
      'https://cdn5.vectorstock.com/i/1000x1000/98/39/july-dates-flat-icon-with-long-shadow-vector-9319839.jpg',
      'https://cdn1.vectorstock.com/i/1000x1000/98/40/august-dates-flat-icon-with-long-shadow-vector-9319840.jpg',
      'https://cdn1.vectorstock.com/i/thumb-large/98/55/september-dates-flat-icon-with-long-shadow-vector-9319855.jpg',
      'https://cdn5.vectorstock.com/i/1000x1000/98/44/october-dates-flat-icon-with-long-shadow-vector-9319844.jpg',
      'https://cdn5.vectorstock.com/i/1000x1000/98/49/november-dates-flat-icon-with-long-shadow-vector-9319849.jpg',
      'https://cdn2.vectorstock.com/i/1000x1000/98/51/december-dates-flat-icon-with-long-shadow-vector-9319851.jpg'
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
