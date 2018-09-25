class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :picture, null: false

      t.timestamps
    end
  end
end
