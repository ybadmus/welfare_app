class ContributorsController < ApplicationController
  before_action :require_login
  before_action :initialize_values

  def index
    @contributors = Contributor.all
  end

  def new
    @contributor = Contributor.new
    @icons = [
      'https://www.flaticon.com/svg/static/icons/svg/3891/3891991.svg',
      'https://www.flaticon.com/svg/static/icons/svg/3135/3135789.svg'
    ]
  end

  def create
    @contributor = Contributor.create(contributor_params)

    if @contributor.save
      redirect_to contributors_path, notice: 'New welfare contributor created.'
    else
      flash.now[:alert] = @contributor.errors.full_messages.first
      render :new
    end
  end

  private

  def contributor_params
    params.require(:contributor).permit(:name, :phonenumber, :contributor_no)
  end

  def initialize_values
    @contributor = Contributor.new
    @icons = [
      'https://www.flaticon.com/svg/static/icons/svg/3891/3891991.svg',
      'https://www.flaticon.com/svg/static/icons/svg/3135/3135789.svg'
    ]
  end
end