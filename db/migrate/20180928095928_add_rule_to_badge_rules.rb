class AddRuleToBadgeRules < ActiveRecord::Migration[5.1]
  def change
    add_column :badge_rules, :rule, :string
  end
end
