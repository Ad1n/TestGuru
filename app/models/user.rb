class User < ApplicationRecord
  has_many :passed_test_logs
  has_many :tests, through: :passed_test_logs

  validates :email, presence: true

  def passed_tests(level)
    tests.where(level: level)
  end
end
