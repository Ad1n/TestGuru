class Test < ApplicationRecord
  belongs_to :category
  has_many :questions

  has_many :logs
  has_many :users, through: :logs

  def self.by_categories_desk(category)
    # category = Category.where(title: category).pluck(:id)
    # where(category_id: category).order("title DESC").pluck(:title)
    Category.where(title: category)[0].tests.order('title DESC')
  end
end
