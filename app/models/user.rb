class User < ApplicationRecord
  has_many :logs
  has_many :tests, through: :logs

  def passed_tests(level)
    tests.where(level: level)
  end
end
