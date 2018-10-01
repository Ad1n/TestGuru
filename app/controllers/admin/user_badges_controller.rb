class Admin::UserBadgesController < Admin::BaseController

  before_action :set_user_badge, only: :destroy

  def index
    @user_badges = UserBadge.all
  end

  def destroy
    @user_badge.destroy
    redirect_to admin_user_badges_path, notice: "Successfully destroyed !"
  end

  private

  def set_user_badge
    @user_badge = UserBadge.find(params[:id])
  end

end
