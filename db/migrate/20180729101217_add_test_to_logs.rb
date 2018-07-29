class AddTestToLogs < ActiveRecord::Migration[5.1]
  def change
    add_reference :logs, :test, foreign_key: true
  end
end
