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

  def check_for_badges(user_id)
    user.badges.push(set_badges.find_by(title: "#{test.level}")) if rule_all_such_level?(user_id)
    user.badges.push(set_badges.find_by(title: "С первой попытки !")) if rule_first_attempt?(user_id)
    user.badges.push(set_badges.find_by(title: "Backend на 100%")) if rule_all_backend?(user_id)
  end

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

  # Rules for user badges ==============================================================================================

  def rule_first_attempt?(user_id)
    TestPassage.where(user_id: user_id, test_id: test.id).count == 1
  end

  def rule_all_such_level?(user_id)
    # Select all tests with level like in current test
    tests = Test.where(level: test.level).ids.map(&:to_s)
    # Select all user's test passages
    tp_such_level = TestPassage.where(test_id: tests,
                                          current_question_id: nil,
                                          user_id: user_id).pluck(:test_id).map(&:to_s)
    (tests & tp_such_level == tests) & tests.any?
  end

  def rule_all_backend?(user_id)
    # Select category id with title backend
    category_backend_id = Category.where(title: "Backend")
    # Select all tests ids with category backend
    tests_backend = Test.where(category_id: category_backend_id).ids.map(&:to_s)
    #Select all backend test passages for current user
    user_tp_backend = TestPassage.where(test_id: tests_backend,
                                        current_question_id: nil,
                                        user_id: user_id).pluck(:test_id).map(&:to_s)
    (tests_backend & user_tp_backend == tests_backend) & tests_backend.any?
  end

  # ====================================================================================================================
end
