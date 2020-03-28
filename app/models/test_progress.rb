class TestProgress < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_save :before_save_set_question
  before_update :before_update_set_passed

  scope :passed, -> {
    where(passed: true)
  }

  MIN_RESULT = 85

  def test_passed?
    result >= MIN_RESULT
  end

  def result
    (100 * self.questions_passed) / test.questions.count
  end

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.questions_passed += 1 if correct_answer?(answer_ids)
    save!
  end

  def current_question_number
    test.questions.count - next_questions.count
  end

  private

  def before_save_set_question
    self.current_question =
      if self.current_question.nil?
        test.questions.first
      else
        next_question
      end
  end

  def before_update_set_passed
    self.passed = test_passed? if completed?
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    answer_ids &&
      correct_answers_count == correct_answers.where(id: answer_ids).count &&
      correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    next_questions.first
  end

  def next_questions
    test.questions.order(:id).where('id > ?', current_question.id)
  end
end
