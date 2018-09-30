class CheckForBadgesService

  attr_reader :badge_user, :test_passage, :confirmed_badges_for_user

  def initialize(user, current_test_passage)
    @badge_user = user
    @test_passage = current_test_passage
  end

  def get_badges
    confirmed_badges_for_user.each do |b|
      if b.rule == "all_by_category"
        send("add_badge_#{b.rule_param}".to_sym)
      else
        send("add_badge_#{b.rule}".to_sym)
      end
    end
  end

  def call
    @confirmed_badges_for_user = []
    return unless test_passage.passed?
    history = []
    Badge.all.each do |b|
      # History is for avoid double or more one type badges in one time through test passage
      next if history.include?(b.rule)
      if b.rule == "all_by_category"
        confirmed_badges_for_user.push(b) if send("rule_passed_#{b.rule_param}?".to_sym)
      else
        confirmed_badges_for_user.push(b) if send("rule_passed_#{b.rule}?".to_sym)
      end
      history += [b.rule]
    end
    confirmed_badges_for_user
  end

  private

  def add_badge_by_first_attempt
    test_passage.user.badges.push(Badge.first_attempt_badge)
  end

  def add_badge_all_backend
    test_passage.user.badges.push(Badge.backend_badge)
  end

  def add_badge_all_such_level
    test_passage.user.badges.push(Badge.by_such_level_badge(test_passage.test.level))
  end

  def rule_passed_by_first_attempt?
    TestPassage.where(user_id: badge_user.id, test_id: test_passage.test.id).count == 1
  end

  def rule_passed_all_such_level?
    # Select all tests with level like in current test
    tests = Test.by_current_level(test_passage.test.level).ids.map(&:to_s)
    # Select all user's test passages
    tp_such_level = badge_user.test_passages.finished.where(test_id: tests).pluck(:test_id).map(&:to_s)
    # (tests & tp_such_level == tests) & tests.any?
    tests.any? && tests.sort == tp_such_level.sort
  end

  def rule_passed_all_backend?
    # Select all tests ids with category backend
    tests_backend_id = Test.by_category("Backend").ids.map(&:to_s)
    # Select all backend test passages for current user
    user_tp_backend_id = badge_user.test_passages.finished.where(test_id: tests_backend_id).pluck(:test_id).map(&:to_s)
    # (tests_backend_id & user_tp_backend_id == tests_backend_id) & tests_backend_id.any?
    tests_backend_id.any? && tests_backend_id.sort == user_tp_backend_id.sort
  end

end
