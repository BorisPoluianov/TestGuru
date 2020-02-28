module QuestionsHelper

  def question_header(question)
    if question.persisted?
      "Edite #{question.test.title} question"
    else
      "Create new #{question.test.title} question"
    end
  end
end
