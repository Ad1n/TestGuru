class AddRuleAndRuleParamToBadges < ActiveRecord::Migration[5.1]
  def change
    add_column :badges, :rule, :string
    add_column :badges, :rule_param, :string
  end
end
