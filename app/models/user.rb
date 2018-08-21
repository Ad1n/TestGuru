class User < ApplicationRecord
  # has_many :passed_test_logs
  # has_many :tests, through: :passed_test_logs

  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :email, presence: true,
                    format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
                    uniqueness: true
  validates :name, presence: true

  has_secure_password

  def passed_tests(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
