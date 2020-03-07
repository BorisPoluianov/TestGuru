module QuestionsHelper

  def question_header(question)
    if question.persisted?
      t('.header', title: question.test.title)
    else
      t('.header', title: question.test.title)
    end
  end
end
