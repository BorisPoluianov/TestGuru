class Answer < ApplicationRecord
  validates :body, presence: true
  validate :answers_max_validation
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  private

  def answers_max_validation
      errors.add(:body) if (1..4) === Answer.where(question_id: question_id).count
  end
end
