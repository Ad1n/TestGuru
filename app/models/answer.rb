class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_max_answers_to_question, on: :create

  scope :correct, -> { where(correct: true) }
  # scope :all_question_ids, -> { all.select('question_id').to_ary.map(&:question_id) }

  def validate_max_answers_to_question
    # errors.add(:question_id, "too many answers! Number of allowed is 4") \
    # if question.answers.all_question_ids.count(question_id.to_i) >= 4
    errors.add(:question_id, "too many answers! Number of allowed is 4") \
    if question.answers.count >= 4
  end
end
