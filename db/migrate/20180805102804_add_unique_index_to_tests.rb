class AddUniqueIndexToTests < ActiveRecord::Migration[5.1]
  def change
    add_index :tests, %i[level title], unique: true
  end
end
