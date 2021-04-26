class ContributorsController < ApplicationController
  before_action :require_login

  def index
    @welfare = Contributor.all
  end

  def new
    @welfare = Contributor.new
  end

  def create
    @contributor = Contributor.create(contributor_params)

    if @contributor.save
      redirect_to contributor_path, notice: 'New welfare contributor created.'
    else
      flash.now[:alert] = @contributor.errors.full_messages.first
      render :new
    end
  end

  private

  def contributor_params
    params.require(:welfare).permit(:name, :phonenumber, :contributor_no)
  end
end