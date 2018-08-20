class DropTablePassedTestLogs < ActiveRecord::Migration[5.1]
  def up
    drop_table :passed_test_logs, if_exists: true
  end
end
