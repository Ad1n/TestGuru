class AddUserToTest < ActiveRecord::Migration[5.1]
  def change
    #add_reference :tests, :user, foreign_key: { to_table: :users }
    add_reference :tests, :user, foreign_key: true
  end
end
