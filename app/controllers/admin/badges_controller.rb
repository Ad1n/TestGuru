class Admin::BadgesController < Admin::BaseController

  before_action :set_badge, only: %i[update destroy edit]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def edit

  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path, notice: "Successfully created !"
    else
      render 'new'
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path, notice: "Successfully updated !"
    else
      render 'edit'
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path, notice: "Successfully destroyed !"
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :picture)
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end

end