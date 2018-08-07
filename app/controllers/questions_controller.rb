class QuestionsController < ApplicationController
  before_action :select_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions.pluck('body')
    render inline: '<%= @questions %>'
  end

  def show
    @question = @test.questions.find(params[:id]).body
    render inline: 'Question:    <%=  @question %>'
  end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.create!(question_params)
    render plain: @question.inspect
  end

  def destroy
    @test.destroy
    redirect_to root_path
  end

  private

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
