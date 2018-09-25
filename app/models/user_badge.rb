class UserBadge < ApplicationRecord
  belongs_to :user
  belongs_to :badge

  def self.current_user_badges(current_user)
    where(user_id: current_user&.id)
  end

end
