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
      passed_count = TestProgress.passed.where(user_id: @user.id)
                            .pluck('DISTINCT test_id')
                            .count
      passed_count.remainder(Test.by_category(category).count).zero?
    end
  end

  def by_first_attempt?(title)
    @user.tests.where(title: title).count == 1 #if @test_progress.test.title == title
  end

  def by_level?(level)
    level = level.to_i
    if @test_progress.test.level == level.to_i
      tests_count = Test.level(level).count
      user_tests_count = TestProgress.passed.includes(:test)
        .where( user_id: @user.id, tests: { level: level }).count
      user_tests_count.remainder(tests_count).zero?
    end
  end
end
