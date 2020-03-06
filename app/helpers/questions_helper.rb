module QuestionsHelper

  def question_header(question)
    if question.persisted?
      t('.header_edit', title: question.test.title)
    else
      t('.header_new', title: question.test.title)
    end
  end
end
