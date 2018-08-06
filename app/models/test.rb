class Test < ApplicationRecord
  belongs_to :category
  has_many :questions

  has_many :passed_test_logs
  has_many :users, through: :passed_test_logs
  has_many :users

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  validates :title, presence: true,
                    uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  # def self.by_categories_order_desc(category)
    # joins("INNER JOIN categories ON categories.id = tests.category_id").where("categories.title = ?", category).\
    # order('title DESC')

  #   joins(:category).where(categories: { title: category }).order(title: :desc)
  # end

  scope :by_categories_order_desc, ->(category) { joins(:category).\
                                                  where(categories: { title: category }).order(title: :desc) }

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
end
