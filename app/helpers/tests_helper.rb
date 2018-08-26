module TestsHelper

  TEST_LEVELS = { 0 => I18n.t('tests_helper.level.elementary'),
                  1 => I18n.t('tests_helper.level.easy'),
                  2 => I18n.t('tests_helper.level.advanced'),
                  3 => I18n.t('tests_helper.level.hard') }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || I18n.t('tests_helper.level.hero')
  end

end
