module QuestionsHelper

  def question_header
    question = Question.find(params[:id]) if action_name == 'edit'
    test = Test.find(params[:test_id]) if action_name == 'new'
    question.nil? ? "Create #{test.title} question" :
                    "Edit #{question.test.title} question"
  end
end
