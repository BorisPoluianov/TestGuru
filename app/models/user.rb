class User < ApplicationRecord
  has_many :tests
  has_many :test_progresses

  def display_tests_by_level(level)
    Test.joins(:test_progresses)
      .where(level: level, test_progresses: { user_id: self.id })
  end
end
