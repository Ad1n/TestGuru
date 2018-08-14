module QuestionsHelper

  def question_header(question)
    question.persisted? ? "Edit #{question.test.title} question" :
                          "Create #{question.test.title} question"

  end
end
