module QuestionsHelper
  QUESTIONS_HEADERS = {
    new: -> (test_title) { "Create new #{test_title} question" },
    edit: -> (test_title) { "Edite #{test_title} question" }
  }

  def question_header_for(action)
    QUESTIONS_HEADERS[action].call(@question.test.title)
  end
end
