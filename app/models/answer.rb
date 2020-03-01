class Answer < ApplicationRecord
  validates :body, presence: true
  validates_associated :question, on: :create

  belongs_to :question

  scope :correct, -> { where(correct: true) }
end
