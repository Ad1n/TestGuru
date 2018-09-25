class Badge < ApplicationRecord

  before_destroy :del_user_badges

  has_many :user_badges
  has_many :users, through: :user_badges

  private

  def del_user_badges
    user_badges.destroy_all
  end

end
