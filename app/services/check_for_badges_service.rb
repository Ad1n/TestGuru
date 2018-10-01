class CheckForBadgesService

  attr_reader :badge_user, :test_passage, :confirmed_badges_for_user

  def initialize(user, current_test_passage)
    @badge_user = user
    @test_passage = current_test_passage
  end

  def call
    return unless test_passage.passed?
    @confirmed_badges_for_user = []
    history = {}
    Badge.all.each do |b|
      # History is for avoid double or more one type badges in one time through test passage
      next if history[b.rule] == b.rule_param
      confirmed_badges_for_user << b if send("rule_passed_#{b.rule}?".to_sym, b.rule_param)
      history[b.rule] = b.rule_param
    end
    confirmed_badges_for_user
  end

  private

  def rule_passed_by_first_attempt?(param)
    TestPassage.where(user_id: badge_user.id, test_id: test_passage.test.id).count == 1
  end

  def rule_passed_all_such_level?(level)
    # Select all tests with level like in current test
    tests = Test.by_current_level(level).ids.map(&:to_s)
    # Select all user's test passages
    tp_such_level = badge_user.test_passages.finished.where(test_id: tests).pluck(:test_id).map(&:to_s)
    tests.any? && tests.sort == tp_such_level.sort
  end

  def rule_passed_all_by_category?(category)
    # Select all tests ids with category backend
    tests_backend_id = Test.by_category(category).ids.map(&:to_s)
    # Select all backend test passages for current user
    user_tp_backend_id = badge_user.test_passages.finished.where(test_id: tests_backend_id).pluck(:test_id).map(&:to_s)
    tests_backend_id.any? && tests_backend_id.sort == user_tp_backend_id.sort
  end
end
