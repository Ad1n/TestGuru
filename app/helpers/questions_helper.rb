module QuestionsHelper

  def question_header
    action_name == "new" ? "Create #{@test.title} question" :
                           "Edit #{@question.test.title} question"
  end
end
