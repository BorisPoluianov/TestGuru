class User < ApplicationRecord
  has_many :test_progresses
  has_many :tests, through: :test_progresses
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id

  validates :email,
    format: { with: URI::MailTo::EMAIL_REGEXP },
    uniqueness: true
  validates :password, presence: true

  has_secure_password

  def display_tests_by_level(level)
    Test.joins(:test_progresses)
      .where(level: level, test_progresses: { user_id: self.id })
  end

  def test_progress(test)
    test_progresses.order(created_at: :desc).find_by(test_id: test.id)
  end
end
