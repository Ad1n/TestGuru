class AddRuleParamToBadgeRules < ActiveRecord::Migration[5.1]
  def change
    add_column :badge_rules, :rule_param, :string
  end
end
