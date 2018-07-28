class NullFalseForCorrectInAnswers < ActiveRecord::Migration[5.1]
  def change
    change_column :answers, :correct, :boolean, null: false, default: true
  end
end
