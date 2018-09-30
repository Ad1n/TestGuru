class Badge < ApplicationRecord

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  scope :backend_badge, -> { where(rule_param: "all_backend") }
  scope :first_attempt_badge, -> { where(rule: "by_first_attempt") }
  scope :by_such_level_badge, ->(level) { where(rule_param: level.to_s) }

  end
