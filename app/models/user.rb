class User < ApplicationRecord
  has_many :tests
  has_many :tests, through: :test_progresses
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id

  def display_tests_by_level(level)
    Test.joins(:test_progresses)
      .where(level: level, test_progresses: { user_id: self.id })
  end
end
