class CreatePassedTestLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :passed_test_logs do |t|
      t.boolean :passed, null: false, default: false
      t.timestamps
    end

    add_reference :passed_test_logs, :user, foreign_key: true
    add_reference :passed_test_logs, :test, foreign_key: true
  end
end
