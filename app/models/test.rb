class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions
  has_many :test_progresses
  has_many :users, through: :test_progresses

  def self.display_tests_title_by_desc(category)
    Test.joins(:category)
      .where(categories: { title: category })
      .order(title: :DESC)
      .pluck(:title)
  end
end
