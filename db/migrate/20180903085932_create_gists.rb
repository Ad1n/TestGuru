class CreateGists < ActiveRecord::Migration[5.1]
  def change
    create_table :gists do |t|
      t.belongs_to :question, index: true
      t.string :gist_url, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
