class AddTestTimeToTests < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :test_time, :time
  end
end
