class CreateGists < ActiveRecord::Migration[5.1]
  def change
    create_table :gists do |t|
      t.string :question
      t.string :question_id, null: false
      t.string :gist_url, null: false
      t.string :email
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
