class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions
  has_many :test_progresses
  has_many :users, through: :test_progresses

  scope :level, -> { where(level: true) }
  scope :junior_level, -> { where(level: 0..1) }
  scope :middle_level, -> { where(level: 2..4) }
  scope :senior_level, -> { where(level: 5..30) }
  scope :thor_heyerdahl_level, -> { where(level: 30..Float::INFINITY)}
  scope :by_category, -> (category) {
    joins(:category)
    .where(categories: { title: category} )
    .order(title: :ASC)
  }

  def self.display_tests_title_by_desc(category)
    Test.by_category(category).pluck(:title).reverse
  end
end
