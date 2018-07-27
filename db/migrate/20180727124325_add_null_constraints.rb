class AddNullConstraints < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:answers, :body, false)
    change_column_null(:categories, :title, false)
    change_column_null(:questions, :body, false)
    change_column_null(:tests, :title, false)
    change_column_null(:users, :name, false)
    change_column_null(:users, :login, false)
    change_column_null(:users, :password, false)
  end
end
