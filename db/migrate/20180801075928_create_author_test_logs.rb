class CreateAuthorTestLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :author_test_logs do |t|
      t.timestamps
    end
    add_reference :author_test_logs, :test, foreighn_key: true
    add_reference :author_test_logs, :user, foreighn_key: true
  end
end
