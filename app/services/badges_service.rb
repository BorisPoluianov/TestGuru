class BadgesService
  RULES = [
      [I18n.t('badges.category_passed'), 1],
      [I18n.t('badges.first_attempt'), 2],
      [I18n.t('badges.level_passed'), 3]
    ]

  def initialize(test_progress)
    @test_progress = test_progress
    @user = test_progress.user
  end

  def call
    Badge.find_each do |badge|
      case badge.rule
      when '1'
        add_badge!(badge) if category_tests_passed?(badge.rule_parameter)
      when '2'
        add_badge!(badge) if passed_with_first_attempt?(badge.rule_parameter)
      when '3'
        add_badge!(badge) if tests_level_passed?(badge.rule_parameter)
      end
    end
  end

  private

  def add_badge!(badge)
    @user.badges << badge
  end

  def category_tests_passed?(category)
    if @test_progress.test.category.title == category
      ids_of_category_tests = Test.available_tests.by_category(category).distinct.pluck(:id)
      ids_of_passed_tests_by_user = TestProgress.passed_tests(@user).pluck(:test_id)
      ids_of_passed_tests_by_user & ids_of_category_tests == ids_of_category_tests
    end
  end

  def passed_with_first_attempt?(title)
    if @test_progress.test.title == title && @test_progress.passed
      TestProgress.all.where(test_id: @test_progress.test_id, user_id: @user.id).count == 1
    end
  end

  def tests_level_passed?(level)
    level = level.to_i
    if @test_progress.test.level == level && @test_progress.passed
      ids_of_passed_tests = TestProgress.passed_tests(@user).pluck(:test_id)
      ids_of_tests_by_level = Test.level(level)
      ids_of_passed_tests & ids_of_tests_by_level = ids_of_tests_by_level
    end
  end
end
