class AddBadgeRuleToBadge < ActiveRecord::Migration[5.1]
  def change
    add_reference :badges, :badge_rule, foreign_key: true
  end
end
