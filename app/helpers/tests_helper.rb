module TestsHelper

  TEST_LEVELS = { 0 => I18n.t('tests_helper.level.elementary'),
                  1 => I18n.t('tests_helper.level.easy'),
                  2 => I18n.t('tests_helper.level.advanced'),
                  3 => I18n.t('tests_helper.level.hard') }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || I18n.t('tests_helper.level.hero')
  end

  def has_timer?(test)
    test.test_time.hour != 0 || test.test_time.min != 0 || test.test_time.sec != 0
  end

end
