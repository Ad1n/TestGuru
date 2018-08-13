module QuestionsHelper

  def question_header(test, question)
    question.persisted? ? "Edit #{question.test.title} question" :
                          "Create #{test.title} question"

  end
end
