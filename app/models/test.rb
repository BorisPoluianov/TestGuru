class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :test_progresses
  has_many :users

  def self.display_tests_title_by_desc(category)
    Test.joins(:category)
      .where(categories: { title: category })
      .order(title: :DESC)
      .pluck(:title)
  end
end
