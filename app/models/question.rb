class Question < ApplicationRecord
  belongs_to :test
  has_many :answers
  has_one :gist

  validates :body, presence: true
end
