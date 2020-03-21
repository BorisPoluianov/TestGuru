class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  validates :first_name, :last_name, presence: true

  has_many :feedbacks
  has_many :gists
  has_many :test_progresses
  has_many :tests, through: :test_progresses
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id

  def display_tests_by_level(level)
    Test.joins(:test_progresses)
      .where(level: level, test_progresses: { user_id: self.id })
  end

  def test_progress(test)
    test_progresses.order(created_at: :desc).find_by(test_id: test.id)
  end

  def full_name
    first_name + ' ' + last_name
  end

  def admin?
    self.is_a?(Admin)
  end
end
