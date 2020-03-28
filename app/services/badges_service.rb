class BadgesService
  def self.rule_types
    {
      by_category: I18n.t('badges.category_passed'),
      by_first_attempt: I18n.t('badges.first_attempt'),
      by_level: I18n.t('badges.level_passed')
    }
  end

  def self.options
    rule_types.map(&:reverse)
  end

  def initialize(test_progress)
    @test_progress = test_progress
    @user = test_progress.user
  end

  def call
    Badge.find_each do |badge|
      @user.badges << badge if send("#{badge.rule}?", badge.rule_parameter)
    end
  end

  private

  def by_category?(category)
    if @test_progress.test.category.title == category
      category_tests_ids = Test.available_tests.by_category(category).distinct.pluck(:id)
      passed_category_tests_ids = TestProgress.passed.where(user_id: @user.id,
        test_id: category_tests_ids).pluck(:test_id).sort
      multiple?(category_tests_ids, passed_category_tests_ids)
    end
  end

  def by_first_attempt?(_title)
    @user.tests.where(title: @test_progress.test.title).count == 1
  end

  def by_level?(level)
    level = level.to_i
    if @test_progress.test.level == level.to_i
      level_tests_ids = Test.available_tests.level(level).distinct.pluck(:id)
      passed_tests_ids = TestProgress.passed.where( user_id: @user.id,
        test_id: level_tests_ids).pluck(:test_id).sort
      multiple?(level_tests_ids, passed_tests_ids)
    end
  end

  def multiple?(tests_ids, passed_tests_ids)
    multiple = tests_ids.map do |v|
      passed_tests_ids.select.count { |i| i == v }
    end
    multiple.all?(multiple.min)
  end
end
