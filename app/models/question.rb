class Question < ApplicationRecord
  validates :body, presence: true
  validates :answers, length: { in: 0..5 }

  belongs_to :test
  has_many :answers
  has_many :test_progresses
end
