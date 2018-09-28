class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_first_question, on: :create
  before_validation :set_next_current_question_id, on: :update

  def accept!(answer_ids)
    increment!(:correct_questions) if correct_answer?(answer_ids)
    save!
  end

  def progress_by_percents
    (((test.questions.ids.find_index(current_question.id)) * 100) / test.questions.count).round(0)
  end

  def completed?
    current_question.nil?
  end

  def passed_by_percents
    ((correct_questions.to_f * 100) / test.questions.count).round(0)
  end

  def passed?
    passed_by_percents.to_i >= 85
  end

  scope :user_attempts_in_test, ->(user_id, test_id) { where(user_id: user_id, test_id: test_id).count }
  scope :all_tp_by_current_level, ->(test_id, user_id) { where(test_id: test_id,
                                                               current_question_id: nil,
                                                               user_id: user_id) }
  scope :backend_passed_tests, ->(user_id, tests_id) { where(test_id: tests_id,
                                                            current_question_id: nil,
                                                            user_id: user_id) }

  private

  def set_badges
    @badges = Badge.all
  end

  def correct_answer?(answer_ids)
    # correct_answers_count = correct_answers.count
    # (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    #   correct_answers_count == answer_ids.count
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def set_next_current_question_id
    self.current_question = next_question
  end

end
