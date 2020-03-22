class Question < ApplicationRecord
  validates :body, presence: true

  belongs_to :test
  has_many :gists, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :test_progresses, foreign_key: :current_question_id, dependent: :destroy
end
