class QuestionsController < ApplicationController
  before_action :select_test, only: %i[index create new]
  before_action :select_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions.pluck('body')
    render inline: '<%= @questions %>'
  end

  def show
    render inline: 'Question:    <%=  @question.body %>'
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.create!(question_params)
    render plain: @question.inspect
  end

  def destroy
    @question.destroy
    redirect_to root_path
  end

  private

  def select_question
    @question = Question.find(params[:id])
  end

  def select_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found = ('
  end
end
