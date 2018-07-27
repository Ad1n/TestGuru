class AddDefaultsValuesLevelAndCorrect < ActiveRecord::Migration[5.1]
  def change
    change_column :answers, :correct, :boolean, default: true
    change_column :tests, :level, :integer, default: 0
    # change_column_default(:answers, :correct, true)
    # change_column_default(:tests, :level, 0)
  end
end
