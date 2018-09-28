class Badge < ApplicationRecord

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  belongs_to :badge_rule

  scope :backend_badge, -> { where(badge_rule_id: BadgeRule.backend) }
  scope :first_attempt_badge, -> { where(badge_rule_id: BadgeRule.first_attempt) }
  scope :by_such_level_badge, ->(level) { where(badge_rule_id: BadgeRule.by_such_level(level)) }

end
