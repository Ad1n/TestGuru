class AddCategoryToTests < ActiveRecord::Migration[5.1]
  def change
    add_reference :tests, :category, foreign_key: true
  end
end
