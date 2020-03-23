class Test < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: {
    scope: :level, message: "title and level should be unique"
  }
  validates :level, numericality: {
    only_integer: true, greater_or_equal_to: 0
  }


  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions, dependent: :destroy
  has_many :test_progresses, dependent: :destroy
  has_many :users, through: :test_progresses

  scope :level, -> (level) { where(level: level) }
  scope :junior_level, -> { level(0..1) }
  scope :middle_level, -> { level(2..4) }
  scope :senior_level, -> { level(5..30) }
  scope :thor_heyerdahl_level, -> { level(30..Float::INFINITY) }
  scope :by_category, -> category {
    joins(:category)
    .where(categories: { title: category })
  }
  scope :available_tests, -> {
    includes(questions: :answers)
    .where.not(questions: { id: nil }, answers: { id: nil })
  }


  def self.display_tests_title_by_desc(category)
    by_category(category)
      .order(title: :DESC )
      .pluck(:title)
  end
end
