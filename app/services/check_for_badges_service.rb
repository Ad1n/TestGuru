class CheckForBadgesService

  attr_accessor :badge_user, :test_passage

  def initialize(user_id, current_test_passage)
    @badge_user = user_id
    @test_passage = current_test_passage
  end

  def check_for_badges
    history = []
    if test_passage.passed?
      Badge.all.each do |b|
        # History is for avoid double or more one type badges in one time through test passage
        next if history.include?(b.badge_rule.rule)
        send("add_badge_#{b.badge_rule.rule}".to_sym) if send("rule_passed_#{b.badge_rule.rule}?".to_sym)
        history += [b.badge_rule.rule]
      end
    end
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
    TestPassage.user_attempts_in_test(badge_user, test_passage.test.id) == 1
  end

  def rule_passed_all_such_level?
    # Select all tests with level like in current test
    tests = Test.by_current_level(test_passage.test.level).ids.map(&:to_s)
    # Select all user's test passages
    tp_such_level = TestPassage.all_tp_by_current_level(tests, badge_user).pluck(:test_id).map(&:to_s)
    (tests & tp_such_level == tests) & tests.any?
  end

  def rule_passed_all_backend?
    # Select all tests ids with category backend
    tests_backend_id = Test.backend_tests.ids.map(&:to_s)
    #Select all backend test passages for current user
    user_tp_backend_id = TestPassage.backend_passed_tests(badge_user, tests_backend_id).pluck(:test_id).map(&:to_s)
    (tests_backend_id & user_tp_backend_id == tests_backend_id) & tests_backend_id.any?
  end

end
