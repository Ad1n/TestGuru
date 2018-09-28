class BadgeRule < ApplicationRecord

  has_many :badges

  scope :backend, -> { where(title: "Успешно пройдены все тесты категории Backend") }
  scope :first_attempt, -> { where(title: "Успешно пройден тест с первой попытки") }
  scope :by_such_level, ->(level) { where(title: "Успешно пройдены тесты уровня #{level}") }

end
