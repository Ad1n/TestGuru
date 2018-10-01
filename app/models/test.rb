class Test < ApplicationRecord

  before_destroy :del_tp

  belongs_to :category
  has_many :questions, dependent: :destroy

  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages, dependent: :destroy

  belongs_to :author, class_name: 'Admin', foreign_key: 'user_id'

  validates :title, presence: true,
                    uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  scope :by_categories_order_desc, ->(category) { joins(:category).\
                                                  where(categories: { title: category }).order(title: :desc) }

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_current_level, ->(level) { where(level: level) }
  scope :by_category, ->(category) { joins(:category).where(categories: { title: category }) }

  private

  def del_tp
    test_passages.destroy_all
  end

end
