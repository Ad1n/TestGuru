class Category < ApplicationRecord
  default_scope { order(title: :asc) }

  has_many :tests

  validates :title, presence: true

  scope :backend, ->{ where(title: "Backend") }
end
