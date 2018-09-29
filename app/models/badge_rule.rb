class BadgeRule < ApplicationRecord

  has_many :badges

  # scope :backend, -> { where(title: "Успешно пройдены все тесты категории Backend") }
  # scope :first_attempt, -> { where(title: "Успешно пройден тест с первой попытки") }
  # scope :by_such_level, ->(level) { where(title: "Успешно пройдены тесты уровня #{level}") }

  scope :backend, -> { where(rule: "all_backend") }
  scope :first_attempt, -> { where(rule: "by_first_attempt") }
  scope :by_such_level, ->(level) { where(rule_param: level.to_s) }

end
