class Test < ApplicationRecord
  belongs_to :category
  has_many :questions

  has_many :passed_test_logs
  has_many :users, through: :passed_test_logs

  def self.by_categories_order_desc(category)
    joins("INNER JOIN categories ON categories.id = tests.category_id").where("categories.title = ?", category).\
    order('title DESC')
  end
end
