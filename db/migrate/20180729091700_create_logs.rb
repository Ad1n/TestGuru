class CreateLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :logs do |t|
      t.boolean :passed, null: false, default: false
      t.timestamps
    end
  end
end
